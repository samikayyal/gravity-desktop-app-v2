# Gravity Desktop App v2 - Scaffold Verification Script
# Runs code generation, formatting, static analysis, and the test suite.

Write-Host "=== Starting Scaffold Verification ===" -ForegroundColor Cyan

Write-Host "`n1. Running Code Generation (build_runner)..." -ForegroundColor Yellow
flutter pub run build_runner build --delete-conflicting-outputs
if ($LASTEXITCODE -ne 0) {
    Write-Host "[-] Code generation failed!" -ForegroundColor Red
    exit 1
}
Write-Host "[+] Code generation completed successfully." -ForegroundColor Green

Write-Host "`n2. Running Code Formatting Verification..." -ForegroundColor Yellow
dart format --set-exit-if-changed .
if ($LASTEXITCODE -ne 0) {
    Write-Host "[-] Formatting validation failed! Please run 'dart format .' to format files." -ForegroundColor Red
    exit 1
}
Write-Host "[+] Code formatting is clean." -ForegroundColor Green

Write-Host "`n3. Running Static Code Analysis..." -ForegroundColor Yellow
flutter analyze
if ($LASTEXITCODE -ne 0) {
    Write-Host "[-] Static analysis failed! Please fix all lint warnings and errors." -ForegroundColor Red
    exit 1
}
Write-Host "[+] Static analysis passed successfully with zero issues." -ForegroundColor Green

Write-Host "`n4. Running Unit and Widget Test Suite..." -ForegroundColor Yellow
flutter test
if ($LASTEXITCODE -ne 0) {
    Write-Host "[-] One or more tests failed!" -ForegroundColor Red
    exit 1
}
Write-Host "[+] All tests passed successfully!" -ForegroundColor Green

Write-Host "`n=== Scaffold Verification Completed Successfully ===" -ForegroundColor Green
exit 0
