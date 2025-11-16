#!/bin/bash

    # A secure, interactive, and file-logging random password generator for Linux.
    # Author: Gemini
    # License: MIT (See LICENSE file)

    # --- Configuration of Character Sets ---
    # 1. Base set (Letters and Numbers only)
    BASE_SET="A-Za-z0-9"

    # 2. Robust set (Includes symbols for maximum security)
    ROBUST_SET="A-Za-z0-9!@#$%^&*()_+-=[]{};:,.<>?"

    # Output file path where passwords will be logged
    OUTPUT_FILE="passwords.txt"

    # --- Function to generate and display the password ---
    generate_password() {
        echo "--- Secure Password Generator ---"
        
        # 1. Get Password Length from User
        while true; do
            read -r -p "Enter the desired password length (10-60 recommended): " PASS_LENGTH
            if [[ "$PASS_LENGTH" =~ ^[0-9]+$ ]] && [ "$PASS_LENGTH" -ge 10 ] && [ "$PASS_LENGTH" -le 60 ]; then
                break
            else
                echo "Invalid length. Please enter a number between 10 and 60."
            fi
        done

        # 2. Get Character Set Preference
        local CHAR_SET_FINAL
        while true; do
            read -r -p "Include special symbols for maximum security? (y/n): " INCLUDE_SYMBOLS
            case "$INCLUDE_SYMBOLS" in
                [Yy]* ) CHAR_SET_FINAL="$ROBUST_SET"; echo "Using robust character set (letters, numbers, and symbols)."; break;;
                [Nn]* ) CHAR_SET_FINAL="$BASE_SET"; echo "Using base character set (letters and numbers only)."; break;;
                * ) echo "Please answer yes (y) or no (n).";;
            esac
        done

        # 3. Generate the Password
        echo "Generating a $PASS_LENGTH character secure password..."
        
        # Using OpenSSL for reliable cryptographic randomness.
        local GENERATED_PASS
        GENERATED_PASS=$(openssl rand -base64 64 | tr -dc "$CHAR_SET_FINAL" | head -c "$PASS_LENGTH")
        
        # 4. Log and Display the Password
        local TIMESTAMP
        TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

        # Append the log entry to the output file
        echo "$TIMESTAMP | Length: $PASS_LENGTH | Password: $GENERATED_PASS" >> "$OUTPUT_FILE"

        echo "------------------------------------------------------"
        echo "Generated Password (saved to $OUTPUT_FILE):"
        # Display in a noticeable color (ANSI green)
        echo -e "\033[1;32m$GENERATED_PASS\033[0m" 
        echo "------------------------------------------------------"
    }

    # --- Execution Check ---
    # Check if openssl is installed before running
    if ! command -v openssl &> /dev/null
    then
        echo "Error: openssl is required but not installed."
        echo "Please install it using your distribution's package manager (e.g., sudo yum install openssl)."
        exit 1
    fi

    generate_password
