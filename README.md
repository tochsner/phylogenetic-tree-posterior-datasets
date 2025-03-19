# Phylogenetics Datasets

This repository contains a collection of published phylogenetic datasets. The collections focuses on posterior trees obtained using Bayesian MCMC methods like BEAST2, MrBayes or RevBayes.

## How to add a new dataset

Everyone is welcome to add new datasets to the collection. Follow these steps to add a new dataset:

1. Fork this repository.

2. Add a new folder in the `datasets` folder with the name of the study the dataset belongs to.

3. Copy the trees files into the newly created folder. Each file should be in the NEXUS format and contain the trees of a MCMC chain. Use the `.trees` extension and do not compress the files.

4. Add a `README.md` file to the folder with the following content:

```{markdown}
# <Title of the study>

## Abstract

<Insert the abstract of the study here>

## Files

- <file-name-1>: <description of the file 1>
- <file-name-2>: <description of the file 2>
...

## Notes

<If applicable, add any notes additional notes here>

## Citation

<Insert a bibtex entry here> 
```

5. For each added file, add a row to the `datasets/datasets.csv` file.

6. Commit and push your changes to your forked repository. Then, create a pull request to the main repository.
