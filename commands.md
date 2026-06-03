# Termux AI Commands

## Run AI Models

```bash
# Interative chat
~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf --interactive

# One-shot
~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf -p "your prompt" -n 200

# With system prompt
~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf --system "Be concise" --interactive

# Control randomness (0.0 = precise, 1.0 = creative)
~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf --temp 0.2 --interactive
```

## Download More Models

```bash
cd ~/storage/downloads

# Phi-3 (3.8B, needs 4GB+ RAM)
wget -O phi3.gguf https://huggingface.co/microsoft/Phi-3-mini-4k-instruct-gguf/resolve/main/Phi-3-mini-4k-instruct-q4.gguf

# Gemma 2 (2B, needs 3GB+ RAM)
wget -O gemma.gguf https://huggingface.co/bartowski/gemma-2-2b-it-GGUF/resolve/main/gemma-2-2b-it-Q4_K_M.gguf
```

## Rebuild llama.cpp (after update)

```bash
cd ~/llama.cpp && git pull && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j4
```

## Free Up Space

```bash
df -h                             # Check storage
du -sh ~/storage/downloads/*.gguf # Check model sizes
rm ~/storage/downloads/tiny.gguf  # Delete a model
rm -rf ~/llama.cpp                # Delete build (saves ~2GB)
```

## Shortcuts (add to ~/.bashrc)

```bash
alias ai='~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/tiny.gguf --interactive'
alias ai-phi='~/llama.cpp/build/bin/llama-cli -m ~/storage/downloads/phi3.gguf --interactive'
alias rebuild-llama='cd ~/llama.cpp && git pull && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j4'
```
