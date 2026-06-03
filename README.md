# Termux AI — Run AI Models on Android

Run AI models in Termux using Python.

## Prerequisites: Hugging Face Token

Many models require a free Hugging Face token:
1. Go to https://huggingface.co/settings/tokens
2. Create a free account and generate a **Read** token
3. Copy the token (starts with `hf_`)

## One-Liner (Everything)

```bash
pkg update -y && pkg upgrade -y && pkg install python wget -y && pip install huggingface-hub llama-cpp-python && echo "Enter your HF token (hf_...):" && read token && huggingface-cli login --token $token && cd ~/storage/downloads && huggingface-cli download microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF tinyllama-1.1b-chat-v1.0-q4_k_m.gguf --local-dir . && echo "DONE" && python -c "from llama_cpp import Llama; llm=Llama('tinyllama-1.1b-chat-v1.0-q4_k_m.gguf', verbose=False); print(llm('Hello', max_tokens=50)['choices'][0]['text'])"
```

## Step-by-Step

### 1. Install Tools

```bash
pkg update -y
pkg upgrade -y
pkg install python wget -y
```

### 2. Login to Hugging Face

```bash
pip install huggingface-hub
huggingface-cli login
# Paste your token (hf_...) when asked
```

### 3. Download a Model

```bash
cd ~/storage/downloads

# TinyLlama (1.1B, ~1GB) — works on any phone
huggingface-cli download microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF tinyllama-1.1b-chat-v1.0-q4_k_m.gguf --local-dir .
```

### 4. Install & Run

```bash
pip install llama-cpp-python

python -c "
from llama_cpp import Llama
llm = Llama('tinyllama-1.1b-chat-v1.0-q4_k_m.gguf', verbose=False)
while True:
    q = input('You: ')
    if q == 'exit': break
    r = llm(q, max_tokens=200)
    print('AI:', r['choices'][0]['text'].strip())
"
```

## Models That Work

| Model | File | Size | Download Command |
|-------|------|------|-----------------|
| TinyLlama 1.1B | `tinyllama-1.1b-chat-v1.0-q4_k_m.gguf` | ~1GB | `huggingface-cli download microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF tinyllama-1.1b-chat-v1.0-q4_k_m.gguf --local-dir .` |
| Gemma 2 2B | `gemma-2-2b-it-Q4_K_M.gguf` | ~1.5GB | `huggingface-cli download google/gemma-2-2b-it-Q4_K_M-GGUF gemma-2-2b-it-Q4_K_M.gguf --local-dir .` |
| Qwen 2.5 Coder 1.5B | `qwen2.5-coder-1.5b-q4_k_m.gguf` | ~1GB | `huggingface-cli download Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF qwen2.5-coder-1.5b-instruct-q4_k_m.gguf --local-dir .` |

## Chat Script (save as chat.py)

```bash
cat > chat.py << 'EOF'
from llama_cpp import Llama
import sys, os

model = sys.argv[1] if len(sys.argv) > 1 else 'tinyllama-1.1b-chat-v1.0-q4_k_m.gguf'
if not os.path.exists(model):
    print(f"Model {model} not found!")
    print("Download: huggingface-cli download <model> --local-dir .")
    exit(1)

llm = Llama(model, verbose=False)
print(f"AI ready ({model}). Type 'exit' to quit")
while True:
    q = input("\nYou: ")
    if q.lower() == 'exit': break
    r = llm(q, max_tokens=200, stop=["\n\n"])
    print("AI:", r['choices'][0]['text'].strip())
EOF

python chat.py
```

## Troubleshooting

**401 Unauthorized:**
```bash
# Login first
huggingface-cli login
# Get token from: https://huggingface.co/settings/tokens
```

**pip install fails:**
```bash
pkg install clang cmake -y
pip install llama-cpp-python
```

**Out of memory:**
Use TinyLlama (1.1B) — works on 2GB RAM phones.
