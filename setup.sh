#!/data/data/com.termux/files/usr/bin/bash
# =============================================
# Termux AI Setup Script
# Run: bash setup.sh
# =============================================

echo ""
echo "========================================"
echo "   TERMUX AI SETUP"
echo "========================================"
echo ""

echo "[1/4] Installing build tools..."
pkg update -y
pkg upgrade -y
pkg install cmake ninja clang git wget -y
echo "[OK]"
echo ""

echo "[2/4] Building llama.cpp from source (5-10 min)..."
if [ -d "$HOME/llama.cpp" ]; then
    echo "llama.cpp already cloned. Updating..."
    cd $HOME/llama.cpp && git pull
else
    git clone https://github.com/ggml-org/llama.cpp $HOME/llama.cpp
fi
cd $HOME/llama.cpp
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j4
echo "[OK]"
echo ""

echo "[3/4] Downloading TinyLlama model (~1GB)..."
cd $HOME/storage/downloads
wget -O tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf
echo "[OK]"
echo ""

echo "[4/4] Testing..."
$HOME/llama.cpp/build/bin/llama-cli -m $HOME/storage/downloads/tiny.gguf -p "Hello" -n 30
echo ""
echo "========================================"
echo "   SETUP COMPLETE!"
echo "========================================"
echo ""
echo "  Run interactive chat:"
echo "    ~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf --interactive"
echo ""
echo "  Or add shortcut:"
echo "    echo 'alias ai=\"~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf --interactive\"' >> ~/.bashrc"
echo "    source ~/.bashrc"
echo "    ai"
echo ""
