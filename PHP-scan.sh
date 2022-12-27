#!/bin/bash

# Set up the patterns to search for
patterns=(
    "base64_decode"
    "eval("
    "preg_replace"
    "system("
    "exec("
    "passthru("
    "shell_exec("
    "eval("
    "base64_decode"
    "assert("
    "create_function"
)

# Scan the entire server for malicious PHP files
for pattern in "${patterns[@]}"; do
    grep -rl "$pattern" / --include \*.php
done

# Check if any files were found
if [ $? -eq 0 ]; then
    # No malicious files were found
    echo "No malicious PHP files were found."
else
    # Malicious files were found
    echo "Malicious PHP files were found!"
fi
