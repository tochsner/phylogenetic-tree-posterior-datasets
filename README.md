# Phylogenetics Datasets

This repository contains a collection of published phylogenetic datasets. The collections focuses on posterior trees obtained using Bayesian MCMC methods like BEAST2, MrBayes or RevBayes. Having these datasets in a single place makes it easier for method developers to validate their methods on a wide range of real-word datasets.

## 🚀 Getting started

This repository uses Git Large File Storage (LFS) to allow versioning of the potentially large tree files and storing them on GitHub. Install Git LFS first by following the [instructions here](https://git-lfs.com/) or the [Nesi-specific instructions](git_lfs_nesi.md). Afterwards, you can clone this repository like any other Git repository.

If you're only interested in a specific dataset, you can also download it directly from GitHub.

## 🔗 Citation

If you use any of the datasets in this repository, please cite the corresponding papers. Every dataset has a `citation.bib` file in its folder. You can run `make citations` to generate a file with all citations.

## 🌴 How to add a new dataset

Everyone is welcome to add new datasets to the collection. Follow these steps to add a new dataset:

1. Create a new branch for your changes (`git checkout -b my-new-dataset`).

2. Add a new folder in the `datasets` folder with the name of the study the dataset belongs to.

3. Copy the trees files into the newly created folder. Each file should be in the NEXUS format and contain the trees of a MCMC chain. Use the `.trees` extension and do not compress the files.

4. Add a `citation.bib` file to the folder with the bibtex entry of the study.

5. For each added file, add a row to the `datasets/datasets.csv` file. Use the steps below to compute statistics like the tree ESS and entropy.

6. (Optional) Add a `README.md` file to the folder with the following content:

```{markdown}
# <Title of the study>

## Abstract

<Insert the abstract of the study here>

## DOI

<Insert the DOI of the study here and if available, the DOI of the dataset>

## Files

- <file-name-1>: <description of the file 1>
- <file-name-2>: <description of the file 2>
...

## Notes

<If applicable, add any notes additional notes here>
```

7. Commit and push your changes. Then, create a pull request to the main branch.

## 📊 Compute dataset statistics (WIP)

This repository contains a package that can be used to compute the tree ESS and entropy of a dataset. To use the package, run the following command in the root directory of the repository:

```{bash}
unzip PDUtils.zip -d PDUtilsCompiled
PDUtilsCompiled/bin/PDUtils file=<path-to-your-trees-file>
```

The script will output the tree ESS and entropy of the dataset.

## 👩‍💻 Dev Notes

In order to compile the Julia package, run `make build` in the root directory of the repository. This will create a `PDUtils.zip` file in the root directory of the repository containing the compiled package.

When you want to work on the repo without having to download all the datasets every time, you can use a `.lfsconfig` file like this:

```bash
[lfs]
    fetchexclude = "datasets/*"
```

This will tell Git LFS to not download any files in the `datasets` folder.