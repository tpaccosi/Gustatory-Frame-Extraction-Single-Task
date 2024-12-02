## __Train the model__

```
pip install -r requirements.txt
```
```
bash train.sh
```

There are 2 possible uses of the `train.py`:

- Hyperparameter search - Use --`hypsearch` option with fold number, language, and the pretrained model to finetune. This is the dat you create with `taste_create_folds.py`. Get the best run parameters from the output and use them later for the actual training or find the right model among the hyperparameter search model runs. Folder name template is {model_name}-{language}-{fold}-hyp/run-N .

- Train - Use --`do_train` option with fold number, language, learning_rate, train_batch_size, train_epochs and the pretrained model to finetune. To get the results on test set, --`do_train` can be used together with --`do_test`. In this case, the script will test the newly fine tuned model on the test of the given fold.
