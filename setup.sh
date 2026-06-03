#!/data/data/com.termux/files/usr/bin/bash
# Termux AI Setup (Python-based)
echo ""
echo "TERMUX AI SETUP"
echo "==============="
echo ""

echo "[1/3] Installing Python..."
pkg update -y && pkg upgrade -y
pkg install python wget -y
echo "OK"
echo ""

echo "[2/3] Downloading TinyLlama model..."
cd ~/storage/downloads
wget -O tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf
echo "OK"
echo ""

echo "[3/3] Installing llama-cpp-python..."
pip install llama-cpp-python
echo ""
echo "==============="
echo "SETUP COMPLETE!"
echo "==============="
echo ""
echo "Run: python -c \"from llama_cpp import Llama; llm=Llama('~/storage/downloads/tiny.gguf'); print(llm('Hello', max_tokens=50)['choices'][0]['text'])\""
echo ""
