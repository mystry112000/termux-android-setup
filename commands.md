# Termux AI Commands

## Run AI (Python)

```bash
# Quick test
python -c "from llama_cpp import Llama; llm=Llama('~/storage/downloads/tiny.gguf'); print(llm('Hello', max_tokens=50)['choices'][0]['text'])"

# Interactive chat
python -c "
from llama_cpp import Llama
llm = Llama('~/storage/downloads/tiny.gguf', verbose=False)
while True:
    q = input('You: ')
    if q == 'exit': break
    r = llm(q, max_tokens=200)
    print('AI:', r['choices'][0]['text'].strip())
"
```

## Download Models

```bash
cd ~/storage/downloads
wget -O tiny.gguf <url>    # Download model
ls -lh *.gguf              # Check sizes
rm *.gguf                  # Delete all models
```

## Python Package Management

```bash
pip install llama-cpp-python   # Install
pip list                       # List packages
pip uninstall llama-cpp-python # Remove
```

## Storage

```bash
df -h                       # Check space
du -sh *.gguf               # Model sizes
cd ~/storage/downloads      # Models location
```
