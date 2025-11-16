This is a simple, yet secure, interactive Bash script designed to generate unique, cryptographically-strong passwords on any Linux environment (including Red Hat, CentOS, Fedora, or Kali).

It uses the built-in `openssl` utility for high-quality randomness and securely logs the generated passwords to a local file.

## Features

  * **Interactive Prompts:** Asks for desired password length and character set.
  * **Security:** Uses `openssl` for true random number generation.
  * **Logging:** Automatically saves generated passwords with timestamps and length to `passwords.txt`.
  * **Character Sets:** Supports a base set (letters, numbers) and a robust set (including special symbols).

## Prerequisites

You must have the following package installed on your Linux system:

  * `openssl`

## How to Install and Run

1.  **Download the script** (or copy the contents) and save it as `password_generator.sh`.

2.  **Set Execute Permissions:** You need to mark the file as executable.

    ```bash
    chmod +x password_generator.sh
    ```

3.  **Run the script:**

    ```bash
    ./password_generator.sh
    ```

### Usage Example

```
$ ./password_generator.sh
--- Secure Password Generator ---
Enter the desired password length (10-60 recommended): 20
Include special symbols for maximum security? (y/n): y
Using robust character set (letters, numbers, and symbols).
Generating a 20 character secure password...
------------------------------------------------------
Generated Password (saved to passwords.txt):
T*w9Zk#pE+s!jG@b4uF7
------------------------------------------------------
Done. Check 'passwords.txt' for the log.
```

## Log File

The generated passwords are saved to a file named `passwords.txt` in the same directory. This file is intentionally excluded from Git commits via the `.gitignore` file for security.
