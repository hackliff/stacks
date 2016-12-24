# Data analysis with Python

## Env

```Bash
$ conda --version
conda 4.2.12
$ python --version
Python 3.5.2 :: Continuum Analytics, Inc.
```

## [Numpy](https://www.dataquest.io/blog/numpy-tutorial-python/)

```Python
# load ssv data
In [14]: wines = np.genfromtxt("winequality-red.csv", delimiter=";", skip_header=1)

# read 4th row
In [15]: wines[3,:]
Out[15]: array([ 11.2  ,   0.28 ,   0.56 ,   1.9  ,   0.075,  17.   ,  60.   ,
0.998,   3.16 ,   0.58 ,   9.8  ,   6.   ])

# convert everythong to int (new array created)
In [16]: wines.astype(np.int32).dtype
Out[16]: dtype('int32')

# add 10 points to each quality score
In [17]: wines[:,11] + 10  # use '+=' for inplace modif

# subsetting wines with notes higher than 5
In [18]: high_quality = wines[:,11] > 7
In [19]: wines[high_quality,:]
dtype
```
