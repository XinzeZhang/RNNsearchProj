#!/bin/bash

set -e

src=cn
trg=en
lang=$src-$trg


export CUDA_VISIBLE_DEVICES=$1

test_nist=$2
name=$lang/best.pt


data_dir=corpus/ldc

src_vocab=$3
trg_vocab=$4

test_prefix=$data_dir/${test_nist}/${test_nist}
test_src=${test_prefix}.${src}
test_trg_prefix=${test_prefix}.${trg}
test_trg=${test_trg_prefix}"0"\ ${test_trg_prefix}"1"\ ${test_trg_prefix}"2"\ ${test_trg_prefix}"3"

eval_script=scripts/validate.sh

python translate.py --cuda True --src_vocab ${src_vocab} --trg_vocab ${trg_vocab} --test_src ${test_src} --test_trg ${test_trg} --eval_script ${eval_script}  --name ${name} 

