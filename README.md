# pre-commit-ginkgo

Pre commit config to run go test using ginkgo testing framework

## :heavy_exclamation_mark: Disclaimer :heavy_exclamation_mark:

:rotating_light::rotating_light::rotating_light: 
**This pre-commit config is adapted to personal projects.
If you have the same needs and plan to use this code you should read the license
first, then make a fork or clone this repository to adapt it to your own 
environment.** 
:rotating_light::rotating_light::rotating_light:

## About

This repository can be integrated to your `.pre-commit-configuration.yaml` 
configuration file to run `ginkgo` tests before each commit.

It will allow you to run `ginkgo` tests on your code before each commit, 
ensuring that the tests pass and that your code is running and does not break
anything before pushing it to the repository.

This **pre-commit** hook is designed to be execute `go test -v $package_name`
when files are modified and added to the commit.
If the tests fail, the commit will be aborted, and you will be prompted to fix 
the issues.
This can prevent future failures during the CI/CD pipeline, and to use resources
unnecessarily.

## Usage

### Requirements

1. `pre-commit` [Installation section](https://pre-commit.com/#install).
2. `Go compiler` [Installation page](https://golang.org/doc/install).
3. `ginkgo` [Documentation](https://onsi.github.io/ginkgo/).

### Installation

#### Hooks configuration

* `euphoria-ginko` - Runs `go test -v $package_name`. **Arguments**:
    * `packages`: *(string array)* add the packages you want to test when 
      pre-commit hooks are executed.

#### Example

Update your `.pre-commit-config.yaml` file to include the `ginkgo` hook.
You can use the example below as a starting point:

````yaml
repos:
    # ...your other hooks...
-   repo: https://github.com/euphoria-laxis/pre-commit-ginkgo
    rev: master
    hooks:
    - id: euphoria-ginkgo
      packages: 
          - euphoria-laxis
          - package_to_test 
          - other_package_to_test
````

## Contributors

#### Maintainer(s)

* **[Euphoria Laxis](https://github.com/euphoria-laxis)**. [Contact](mailto:euphoria.laxis@euphoria-laxis.com)


## License

This project is under [BSD 3-Clause License](./LICENSE). You should read it first if you plan any
commercial usage of this code.
