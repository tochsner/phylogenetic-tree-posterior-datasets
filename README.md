# Phylogenetics Datasets

This repository contains a collection of published phylogenetic datasets. We focus on posterior trees obtained using Bayesian MCMC methods like BEAST2, MrBayes or RevBayes. Having these datasets in a single place makes it easier for method developers to validate their methods on a wide range of real-word datasets.

## 🚀 How to download the datasets

### How to download all datasets

This repository uses Git Large File Storage (LFS) to allow versioning of the potentially large tree files and storing them on GitHub. Thus, you can download all datasets by simply cloning this repository:

1. Make sure that you have Git LFS installed by running `git lfs version`. Follow the [official instructions](https://git-lfs.com/) or the [instructions for NeSI or other HPC](git_lfs_nesi.md) to install Git LFS.

2. Clone this repository:

```bash
git clone https://github.com/tochsner/phylogenetic-tree-posterior-datasets.git
```

### How to download a single dataset

To download a single dataset, you can either use GitHub website to download a file manually or use the following command:

```{bash}
wget <download-link>
```

The download link is available in the [datasets overview csv](datasets/datasets.csv).

## 🔗 Citation

If you use any of the datasets in this repository, please cite the corresponding papers. Every dataset has a `citation.bib` file in its folder. You can run `make citations` to generate a file with all citations.

## 🌴 How to add a new dataset

Everyone is welcome to add new datasets to the collection. Follow these steps to add a new dataset:

1. Create a new branch for your changes (`git checkout -b my-new-dataset`).

2. Add a new folder in the `datasets` folder with the name of the study the dataset belongs to.

3. Copy the trees files into the newly created folder. Each file should contain the trees of a MCMC chain and be in the NEXUS format (you can use a tool like [gotree](https://github.com/evolbioinfo/gotree) to convert other file formats). Use the `.trees` extension and do not compress the files.

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