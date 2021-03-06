#!/usr/bin/env bash

base_path=/content

model_name=sprp_onmt_copy_128


model_file=sprp_onmt_copy_128_acc_87.40_ppl_1.74_e9.pt


python $base_path/git/forks/OpenNMT-py/translate.py \
-gpu 2 \
-batch_size 1 \
-model $base_path/git/phrasing/models/${model_name}/${model_file} \
-src $base_path/git/Split-and-Rephrase/baseline-seq2seq/validation.complex.unique \
-output $base_path/git/phrasing/models/${model_name}/validation.complex.unique.output \
-beam_size 12 \
-verbose \
-attn_debug \
-replace_unk \

python ${base_path}/git/phrasing/src/nmt_scripts/opennmt-py/${model_name}/validate.py

#-n_best 12



