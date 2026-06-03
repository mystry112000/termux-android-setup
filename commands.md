# All Termux Commands Reference

## Package Management

```bash
pkg update                    # Update package list
pkg upgrade                   # Upgrade all packages
pkg install <name>            # Install a package
pkg remove <name>             # Remove a package
pkg list-installed            # List installed packages
pkg search <keyword>          # Search packages
pkg show <name>               # Show package info
pkg files <name>              # Show package files
```

## File System

```bash
pwd                           # Current directory
ls -la                        # List files with details
cd <path>                     # Change directory
cp <src> <dst>                # Copy files
mv <src> <dst>                # Move/rename files
rm <file>                     # Delete file
rm -rf <dir>                  # Delete folder
mkdir <dir>                   # Create directory
cat <file>                    # View file content
nano <file>                   # Edit file (nano)
vim <file>                    # Edit file (vim)
chmod +x <file>               # Make file executable
chmod 755 <file>              # Set permissions
```

## Git

```bash
git clone <url>               # Clone repo
git init                      # Init repo
git add .                     # Stage all files
git commit -m "msg"           # Commit
git push origin main          # Push to remote
git pull origin main          # Pull from remote
git status                    # Check status
git log --oneline             # View commits
git checkout -b <branch>      # Create branch
```

## OpenCode AI

```bash
opencode                      # Start opencode
opencode --help               # Help
opencode --version            # Version
```

## Ollama (Local AI Models)

```bash
ollama list                   # List downloaded models
ollama pull <model>           # Download model
ollama run <model>            # Chat with model
ollama rm <model>             # Delete model
ollama serve                  # Start Ollama server
```

## Network

```bash
ping google.com               # Test connection
curl https://example.com      # HTTP request
wget <url>                    # Download file
ssh user@host                 # SSH connect
ifconfig                      # Network info
nmap 192.168.1.1              # Port scan
netstat -tlnp                 # Active connections
```

## Python

```bash
python --version              # Check Python version
pip install <pkg>             # Install Python package
pip list                      # List Python packages
python -m venv venv           # Create virtual env
source venv/bin/activate      # Activate venv
```

## Node.js / npm

```bash
node --version                # Check Node version
npm --version                 # Check npm version
npm install -g <pkg>          # Install global package
npm install <pkg>             # Install local package
npm list -g                   # List global packages
node <file.js>                # Run JS file
```

## Termux Utilities

```bash
termux-clipboard-set "text"   # Copy to clipboard
termux-clipboard-get          # Paste from clipboard
termux-battery-status         # Battery info
termux-wifi-scaninfo          # WiFi scan
termux-telephony-deviceinfo   # Device info
termux-camera-photo <path>    # Take photo
termux-microphone-record      # Record audio
termux-torch on               # Flashlight on
termux-torch off              # Flashlight off
termux-vibrate 500            # Vibrate 500ms
termux-notification --title "Hi" --content "Hello"  # Send notification
termux-toast "Hello"          # Show toast message
termux-wallpaper -f <path>    # Set wallpaper
termux-open <file>            # Open file with app
termux-open-url <url>         # Open URL in browser
```

## Storage

```bash
termux-setup-storage          # Grant storage access
ls ~/storage/shared           # Internal storage
ls ~/storage/downloads        # Downloads folder
ls ~/storage/dcim             # Camera folder
ls ~/storage/documents        # Documents folder
ls ~/storage/music            # Music folder
ls ~/storage/movies           # Movies folder
ls ~/storage/pictures         # Pictures folder
```

## Process Management

```bash
ps aux                        # List processes
top                           # Live process viewer
kill <PID>                    # Kill process
pkill <name>                  # Kill by name
nohup <cmd> &                 # Run in background
jobs                          # List background jobs
fg %1                         # Bring job to foreground
```

## Useful Aliases (add to ~/.bashrc)

```bash
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline'
```

To add aliases permanently:
```bash
echo "alias ll='ls -la'" >> ~/.bashrc
echo "alias gs='git status'" >> ~/.bashrc
source ~/.bashrc
```
