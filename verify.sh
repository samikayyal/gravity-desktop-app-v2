#!/bin/bash
# Gravity Desktop App v2 - Scaffold Verification Script
# Runs code generation, formatting, static analysis, and the test suite.

set -e

echo -e "\033[0;36m=== Starting Scaffold Verification ===\033[0m"

echo -e "\n\033[0;33m1. Running Code Generation (build_runner)...\033[0m"
flutter pub run build_runner build --delete-conflicting-outputs
if [ $? -ne 0 ]; then
    echo -e "\033[0;31m[-] Code generation failed!\033[0m"
    exit 1
fi
echo -e "\033[0;32m[+] Code generation completed successfully.\033[0m"

echo -e "\n\033[0;33m2. Running Code Formatting Verification...\033[0m"
dart format --set-exit-if-changed .
if [ $? -ne 0 ]; then
    echo -e "\033[0;31m[-] Formatting validation failed! Please run 'dart format .' to format files.\033[0m"
    exit 1
fi
echo -e "\033[0;32m[+] Code formatting is clean.\033[0m"

echo -e "\n\033[0;33m3. Running Static Code Analysis...\033[0m"
flutter analyze
if [ $? -ne 0 ]; then
    echo -e "\033[0;31m[-] Static analysis failed! Please fix all lint warnings and errors.\033[0m"
    exit 1
fi
echo -e "\033[0;32m[+] Static analysis passed successfully with zero issues.\033[0m"

echo -e "\n\033[0;33m4. Running Unit and Widget Test Suite...\033[0m"
flutter test
if [ $? -ne 0 ]; then
    echo -e "\033[0;31m[-] One or more tests failed!\033[0m"
    exit 1
fi
echo -e "\033[0;32m[+] All tests passed successfully!\033[0m"

echo -e "\n\033[0;32m=== Scaffold Verification Completed Successfully ===\033[0m"
exit 0
