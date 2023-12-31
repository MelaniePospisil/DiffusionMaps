
# Diffusion Maps

![example plots](./example_diffmap_readme.png)
  

Diffusion Maps is a Julia package for dimension reduction using the Diffusion Maps algorithm. It provides a simple and efficient way to reduce the dimensionality of high-dimensional data while preserving the underlying structure. It is built on the MultivariateStats interface, providing the necessary functions such as fit, projection, predict, and reconstruct.

This module is part of a bachelor's thesis at the Technical University of Munich.


  

## Usage

  

### Access

  

To access the Diffusion Map functions, you need to run:

```
pkg> add https://github.com/MelaniePospisil/DiffusionMaps
julia> using DiffusionMaps
````
  

### Creating a Diffusion Map model

  

You can create a DiffMap model by calling the fit function:

  

```
using Random

X = rand(100, 3) # toy data set, 100 observations with 3 features
model = fit(DiffMap, X) # construct a DiffMap model

```

  

The fit function takes the following arguments:

  

- **::Type{DiffMap}:** Type of the DiffMap model.

- **X::AbstractMatrix:** Data matrix of observations. Each row of X is an observation.

You can specify additional keyword arguments to customize the model:

  

- **metric::PreMetric:** The metric used for computing the distance matrix. (Default: DiffMetric(1.0))

- **maxoutdim::Int:** The dimension of the reduced space. (Default: 2)

- **ɛ::Real:** The scale parameter for the Gaussian kernel. (Default: 1.0)

- **α::Real:** A normalization parameter. (Default: 0.5)

- **t::Int:** The number of transitions. (Default: 1)

- **sparse_enabled::Bool:** Enable sparse representation of the kernel matrix. (Default: false)

- **tol::Real:** Tolerance for sparse representation. Values below `tol` in the similarity matrix will be set to zero. (Default: 1e-6)
  

### Get the lower dimensional projection

  

Call ``` project(model)``` on the created model to get the lower dimensional projection.

  

### Embedding New Points

  

You can embed new points into the reduced-dimensional space using the predict function:

  

```
new_points = rand(10, 3) # new points to be embedded
embedding = predict(model, new_points) # embed new points using the model
```

The predict function takes the following arguments:

  

- **model::DiffMap:** The diffusion map model obtained from fitting.

- **new_points::AbstractMatrix:** The new points to be embedded.

- **k::Int = 10:** The number of nearest neighbors to consider. (Default: 10)

## Accessing the model's properties

You can access various properties of the DiffMap model:

- **size(model):** Returns a tuple with the dimensions of the reduced output and observations.
- **indim(model):** Returns the input dimensions of the model.
- **outdim(model):** Returns the output dimensions of the model.
- **eigvals(model):** Returns the eigenvalues of the kernel matrix of the model.
- **eigvecs(model):** Returns the eigenvectors of the kernel matrix of the model.
- **metric(model):** Returns the metric used to calculate the kernel matrix of the model.
- **kernel(model):** Returns the kernel matrix of the model.

## Toy data sets

There are a few toy data sets, including visualization. Those toy data sets are:

- a Double Torus
- Oo_date (A small circle surrounded by a bigger circle)
- a Spiral
- a Swiss Roll
- a Toroidal Helix

They are not exported and have to be cloned or copied.