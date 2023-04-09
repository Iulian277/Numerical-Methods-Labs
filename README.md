# Numerical Methods
This repository contains several `numerical methods` implementations using GNU Octave. Below is a brief description of the directories:

- `utils`:
    - This directory contains `utility` functions that are commonly used in this repository.

- `lu`:
    - This directory contains implementations of `LU` decomposition using the `Crout`, `Doolittle` and `Cholesky` algorithms.

- `qr`:
    - This directory contains implementations of `QR` decomposition using the `Givens`, `Householder` and `Gram-Schmidt` algorithms.

- `gaussian_methods`:
    - This directory contains implementations of Gaussian Elimination with `partial`, `scaled partial` and `total` pivoting.

- `iterative_methods`:
    - This directory contains implementations of `Jacobi`, `Gauss-Seidel` and `SOR` methods for solving linear systems in a iterative fashion.

- `nonlinear_equations`:
    - This directory contains implementations of the `bisection`, `secant` and `Newton-Raphson` methods for finding roots of nonlinear equations.

- `eigenvalues`:
    - This directory contains implementations of the `QR Algorithm`, `Shifted QR`, Image compression using Singular Value Decomposition (`SVD`), and `Power Methods` for computing eigenvalues.

- `interpolations`:
    - This directory contains implementations of `linear`, `Lagrange`, `Vandermonde`, `Newton` and `spline` methods for interpolating functions.

- `differentiation`:
    - This directory contains methods for solving the `first` and `second` derivative of a function.

- `integration`:
    - This directory contains implementations of the `Newton-Cotes`, `Romberg` and `Adaptive Quadrature` methods for integrating functions.

- `differential_equations`:
    - This directory contains implementations of the `Runge-Kutta`, `Adams-Bashforth`, `Adams-Moulton` and `Predictor-Corrector`methods for solving differential equations.


# Contributing
To ensure a productive and collaborative environment, please follow these guidelines when contributing to the repository:

## How to Contribute
### Reporting Bugs or Requesting Features
If you find a bug or would like to request a feature, please create a new `issue` with a clear description of the problem or feature request.

### Contributing Code
`Fork` the repository and `clone` it to your local machine.

Create a new branch for your changes: `git checkout -b feature/your-feature-name`

Make your changes and test them thoroughly.
`Commit` your changes with a descriptive commit message: `git commit -m "Add feature/fix bug"`

`Push` your changes to your forked repository: `git push origin feature/your-feature-name`

Create a `pull request` (PR) against the main branch of the original repository.

We appreciate your interest in contributing to the Numerical Methods repository and look forward to your contributions!
