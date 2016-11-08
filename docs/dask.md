# [Dask](https://dask.pydata.org/en/latest/)

## Conda

```Bash
$ # install conda
$ curl \
  -o /tmp/bootstrap-miniconda.sh \
  "https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh"
$ # automatically accept licence aggreement
$ bash /tmp/bootstrap-miniconda.sh -b
$ export PATH=$HOME/miniconda3/bin/:$PATH
$ conda --version
conda 4.2.12
```

## [Dask tutorial](https://github.com/dask/dask-tutorial)

```Bash
$ conda create --name ds python=3.5.2 numpy pandas h5py Pillow matplotlib scipy toolz pytables ipython
$ conda install dask
$ # somehow installation from conda won't work
$ pip install -U distributed
$ source activate ds
```

```Bash
$ dask-scheduler
$ # it also starts a bokeh web interface at 8787
$ dask-worker 127.0.0.1:8786
```
