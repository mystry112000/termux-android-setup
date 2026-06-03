# Termux AI Commands Reference

## Run AI

```bash
llama-cli -m model.gguf -p "prompt"              # Single prompt
llama-cli -m model.gguf --interactive             # Chat mode
llama-cli -m model.gguf --system "You are..."     # System prompt
llama-cli -m model.gguf -p "hi" -n 200            # Limit output tokens
llama-cli -m model.gguf --temp 0.2                # Low temp = precise
```

## Download Models

```bash
wget -O model.gguf <url>                          # Download
curl -L -o model.gguf <url>                       # Alternative download
ls -lh *.gguf                                     # Check file sizes
rm model.gguf                                     # Delete a model
```

## Package Management

```bash
pkg update                                        # Update package list
pkg upgrade                                       # Upgrade packages
pkg install llama.cpp                             # Install llama
pkg search llama                                  # Search packages
pkg list-installed                                # List installed
```

## Storage

```bash
termux-setup-storage                              # Grant storage access
cd ~/storage/downloads                            # Go to downloads
ls ~/storage/shared                               # Internal storage
df -h                                             # Check free space
du -sh *.gguf                                     # Check model sizes
```

## Build llama.cpp from source

```bash
pkg install cmake ninja clang git -y
git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp && mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j4
./bin/llama-cli -m ~/storage/downloads/model.gguf -p "Hi"
```
