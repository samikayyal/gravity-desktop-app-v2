import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class EnvConfig {
  /// Loads the gitignored local `.env` configuration file from the filesystem.
  ///
  /// Searches:
  /// 1. A custom path if specified.
  /// 2. The Application Support directory (for installed production execution).
  /// 3. The current working directory (development/repository root fallback).
  static Future<void> initialize({String? customPath}) async {
    try {
      File? envFile;
      if (customPath != null) {
        envFile = File(customPath);
      } else {
        // 1. Try to find the .env file in the Application Support directory (Production)
        try {
          final appSupportDir = await getApplicationSupportDirectory();
          final appSupportEnv = File(p.join(appSupportDir.path, '.env'));
          if (await appSupportEnv.exists()) {
            envFile = appSupportEnv;
          }
        } catch (e) {
          // Gracefully ignore path provider exceptions (e.g. in headless unit/widget tests)
          debugPrint('Path provider not available (normal in raw tests): $e');
        }

        // 2. Fallback to current working directory (Development/Repository root)
        if (envFile == null) {
          final devEnv = File('.env');
          if (await devEnv.exists()) {
            envFile = devEnv;
          }
        }
      }

      if (envFile != null && await envFile.exists()) {
        final content = await envFile.readAsString();
        dotenv.testLoad(fileInput: content);
        debugPrint(
          'Local .env loaded successfully from: ${envFile.absolute.path}',
        );
      } else {
        debugPrint('Warning: Local .env file could not be found.');
      }
    } catch (e) {
      debugPrint('Error loading .env from local filesystem: $e');
    }
  }

  /// The GCP Cloud Storage bucket name for backups.
  static String get gcpBucketName => dotenv.env['GCP_BUCKET_NAME'] ?? '';

  /// The GCP Service Account Credentials JSON string.
  static String get gcpCredentialsJson =>
      dotenv.env['GCP_CREDENTIALS_JSON'] ?? '';
}
