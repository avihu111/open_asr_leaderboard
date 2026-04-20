#!/bin/bash

export PYTHONPATH="..":$PYTHONPATH


MODEL_ID="ibm-granite/granite-speech-4.1-2b-nar"
BATCH_SIZE=256


python run_eval_nar.py \
    --model_id=${MODEL_ID} \
    --dataset_path="hf-audio/esb-datasets-test-only-sorted" \
    --dataset="voxpopuli" \
    --split="test" \
    --device=0 \
    --batch_size=${BATCH_SIZE} \
    --max_eval_samples=-1

python run_eval_nar.py \
    --model_id=${MODEL_ID} \
    --dataset_path="hf-audio/esb-datasets-test-only-sorted" \
    --dataset="ami" \
    --split="test" \
    --device=0 \
    --batch_size=${BATCH_SIZE} \
    --max_eval_samples=-1

python run_eval_nar.py \
    --model_id=${MODEL_ID} \
    --dataset_path="hf-audio/esb-datasets-test-only-sorted" \
    --dataset="earnings22" \
    --split="test" \
    --device=0 \
    --batch_size=${BATCH_SIZE} \
    --max_eval_samples=-1

python run_eval_nar.py \
    --model_id=${MODEL_ID} \
    --dataset_path="hf-audio/esb-datasets-test-only-sorted" \
    --dataset="gigaspeech" \
    --split="test" \
    --device=0 \
    --batch_size=${BATCH_SIZE} \
    --max_eval_samples=-1

python run_eval_nar.py \
    --model_id=${MODEL_ID} \
    --dataset_path="hf-audio/esb-datasets-test-only-sorted" \
    --dataset="librispeech" \
    --split="test.clean" \
    --device=0 \
    --batch_size=${BATCH_SIZE} \
    --max_eval_samples=-1

python run_eval_nar.py \
    --model_id=${MODEL_ID} \
    --dataset_path="hf-audio/esb-datasets-test-only-sorted" \
    --dataset="librispeech" \
    --split="test.other" \
    --device=0 \
    --batch_size=${BATCH_SIZE} \
    --max_eval_samples=-1

python run_eval_nar.py \
    --model_id=${MODEL_ID} \
    --dataset_path="hf-audio/esb-datasets-test-only-sorted" \
    --dataset="spgispeech" \
    --split="test" \
    --device=0 \
    --batch_size=${BATCH_SIZE} \
    --max_eval_samples=-1

python run_eval_nar.py \
    --model_id=${MODEL_ID} \
    --dataset_path="hf-audio/esb-datasets-test-only-sorted" \
    --dataset="tedlium" \
    --split="test" \
    --device=0 \
    --batch_size=${BATCH_SIZE} \
    --max_eval_samples=-1

RUNDIR=`pwd` && \
cd ../normalizer && \
python -c "import eval_utils; eval_utils.score_results('${RUNDIR}/results', '${MODEL_ID}')" && \
cd $RUNDIR
