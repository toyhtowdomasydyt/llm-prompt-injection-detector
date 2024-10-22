# LLM-prompt-injection-detector

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

Under consideration 
4. *jailbreakDetector-v6 (if get approve by author) - markush1/jailbreakDetector-v6

#### Method 5

LLMs like GPT, LLama, Phi 
