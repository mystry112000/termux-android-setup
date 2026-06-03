# Termux AI — Run AI Models on Android

Run AI models (Hermes, Llama, Qwen, DeepSeek) directly inside Termux on your Android phone.

## One-Liner (Everything)

```bash
pkg update -y && pkg upgrade -y && pkg install llama.cpp git cmake python -y && cd ~/storage/downloads && wget -O hermes.gguf https://huggingface.co/bartowski/Hermes-3-Llama-3.1-8B-GGUF/resolve/main/Hermes-3-Llama-3.1-8B-Q4_K_M.gguf && echo "DONE! Run: llama-cli -m hermes.gguf"
```

## Step-by-Step

### 1. Install llama.cpp

```bash
pkg update -y
pkg upgrade -y
pkg install llama.cpp -y
```

### 2. Download a Model

```bash
cd ~/storage/downloads

# Hermes 3 (good general purpose, ~5GB)
wget -O hermes.gguf https://huggingface.co/bartowski/Hermes-3-Llama-3.1-8B-GGUF/resolve/main/Hermes-3-Llama-3.1-8B-Q4_K_M.gguf

# or Qwen 3 Coder (best for coding, ~4GB)
wget -O qwen.gguf https://huggingface.co/Qwen/Qwen3-Coder-7B-GGUF/resolve/main/qwen3-coder-7b-q4_k_m.gguf

# or TinyLlama (smallest, ~1GB - works on any phone)
wget -O tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf
```

### 3. Run the AI

```bash
# Chat with Hermes
llama-cli -m hermes.gguf -p "Hello, who are you?" --interactive

# Chat with Qwen Coder
llama-cli -m qwen.gguf -p "Write a Python function" --interactive

# Chat with TinyLlama (fast on any phone)
llama-cli -m tiny.gguf -p "Hi" --interactive
```

### 4. For Programming Tasks

```bash
llama-cli -m qwen.gguf -p "Write a JavaScript function to sort an array" --temp 0.2
```

## If llama.cpp not in pkg

Build from source:

```bash
pkg install cmake ninja clang -y
git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j4
./bin/llama-cli -m ~/storage/downloads/hermes.gguf -p "Hi"
```

## Model sizes (pick based on your phone RAM)

| Model | Size | RAM Needed | Quality |
|-------|------|------------|---------|
| TinyLlama-1.1B | ~1GB | 2GB+ | Basic |
| Qwen3-Coder-7B | ~4GB | 6GB+ | Good coding |
| Hermes-3-8B | ~5GB | 8GB+ | Best general |
| DeepSeek-Coder-6.7B | ~4GB | 6GB+ | Good coding |

## Useful commands

```bash
# List all files
ls -la ~/storage/downloads/

# Remove a model to free space
rm ~/storage/downloads/hermes.gguf

# Run with system prompt
llama-cli -m hermes.gguf --system "You are a helpful assistant" --interactive

# Check storage
df -h
```
