# Riot Client Auto Login

A script to automatically launch and log into Riot games (League of Legends or VALORANT) using stored credentials.

## Setup

1. Create login profile files in the `logins` directory using the following format:
```
GAME=lol
GAMEUSER=yourusername
GAMEPWD=yourpassword
```

Replace:
- `GAME` with either `lol` (for League of Legends) or `val` (for VALORANT)
- `yourusername` with your game account username
- `yourpassword` with your game account password

You can create multiple profile files in the `logins` directory, each with different credentials.

## Usage

1. Run `starter.bat`
2. You'll see a list of available login profiles from the `logins` directory
3. Enter the number of the profile you want to use
4. The script will:
   - Close any running Riot clients
   - Clear existing login data
   - Launch the selected game with the live patchline
   - Automatically log in using the selected profile's credentials

## Example Profile Files

Two template profiles are provided as examples:

`template_a`:
```
GAME=lol
GAMEUSER=testuser1
GAMEPWD=1234567890
```

`template_b`:
```
GAME=val
GAMEUSER=testuser2
GAMEPWD=1234567890
```

Copy these templates and modify them with your actual credentials.

## Requirements

- Windows operating system
- Riot Client installed in the default location (C:\Riot Games\Riot Client)
- PowerShell (comes pre-installed with Windows)
