# Termux Android Setup

Complete guide to set up Termux for Android development, coding, and AI agents.

## One-Liner (Everything)

Copy-paste this one line in Termux:

```bash
pkg update -y && pkg upgrade -y && pkg install nodejs-lts git curl wget python openssh -y && npm install -g opencode-ai --prefix=$PREFIX --force --ignore-scripts && echo "DONE! Run: opencode" && opencode
```

This installs **everything**: Node.js, Git, Python, SSH, Ollama, OpenCode, and launches OpenCode.

## 1. Install Termux

Download from [F-Droid](https://f-droid.org/packages/com.termux/) (recommended) or GitHub Releases.

## 2. Step-by-Step Setup

Prefer manual? Run these **one by one**:

```bash
# Update packages
pkg update -y

# Upgrade all packages
pkg upgrade -y

# Grant storage access (allow Termux to read/write phone files)
termux-setup-storage

# Install essential tools
pkg install nodejs git curl wget python -y

# IMPORTANT: Check if npm is installed (sometimes nodejs on Termux lacks npm)
npm --version

# If npm is NOT found, install nodejs-lts instead:
pkg install nodejs-lts -y
```

## 3. Install OpenCode (AI Coding Agent)

```bash
# Install opencode globally (use --force for Termux/Android)
npm install -g opencode-ai --prefix=$PREFIX --force --ignore-scripts

# Go to your documents folder
cd ~/storage/shared/Documents

# Run opencode (if "command not found", see fix below)
opencode

# If that doesn't work, use npx instead
npx opencode
```

**Fix: opencode command not found after npm install -g:**
```bash
# 1. Find where npm installed it
npm root -g

# 2. Add npm global bin to PATH (run this)
echo 'export PATH=$PATH:$PREFIX/bin' >> ~/.bashrc
source ~/.bashrc

# 3. Try running directly from node_modules
npx opencode

# 4. OR install with explicit prefix
npm install -g opencode-ai --prefix=$PREFIX

# 5. Verify the binary location
ls $PREFIX/bin/opencode 2>/dev/null || echo "not in bin"

# 6. Last resort: run directly
$PREFIX/lib/node_modules/opencode-ai/bin/opencode
```

## 4. Install Local AI Models (Ollama)

```bash
# Install Ollama
pkg install ollama -y

# Pull Hermes 3 (good general AI model)
ollama pull nous-hermes3

# Pull DeepSeek (good for coding)
ollama pull deepseek-coder-v2

# Run a model directly in Termux
ollama run nous-hermes3
```

## 5. Common Termux Packages

```bash
# Development tools
pkg install build-essential cmake -y

# Python packages
pip install flask fastapi requests

# Editors
pkg install vim nano -y

# Network tools
pkg install openssh nmap -y

# File management
pkg install tree zip unzip -y
```

## 6. Useful Commands

| Command | Description |
|---------|-------------|
| `pkg list-installed` | List installed packages |
| `pkg search <name>` | Search for a package |
| `pkg show <name>` | Show package details |
| `termux-clipboard-set` | Copy to clipboard |
| `termux-clipboard-get` | Paste from clipboard |
| `termux-wifi-scaninfo` | Scan WiFi networks |
| `termux-telephony-deviceinfo` | Show device info |
| `termux-battery-status` | Show battery status |
| `termux-camera-photo` | Take a photo |
| `termux-torch on/off` | Toggle flashlight |
| `termux-vibrate <ms>` | Vibrate device |

## 7. Storage Locations

| Path | Description |
|------|-------------|
| `~/storage/shared` | Internal shared storage |
| `~/storage/downloads` | Downloads folder |
| `~/storage/dcim` | Camera photos/videos |
| `~/storage/documents` | Documents folder |
| `~/storage/music` | Music folder |
| `~/storage/movies` | Movies folder |
| `~/storage/pictures` | Pictures folder |

## 8. Troubleshooting

**npm not found after installing nodejs:**
The standard `nodejs` package in Termux sometimes doesn't include npm.
```bash
# Fix: Install nodejs-lts instead
pkg uninstall nodejs -y
pkg install nodejs-lts -y
npm --version  # Should show version number now
```

**npm install fails (network/proxy):**
```bash
# Set npm registry explicitly
npm config set registry https://registry.npmjs.org/
npm install -g opencode-ai --prefix=$PREFIX --force
```

**npm ERR! notsup (Unsupported platform for Termux/Android):**
```
This error means a package doesn't support Android. Fix:
```
```bash
# Fix: Force install (bypass OS checks)
npm install -g opencode-ai --prefix=$PREFIX --force --ignore-scripts

# OR run without installing globally (no errors)
npx opencode
```

**OpenCode install hangs or fails:**
```bash
# Clear cache and retry
npm cache clean --force
npm config set fetch-timeout 60000
npm install -g opencode-ai --verbose
```

**Storage permission denied:**
- Run `termux-setup-storage` again
- Check Android Settings > Apps > Termux > Permissions

**OpenCode not found after install (command not found):**
```bash
# Fix 1: Add npm global path
echo 'export PATH=$PATH:$PREFIX/bin' >> ~/.bashrc
source ~/.bashrc

# Fix 2: Install with correct prefix
npm install -g opencode-ai --prefix=$PREFIX

# Fix 3: Run via npx
npx opencode

# Fix 4: Find and link manually
npm bin -g
ls $(npm bin -g)/opencode

# Fix 5: Run directly
node $(npm root -g)/opencode-ai/bin/opencode
```

**Ollama installation failed:**
```bash
pkg update -y
pkg install ollama -y --force
```

**GitHub push from Termux:**
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub
# Add key to GitHub.com > Settings > SSH Keys
```
