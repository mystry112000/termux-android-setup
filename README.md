# Termux AI — Run AI on Android

Run AI models directly in Termux on your Android phone.

---

## 1. Install Termux

Download from [F-Droid](https://f-droid.org/packages/com.termux/) (recommended) or GitHub Releases.

---

## 2. Update Packages

```bash
pkg update -y
pkg upgrade -y
```

---

## 3. Install Python

```bash
pkg install python wget -y
```

---

## 4. Get Hugging Face Token (Free)

Hugging Face now requires login to download models.

1. Open https://huggingface.co/settings/tokens in your phone browser
2. Create a free account
3. Click **"Create new token"** → Select **"Read"** → Copy token (starts with `hf_`)

Then in Termux:

```bash
pip install huggingface-hub
huggingface-cli login
# Paste the hf_... token when asked
```

---

## 5. Download an AI Model

```bash
cd ~/storage/downloads
huggingface-cli download microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF tinyllama-1.1b-chat-v1.0-q4_k_m.gguf --local-dir .
```

This downloads TinyLlama (~1GB). Works on any phone with 2GB+ RAM.

---

## 6. Install llama-cpp-python

```bash
pip install llama-cpp-python
```

If it fails, install build tools first:

```bash
pkg install clang cmake -y
pip install llama-cpp-python
```

---

## 7. Run the AI

```bash
cd ~/storage/downloads

# Quick test
python -c "from llama_cpp import Llama; llm=Llama('tinyllama-1.1b-chat-v1.0-q4_k_m.gguf', verbose=False); print(llm('Hello', max_tokens=50)['choices'][0]['text'])"

# Interactive chat
python -c "
from llama_cpp import Llama
llm = Llama('tinyllama-1.1b-chat-v1.0-q4_k_m.gguf', verbose=False)
print('AI ready! Type exit to quit')
while True:
    q = input('You: ')
    if q == 'exit': break
    r = llm(q, max_tokens=200)
    print('AI:', r['choices'][0]['text'].strip())
"
```

---

## One-Liner (if already logged in to HF)

```bash
pkg update -y && pkg upgrade -y && pkg install python wget -y && pip install huggingface-hub llama-cpp-python && cd ~/storage/downloads && huggingface-cli download microsoft/TinyLlama-1.1B-Chat-v1.0-GGUF tinyllama-1.1b-chat-v1.0-q4_k_m.gguf --local-dir . && python -c "from llama_cpp import Llama; llm=Llama('tinyllama-1.1b-chat-v1.0-q4_k_m.gguf', verbose=False); print(llm('Hello', max_tokens=50)['choices'][0]['text'])"
```

---

## More Models

```bash
cd ~/storage/downloads

# Qwen 2.5 Coder 1.5B (good for coding, ~1GB)
huggingface-cli download Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF qwen2.5-coder-1.5b-instruct-q4_k_m.gguf --local-dir .

# Gemma 2 2B (good general, ~1.5GB)
huggingface-cli download google/gemma-2-2b-it-Q4_K_M-GGUF gemma-2-2b-it-Q4_K_M.gguf --local-dir .
```

---

## Common Issues

**401 Unauthorized / Cannot download:**
```bash
huggingface-cli login
# Get token from https://huggingface.co/settings/tokens
```

**Out of memory:**
Use TinyLlama (1.1B) — needs only 2GB RAM.

**Download slow:**
Keep phone screen on, stay on WiFi.

**pip install fails:**
```bash
pkg install clang cmake -y
```

**Model not found in path:**
```bash
cd ~/storage/downloads
ls -lh *.gguf
```
