#!/data/data/com.termux/files/usr/bin/bash
# =============================================
# Termux AI Setup - Run AI on Android
# Run: bash setup.sh
# =============================================

echo ""
echo "========================================"
echo "   TERMUX AI SETUP"
echo "========================================"
echo ""

echo "[1/4] Updating packages..."
pkg update -y && pkg upgrade -y
echo "[OK]"
echo ""

echo "[2/4] Installing llama.cpp..."
pkg install llama.cpp -y || {
    echo "llama.cpp not found in repo. Building from source..."
    pkg install cmake ninja clang git -y
    git clone https://github.com/ggml-org/llama.cpp
    cd llama.cpp && mkdir build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j4
    echo "[OK] Built from source"
}
echo "[OK]"
echo ""

echo "[3/4] Downloading AI model (TinyLlama - small & fast)..."
cd ~/storage/downloads
wget -O tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf
echo "[OK]"
echo ""

echo "[4/4] Testing model..."
llama-cli -m tiny.gguf -p "Hello" -n 50 2>/dev/null || ./llama.cpp/build/bin/llama-cli -m tiny.gguf -p "Hello" -n 50
echo ""
echo "========================================"
echo "   SETUP COMPLETE!"
echo "========================================"
echo ""
echo "  Run: llama-cli -m tiny.gguf --interactive"
echo ""
echo "  Download bigger models:"
echo "    wget -O hermes.gguf <url>"
echo "    wget -O qwen.gguf <url>"
echo ""
