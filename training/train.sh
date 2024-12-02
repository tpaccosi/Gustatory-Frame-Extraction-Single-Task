#!/bin/bash

todo="train"

if [ "$todo" == "hyperparam" ];
then
  echo "Hyperparameter search."
  python3 train.py --hypsearch \
                                 --lang "english" \
                                 --fold 0 \
                                 --model "xlm-roberta-large"
elif [ "$todo" == "train" ];
then
  echo "Train the model."
  python3 train.py --do_train --do_test \
                                 --lang "english" \
                                 --fold 0 \
                                 --learning_rate 2e-5 \
                                 --train_batch_size 4 \
                                 --train_epochs 3 \
                                 --model "xlm-roberta-large"

elif [ "$todo" == "test" ];
then
  echo "Test the model."
  python3 train.py --do_test \
                                 --lang "english" \
                                 --fold 0 \
                                 --model "xlm-roberta-large/checkpoint-2055"

fi                            
