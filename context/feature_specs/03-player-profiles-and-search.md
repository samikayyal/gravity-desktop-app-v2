# Player Profiles And Search

## Purpose

Create durable player records that employees can find quickly without treating
names or phone numbers as identity. Player data must remain useful for future
sessions, debt lookup, reporting, and historical snapshots.

## Build Notes

- Each player uses an internal permanent `player_id`.
- Required fields are full name, at least one phone number, and age as an
  integer.
- Phone numbers are editable and not unique.
- No family/account model is included in v1.
- Store editable notes/history fields when useful for front-desk lookup.

## Data, Domain, And Storage

- Store player profiles in SQLite.
- Store one or more phone numbers per player.
- Use inactive/void status rather than normal permanent deletion.
- Store session snapshots of player name, age, and primary phone at check-in
  so historical reports do not change when the profile is edited later.
- Player records must not be identified by name or phone number.

## UI And Workflow

- The employee can create a player with full name, at least one phone number,
  and age, then immediately check that player in.
- Search by player name and show enough context for manual selection: age,
  phone numbers, previous sessions, and debt warnings.
- Player edit forms validate required fields inline.
- Similar names must remain distinguishable without relying on phone uniqueness.

## Edge Cases And Rules

- A player with old debt can check in again, but the employee must see a clear
  debt warning.
- Editing a profile must not rewrite historical session snapshots.
- Normal workflows must not permanently delete player-linked business records.
- Anonymous product sales are allowed, but anonymous debt is not because debt
  must attach to a saved player.

## Tests And Verification

- Test required full name, age, and at least one phone number.
- Test duplicate phone numbers across different players.
- Test search result context for similar names.
- Test profile edits preserving historical session snapshots.
- Test soft deletion or void behavior.
- Add repository tests for player and phone persistence once schema exists.

## What success looks like

- Employees can reliably create, edit, and find players using front-desk data.
- `player_id` is the only durable player identity.
- Similar players are distinguishable during search.
- Historical sessions and reports remain stable after profile edits.

