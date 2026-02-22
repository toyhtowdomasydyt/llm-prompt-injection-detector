# LLM-prompt-injection-detector

## Project Setup

### Prerequisites

- Git
- Python 3.10 or higher
- VS Code (optional, for development)

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/toyhtowdomasydyt/llm-prompt-injection-detector.git
   cd llm-prompt-injection-detector
   ```

2. **Install uv** (if not already installed)

   ```bash
   # macOS and Linux
   curl -LsSf https://astral.sh/uv/install.sh | sh

   # Or using Homebrew (macOS)
   brew install uv

   # Or using pip
   pip install uv
   ```

3. **Initialize the virtual environment and install dependencies**

   ```bash
   # This will create .venv and install all dependencies from pyproject.toml
   uv sync
   ```

4. **Set up environment variables** (if running cloud-based models like GPT)

   ```bash
   # Copy the example environment file
   cp .env.example .env

   # Edit .env and add your API keys (e.g., OPENAI_API_KEY for GPT models)
   # The .env file is gitignored and won't be committed to version control
   ```

5. **Verify installation**
   ```bash
   # Run a test command to ensure everything is set up correctly
   uv run python --version
   ```

### System Requirements

This project runs different models with varying computational requirements. The results in this repository were generated using [RunPod](https://www.runpod.io/) cloud GPUs.

#### GPU & RAM Recommendations by Method

**Method 1, 2, 3 - Traditional ML & Pre-trained Models**

- Models: DistilBERT, DistilRoBERTa, DeBERTa-v3-base
- **Minimum**: CPU-only (slow inference)
- **Recommended**: 1x RTX 3060 (12GB VRAM) or equivalent
- **Optimal**: 1x RTX 4070 (12GB VRAM) or 1x A40 (48GB VRAM)
- RAM: 16GB system RAM

**Method 3 - Fine-tuning**

- **Minimum**: 1x RTX 3080 (10GB VRAM with gradient checkpointing)
- **Recommended**: 1x RTX 4090 (24GB VRAM) or 1x A6000 (48GB VRAM)
- RAM: 32GB+ system RAM

**Method 4 - Specialized Prompt Injection Models**

- Models: DeBERTa-v3-base, Prompt-Guard-86M, DistilBERT variants
- **Minimum**: 1x RTX 3060 (12GB VRAM)
- **Recommended**: 1x RTX 4090 (24GB VRAM) or 1x A40 (48GB VRAM)
- RAM: 16GB system RAM

**Method 5, 6 - Large Language Models**

- Models: Llama 2 (7B/13B), Phi, GPT-4o-mini
- **For 7B models**: 1x RTX 4090 (24GB VRAM) or 1x A40 (48GB VRAM)
- **For 13B+ models**: 2x A40 (48GB VRAM each) or 1x H100 (80GB VRAM)
- **For fine-tuning 7B+**: 2x RTX 4090 or 1x H100 with 80GB VRAM
- RAM: 32GB+ system RAM

#### Local Development

For running lightweight inference on personal machines:

- CPU-only notebooks (Methods 1-4): Any modern CPU with 8GB+ RAM
- GPU inference: NVIDIA GPU with 6GB+ VRAM (RTX 3060 or equivalent)

### VS Code Extensions (Recommended)

For a better development experience, install these extensions in VS Code:

- **Python** (ms-python.python) - Official Python support
- **Jupyter** (ms-toolsai.jupyter) - Interactive Jupyter notebook support (run notebooks directly in VS Code)
- **Pylance** (ms-python.vscode-pylance) - Advanced Python language features
- **Black Formatter** (ms-python.black-formatter) - Code formatting

### Running Notebooks

You can run Jupyter notebooks in two ways:

**Option 1: Using VS Code (Recommended)**

- Open any `.ipynb` file in VS Code
- The Jupyter extension will automatically load the notebook
- Click "Run Cell" or "Run All" buttons to execute cells

**Option 2: Using Jupyter Lab**

```bash
uv run jupyter notebook
```

---

### Steps of training and gaining results

1. METHOD 1 - Classification Using Traditional ML
2. METHOD 2 - Classification Using a Pre-trained LLM (XLM-RoBERTa or BERT based to compare)
3. METHOD 3 - Classification Using a Fine-tuned LLM (XLM-RoBERTa or BERT based to compare)
4. METHOD 4 - Huggingface models (ready models specialized for prompt injection detection)
5. METHOD 5 - Classification Using a Pre-trained LLM (Llama/ChatGPT etc)
6. METHOD 6 - Classification Using a Fine-tuned LLM (Llama/ChatGPT etc)

#### Dateset which will be used in finetune

1. https://huggingface.co/datasets/jayavibhav/prompt-injection-safety
2. https://huggingface.co/datasets/jayavibhav/prompt-injection
3. https://huggingface.co/datasets/xTRam1/safe-guard-prompt-injection

##### Dataset's info

https://huggingface.co/datasets/jayavibhav/prompt-injection

262k rows -> Train  
65.4k rows -> Test

Labels - 0, 1

For Train
0 50.6% -> 146 720  
1 49%% -> 128 380

For Test
0 50.6% -> 33 092  
1 49.4% -> 32 046

https://huggingface.co/datasets/jayavibhav/prompt-injection-safety
50k rows -> Train
10k rows -> Test

Labels - 0, 1, 2

For Train
0 46% -> 23k
1 45% -> 22k
2 8% -> 4k

For Test
0 45% -> 4.5k
1 44% -> 4.4k
2 10% -> 1k

https://huggingface.co/datasets/xTRam1/safe-guard-prompt-injection

8.24k rows -> Train
2.06k rows -> Test

Labels - 0, 1

For Train
0 69% -> 5685
1 30% -> 2472

For Test
0 68% -> 1400
1 32% -> 659

#### Method 1, 2, 3

Used models from HuggingFace:

1. Default model - distilbert/distilbert-base-uncased-finetuned-sst-2-english
2. Distil roberta - distilbert/distilroberta-base
3. Base model - microsoft/deberta-v3-base

Under consideration

1. Base model - FacebookAI/roberta-base
2. Base model - FacebookAI/xlm-roberta-base

First zero shots classifications are in [zero_shot_classification.ipynb](./zero_shot_classification.ipynb)

#### Method 4

1. Protect AI model - protectai/deberta-v3-base-prompt-injection-v2
2. Facebook model - meta-llama/Prompt-Guard-86M
3. Acuvity Inc - acuvity/distilbert-base-uncased-prompt-injection-v0.1

Under consideration 4. \*jailbreakDetector-v6 (if get approve by author) - markush1/jailbreakDetector-v6

#### Method 5

LLMs like GPT, LLama, Phi
