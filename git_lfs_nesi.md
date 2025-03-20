# Installation of Git Large File Storage (LFS) on NESI or other HPC clusters

1. Check if Git LFS is already installed by running `git lfs version`.

2. Go to the [releases page of the Git LFS repository](https://github.com/git-lfs/git-lfs/releases) and copy the download link of the lastest `git-lfs-linux-amd64-vx.x.x.tar.gz` file.

3. Equipped with the download link, run the following commands in your home directory (adjust the version numbers accordingly):

```bash
# Download the tar.gz file and extract it
wget https://github.com/git-lfs/git-lfs/releases/download/v3.6.1/git-lfs-linux-amd64-v3.6.1.tar.gz
tar -xvzf git-lfs-linux-amd64-v3.6.1.tar.gz
rm git-lfs-linux-amd64-v3.6.1.tar.gz

# Install Git LFS
cd git-lfs-3.6.1
./install.sh --local

# Add the Git LFS executable to your PATH
export PATH=~/.local/bin:$PATH

# Test if Git LFS is installed correctly
git lfs version
```

4. Now you're ready to clone this repo:

```bash
git clone https://github.com/tochsner/phylogenetic-tree-posterior-datasets.git
```