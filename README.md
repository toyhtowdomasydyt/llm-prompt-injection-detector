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

#### Method 1

Used models from HuggingFace:

1. Default model - distilbert/distilbert-base-uncased-finetuned-sst-2-english
2. Trained model - protectai/deberta-v3-base-prompt-injection
3. Base model - microsoft/deberta-v3-base
5. Base model - FacebookAI/roberta-base
6. Base model - FacebookAI/xlm-roberta-base

First zero shots classifications are in [zero_shot_classification.ipynb](./zero_shot_classification.ipynb)

#### Method 5

llama pretrained model for prompt injection detection 
- Pre Trained model - meta-llama/Prompt-Guard-86M
