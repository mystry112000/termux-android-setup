# Termux AI — Run AI Models on Android

Run AI models in Termux using Python (no cmake/make needed).

## One-Liner (Everything)

```bash
pkg update -y && pkg upgrade -y && pkg install python wget -y && cd ~/storage/downloads && wget -O tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf && pip install llama-cpp-python && echo "DONE" && python -c "from llama_cpp import Llama; llm=Llama('tiny.gguf'); print(llm('Hello', max_tokens=50)['choices'][0]['text'])"
```

## Step-by-Step

### 1. Install Python & Download Model

```bash
pkg update -y
pkg upgrade -y
pkg install python wget -y
cd ~/storage/downloads

# TinyLlama (1.1B, ~1GB) — works on any phone
wget -O tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf
```

### 2. Install llama-cpp-python

```bash
pip install llama-cpp-python
```

### 3. Chat with AI

```bash
python -c "
from llama_cpp import Llama
llm = Llama('~/storage/downloads/tiny.gguf')
while True:
    q = input('You: ')
    if q == 'exit':
        break
    r = llm(q, max_tokens=200)
    print('AI:', r['choices'][0]['text'])
"
```

### 4. Or use this chat script (save as chat.py)

```bash
cat > chat.py << 'EOF'
from llama_cpp import Llama
import sys

model = sys.argv[1] if len(sys.argv) > 1 else 'tiny.gguf'
llm = Llama(model, verbose=False)

print("AI ready! Type 'exit' to quit")
while True:
    q = input("\nYou: ")
    if q.lower() == 'exit':
        break
    r = llm(q, max_tokens=200, stop=["\n\n"])
    print("AI:", r['choices'][0]['text'].strip())
EOF

python chat.py tiny.gguf
```

## Bigger Models

```bash
cd ~/storage/downloads

# Gemma 2 (2B, ~1.5GB, needs 3GB RAM)
wget -O gemma.gguf https://huggingface.co/bartowski/gemma-2-2b-it-GGUF/resolve/main/gemma-2-2b-it-Q4_K_M.gguf

python chat.py gemma.gguf
```

## Troubleshooting

**pip install fails (no clang):**
```bash
pkg install clang cmake -y
pip install llama-cpp-python
```

**Out of memory loading model:**
Use smaller model (TinyLlama 1.1B instead of 7B+)

**Download slow:**
```bash
# Use curl with resume support
curl -C - -L -o tiny.gguf https://huggingface.co/microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0-q4_k_m.gguf
```
