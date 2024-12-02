# Gustatory-Frame-Extraction-Single-Task
This is the repository of Gustatory information extraction system with a single task approach which is used as a baseline in the paper `Paccosi T. & Tonelli S. (2024). Benchmarking the Semantics of Taste: Towards the Automatic Extraction of Gustatory Language. In CLiC-it, Italian Conference on Computational Linguistics 2024`. We provide the code to train your own model.

These steps are to create the folds in the format required by the BERT (single task) classification. 

## __Step 1 - Create Folds__

The script `create_folds.py` takes into input a folder with INCEpTION annotations exports (Webanno format) and returns the data organized in 5 folds in BERT and Machamp (with labels divided in multiple tasks) formats.

To run the script you need to set the following paramethers:

- `--folder`: The input folder containing INCEpTION exports

-- `output`: Folder where the folds are saved

Other paramethers are:

-- `tasktype`: Type of the output. It can be BERT(default) or MULTITASK

-- `tags`: List of the frame elements to keep in the folds separated by ,

Usage example:

```
python3 create_folds.py --folder en-webanno/ --output OutputDir --tasktype BERT --tags Taste\\_Word,Taste\\_Source,Quality
```

## __Step 2 - Convert Books__

Run the script `books_converter.py` on the folder containing the documents you want to use to extract frame elements and convert them in a format readable by the classifier.

-- `folder`: The input folder containing the books/document (plain txt, no metadata or tags)

-- `output`: The output folder for the converted documents

-- `label`: A short label used to assign an ID to the documents (so that later they can be matched with the metadata)

-- `books`: The script allows to merge multible books into a single file, setting the value to 1 create a file for each book

The script creates a -meta file outside the output folder to map the document ID with the original books.

Usage example:

```
python3 books_converter.py  --folder books_folder --output output_folder --label abc --books 100
```

## __Step 3 - Extract Annotations__

The script `extract_annotations.py` takes as input the folder with the predictions from the classifier and return a tsv with the frame elements, the sentences from which they are extracted and the associated books.

--folder: The input folder containing the predictions of the classifier

--output: File to save the annotations

--stopwords: file containing stopwords to be ignored during the extraction (optional)

--smellwordtag: Label used for the smell word (usualle Smell_Word or Smell\_Word)

--tags: List of the frame elements to extract separated by ,

Usage example:

```
python3 extract_annotations.py --folder [predictions_folder] --tastewordtag Taste_Word --tags Taste_Source,Quality --stopwords stopwords.txt --output out.tsv
```

## __Train the model__

