# Termux AI — Run AI Models on Android

Run AI models directly in Termux by building from source.

## One-Liner (Full Setup)

```bash
pkg update -y && pkg upgrade -y && pkg install cmake ninja clang git wget -y && git clone https://github.com/ggml-org/llama.cpp && cd llama.cpp && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j4 && cd ~/storage/downloads && wget -O tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf && echo "DONE! Run: cd ~/llama.cpp/build && ./bin/llama-cli -m ~/storage/downloads/tiny.gguf --interactive"
```

## Step-by-Step

### 1. Install Build Tools

```bash
pkg update -y
pkg upgrade -y
pkg install cmake ninja clang git wget -y
```

### 2. Build llama.cpp from Source

```bash
git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j4
```

This takes 5-10 minutes on most phones.

### 3. Download a Model

```bash
cd ~/storage/downloads

# TinyLlama (1.1B, ~1GB) — works on any phone
wget -O tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf

# Phi-3 Mini (3.8B, ~2.5GB) — good balance
wget -O phi3.gguf https://huggingface.co/microsoft/Phi-3-mini-4k-instruct-gguf/resolve/main/Phi-3-mini-4k-instruct-q4.gguf
```

### 4. Run the AI

```bash
# Full path to run:
~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf --interactive

# With system prompt:
~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf --system "You are a helpful assistant" --interactive

# One-shot prompt (no chat):
~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf -p "Write a Python function" -n 200
```

### 5. Make a Shortcut (so you don't type full path)

```bash
echo 'alias ai="~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf --interactive"' >> ~/.bashrc
source ~/.bashrc
ai
```

## Model Options

| Model | File | Size | RAM Needed | Download Command |
|-------|------|------|------------|------------------|
| TinyLlama 1.1B | `tiny.gguf` | ~1GB | 2GB+ | `wget -O tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf` |
| Phi-3 Mini 3.8B | `phi3.gguf` | ~2.5GB | 4GB+ | `wget -O phi3.gguf https://huggingface.co/microsoft/Phi-3-mini-4k-instruct-gguf/resolve/main/Phi-3-mini-4k-instruct-q4.gguf` |
| Gemma 2 2B | `gemma.gguf` | ~1.5GB | 3GB+ | `wget -O gemma.gguf https://huggingface.co/bartowski/gemma-2-2b-it-GGUF/resolve/main/gemma-2-2b-it-Q4_K_M.gguf` |

## Troubleshooting

**cmake fails:**
```bash
pkg install ninja cmake clang -y --force
```

**make -j4 fails (out of memory):**
```bash
make -j2  # Use 2 cores instead of 4
```

**wget fails to download model:**
```bash
# Try curl instead
curl -L -o tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf
```

**Build takes too long:**
Plug in your phone and let it run. Average: 5-10 min.

**Out of storage:**
```bash
df -h  # Check free space
rm -rf ~/llama.cpp  # Remove build files (keep the model)
```
