Here I dump some machine learning scripts

# Quick start

## Install TensorFlow locally

Install [miniconda](http://conda.pydata.org/miniconda.html)

```
brew install Caskroom/cask/anaconda
```

Install tensorflow

```
# Python 2.7
conda create -n tensorflow python=2.7
# Python 3.5
conda create -n tensorflow python=3.5
# Activate virtualenv
source activate tensorflow

# Linux/Mac OS X, Python 2.7/3.4/3.5, CPU only:
(tensorflow)$ conda install -c conda-forge tensorflow
```

## Install TensorFlow with docker

`gcr.io/tensorflow/tensorflow`: TensorFlow CPU binary image.

Or, use our container:

`docker run -p 8888:8888 --name tensorflow -d twaiclub/tensorflow-python3`

## Run TensorFlow with docker-machine on AWS p2(k80 GPU) instance

[A setup example](provision/setup.sh)

# Beginner

## Linear regression

```
python linear_regression.py
```

## MNIST

```
cd mnist

# For beginner
python beginner.py
# For expert
python expert.py
```
