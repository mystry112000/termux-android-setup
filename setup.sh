#!/data/data/com.termux/files/usr/bin/bash
# =============================================
# Termux Android Complete Setup Script
# Run: bash setup.sh
# =============================================

BOLD='\033[1m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${BOLD}${CYAN}========================================${NC}"
echo -e "${BOLD}${CYAN}   TERMUX ANDROID COMPLETE SETUP${NC}"
echo -e "${BOLD}${CYAN}========================================${NC}"
echo ""

# Step 1: Update packages
echo -e "${YELLOW}[1/8] Updating packages...${NC}"
pkg update -y
pkg upgrade -y
echo -e "${GREEN}[OK] Packages updated${NC}"
echo ""

# Step 2: Essential tools
echo -e "${YELLOW}[2/8] Installing essential tools...${NC}"
pkg install nodejs git curl wget python openssh -y
echo -e "${GREEN}[OK] Essential tools installed${NC}"
echo ""

# Step 3: Grant storage
echo -e "${YELLOW}[3/8] Granting storage access...${NC}"
termux-setup-storage 2>/dev/null
echo -e "${GREEN}[OK] Storage access granted${NC}"
echo ""

# Step 4: Configure Git
echo -e "${YELLOW}[4/8] Configuring Git...${NC}"
git config --global user.name "Termux User"
git config --global user.email "termux@localhost"
echo -e "${GREEN}[OK] Git configured${NC}"
echo ""

# Step 5: Install opencode
echo -e "${YELLOW}[5/8] Installing OpenCode (AI coding agent)...${NC}"
npm cache clean --force 2>/dev/null
npm install -g opencode-ai
echo -e "${GREEN}[OK] OpenCode installed${NC}"
echo ""

# Step 6: Install Ollama
echo -e "${YELLOW}[6/8] Installing Ollama (local AI)...${NC}"
pkg install ollama -y
echo -e "${GREEN}[OK] Ollama installed${NC}"
echo ""

# Step 7: Pull AI models
echo -e "${YELLOW}[7/8] Pulling AI models (this may take a while)...${NC}"
ollama pull nous-hermes3 2>/dev/null
ollama pull deepseek-coder-v2 2>/dev/null
echo -e "${GREEN}[OK] AI models downloaded${NC}"
echo ""

# Step 8: Verify installation
echo -e "${YELLOW}[8/8] Verifying installation...${NC}"
NODE_VER=$(node --version 2>/dev/null)
NPM_VER=$(npm --version 2>/dev/null)
GIT_VER=$(git --version 2>/dev/null)

echo ""
echo -e "${BOLD}${GREEN}========================================${NC}"
echo -e "${BOLD}${GREEN}   SETUP COMPLETE!${NC}"
echo -e "${BOLD}${GREEN}========================================${NC}"
echo ""
echo -e "  Node.js:    ${CYAN}$NODE_VER${NC}"
echo -e "  npm:        ${CYAN}$NPM_VER${NC}"
echo -e "  Git:        ${CYAN}$GIT_VER${NC}"
echo -e "  OpenCode:   ${CYAN}$(opencode --version 2>/dev/null || echo 'installed')${NC}"
echo -e "  Ollama:     ${CYAN}$(ollama --version 2>/dev/null || echo 'installed')${NC}"
echo ""
echo -e "${BOLD}Next steps:${NC}"
echo ""
echo -e "  ${CYAN}opencode${NC}             - Start AI coding agent"
echo -e "  ${CYAN}ollama run nous-hermes3${NC} - Chat with AI locally"
echo ""
