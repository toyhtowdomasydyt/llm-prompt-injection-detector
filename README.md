# LLM-prompt-injection-detector

### Steps of training and gaining results

1. METHOD 1 - Classification Using Traditional ML
2. METHOD 2 - Classification Using a Pre-trained LLM (XLM-RoBERTa or BERT based to compare)
3. METHOD 3 - Classification Using a Fine-tuned LLM (XLM-RoBERTa or BERT based to compare)
4. METHOD 4 - Huggingface models
5. METHOD 5 - Classification Using a Pre-trained LLM (Llama/ChatGPT etc)
6. METHOD 6 - Classification Using a Fine-tuned LLM (Llama/ChatGPT etc)

#### Dateset which will be used in finetune

1. https://huggingface.co/datasets/jayavibhav/prompt-injection-safety
2. https://huggingface.co/datasets/jayavibhav/prompt-injection
3. https://huggingface.co/datasets/xTRam1/safe-guard-prompt-injection

#### Method 1

Used models from HuggingFace:

1. Default model - distilbert/distilbert-base-uncased-finetuned-sst-2-english
2. Trained model - protectai/deberta-v3-base-prompt-injection
3. Base model - microsoft/deberta-v3-base
4. Trained model - meta-llama/Prompt-Guard-86M
5. Base model - FacebookAI/roberta-base
6. Base model - FacebookAI/xlm-roberta-base

First zero shots classifications are in [zero_shot_classification.ipynb](./zero_shot_classification.ipynb)
