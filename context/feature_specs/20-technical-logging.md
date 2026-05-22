# Feature Specification: Technical Logging

## Purpose
Establish a high-reliability, local-first technical logging subsystem to capture application errors, database queries, and system events. This feature isolates technical developer logs from business audit databases, enforces strict regulatory compliance by automatically stripping customer Personal Identifiable Information (PII) at the logging boundary, handles automated local log file rotation, and manages silent background uploads to the cloud developer bucket.

---

## Build Notes

### Key Technologies
- **Flutter Windows File system (dart:io)**: For writing file streams to the local application data folder.
- **archive (Dart Package)**: For packaging and compressing rotated logs prior to background uploads.
- **http (Dart Package)**: For uploading log packages to a dedicated developer bucket in GCP.
- **Background Timer**: Non-blocking background worker that manages log uploads during cashier idle times.

### Folder Structure
- `lib/core/logging/`
  - `log_service.dart`: Core logging boundary offering `.info()`, `.warn()`, and `.error()` access.
  - `pii_redactor.dart`: Static regex processor that scans log strings and filters sensitive fields.
  - `log_rotator.dart`: Handles file sizes, renames, and local cleanup.
  - `log_upload_job.dart`: Background cloud uploader.

---

## Data/Domain/Storage

### Local File Boundaries
- Technical logs live strictly within the directory: `<appDataDir>\logs\`.
- **Authoritative Rule**: The logs folder **must** be excluded from standard database backup zip files to keep backups clean, lightweight, and focused purely on business databases.
- Log Files layout:
  - `app.log`: The active stream file.
  - `app.1.log`: The primary rotated archive.
  - `app.2.log`: The secondary rotated archive.
  - `app.3.log`: The tertiary rotated archive.

### Log Rotation Rules
- **Maximum File Size**: `5 MB` (Megabytes) per individual log file.
- **Maximum Rotated Archives**: `3` historical files.
- **Total Storage Envelope**: Maximum `20 MB` of disk footprint for technical logs.
- **Rotation Mechanics**:
  - When `app.log` exceeds `5 MB`, the system renames `app.2.log` to `app.3.log` (overwriting the old 3), renames `app.1.log` to `app.2.log`, renames `app.log` to `app.1.log`, and creates a brand new empty `app.log` to start streaming new records.

---

## UI and Workflow

### 1. Zero-Cashier UI Impact
- Technical logs are designed strictly for software debugging and system performance auditing.
- **Rule**: Standard cashiers **never** see log screens, raw code stack traces, or SQL error messages inside operational widgets.
- If a technical error occurs (e.g. database query failure, network timeout), the UI displays a clean, user-friendly cashier message: *"Transaction failed. Please try again or contact your administrator."* The detailed exception and stack trace are logged silently in the background to `app.log`.

### 2. Log Output Anatomy
Logs are structured as single-line JSON records to allow simple parsing by log viewer tools:

```json
{"timestamp":"2026-05-22T17:31:13.000Z","level":"error","module":"database","message":"Query execution failed on table 'sessions'","error_class":"SqliteException","stack_trace":"...[REDACTED_STACK]...","context":{"session_id":"sess_12345"}}
```

### 3. PII Redaction Filter Workflow

```mermaid
graph TD
    A[Logger Called: .error('Failed check-in for Samer, Phone: 0944111222')] --> B[PII Redactor Scanner]
    B --> C[Apply Name Filter Regex]
    C --> D[Apply Phone Filter Regex]
    D --> E[Apply Password Filter Regex]
    E --> F[Generate Redacted String: 'Failed check-in for [NAME_REDACTED], Phone: [PHONE_REDACTED]']
    F --> G[Write to app.log]
```

### 4. Background Log Upload Workflow
- Every **24 hours**, a background job triggers inside the app shell.
- The job checks if the network is online and if the system is currently idle (e.g., zero active check-outs in the last 15 minutes).
- If conditions match, it packages the inactive archives (`app.1.log`, `app.2.log`, `app.3.log`) into a compressed zip file: `logs_[installation_id]_[timestamp].zip`.
- The zip is uploaded to the secure developer GCP bucket folder `installation_logs/`.
- Once the upload returns success (HTTP 200), the system deletes the old rotated archives from local disk, keeping only the active `app.log`.

---

## Edge Cases and Rules

### 1. Absolute PII Stripping Guidelines
To ensure privacy compliance, the logging service must strip all sensitive customer data before it ever hits the disk:
- **Phone Numbers**: Any string matching standard Middle Eastern or international mobile phone patterns (e.g. `09xx-xxx-xxx` or `+963-xxx-xxx-xxx`) must be redacted to `[PHONE_REDACTED]`.
- **Customer Names**: The logging API must strictly reject customer name arguments. Standard messages must log the `player_id` (UUID) instead of the `full_name`. Any text parameter containing name keys is dynamically scrubbed: `[NAME_REDACTED]`.
- **Admin Password**: Any login or admin-password verification check must never log the parameter values. Password strings are stripped to `[PASSWORD_REDACTED]`.

### 2. Failure Integrity Guard
- **Problem**: If the logging service crashes (e.g., due to local disk fullness, folder permission issues), it must not crash the cashier application.
- **Rule**: If writing to the file system fails, the logging service falls back to basic console print outputs (`stdout`) and allows cashier checkouts and billing flows to proceed completely uninterrupted.

### 3. Safety Exclusions
- Local `.env` credential settings, encryption keys, and active user database fields are never logged.
- SQL query logs must replace the raw query parameter binds with generic question markers (`?`) to prevent logging data values.

---

## Tests and Verification

### Unit Tests (`test/domain/logging/`)
1. **PII Redaction Engine**:
   - Assert that logging `".info('Checked in Samer Kayyal phone +963944111222')"` produces `"Checked in [NAME_REDACTED] phone [PHONE_REDACTED]"` in the output stream.
   - Assert that logging a connection string containing the plaintext admin password replaces the password with `[PASSWORD_REDACTED]`.
2. **Log Rotator Sizes**:
   - Mock a file system output. Write 6 Megabytes of dummy text.
   - Assert that `app.log` splits, spawning `app.1.log` containing the first 5 Megabytes, and leaves the remaining 1 Megabyte in the active `app.log`.
   - Assert that at no time do more than 3 rotated files exist.

### Integration Tests (`test/data/logging/`)
1. **Robust Failure Handling**:
   - Mock a read-only environment where `<appDataDir>\logs\` is locked or write-protected.
   - Trigger multiple `.error()` entries. Verify that the app shell continues running without throwing unhandled exceptions, printing safely to system standard outputs.
2. **Background Upload Lifecycle**:
   - Mock an idle state with internet available. Assert that `app.1.log` is successfully compressed and sent to the cloud, and that local file cleanup completes post-upload.

---

## Acceptance Checklist

| ID | Requirement Details | Status |
|---|---|---|
| **LOG-01** | Logs are written locally to the isolated `<appDataDir>\logs\` folder. | [ ] |
| **LOG-02** | Active database backup packages completely exclude the `logs/` directory. | [ ] |
| **LOG-03** | Log rotation automatically splits files at `5 MB`, retaining at most 3 backups. | [ ] |
| **LOG-04** | All exceptions are caught silently behind cashier-friendly error dialogs. | [ ] |
| **LOG-05** | Customer names and mobile phone formats are stripped and replaced with redactor tokens. | [ ] |
| **LOG-06** | Plaintext admin passwords and SQL database variables are blocked from logging outputs. | [ ] |
| **LOG-07** | Log uploads run silently in the background and only when the system is idle. | [ ] |
| **LOG-08** | File writing failures failover safely to stdout, preventing cashier thread blocks. | [ ] |

---

## What Success Looks Like
A cashier is running checkout transactions under peak park traffic. Behind the scenes, the system writes dense transaction logs. At 4:00 PM, `app.log` crosses the `5 MB` boundary. Without blocking the UI thread or lagging the checkout screen for even a fraction of a millisecond, the rotator thread safely shifts the file indexes. Later, when the park closes and the system detects inactivity, it compresses the rotated log files, strips any accidental customer phone strings using regex, uploads the secure zip file to the developer GCP bucket, and purges local storage cleanly—leaving the desk computer responsive and optimized.
