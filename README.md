# ts-starter

Starting point for my server-side TypeScript projects.

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg?style=flat-square)](http://commitizen.github.io/cz-cli/)

## Features

- Lots of helpers to keep repos tidy and consistent:
    - [commitlint](https://github.com/conventional-changelog/commitlint) + [commitizen](https://github.com/commitizen/cz-cli)
    - [eslint](https://github.com/eslint/eslint)
    - [.editorconfig](https://editorconfig.org/)
    - [prettier](https://github.com/prettier/prettier)
    - [husky](https://github.com/typicode/husky) hooks
- [dotenv](https://editorconfig.org/) for environment config
- Tests with [jest](https://github.com/facebook/jest)
    - Run unit tests or integration tests
    - Examples of a few useful tricks
- [.nvmrc](https://github.com/nvm-sh/nvm) for [auto-switching](https://github.com/nvm-sh/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file) node versions
- Optimised final docker image thanks to multi-stage builds. No dev dependencies or other cruft
- Run all your tests in a container! Useful for CI pipelines. Uses [Docker BuildKit](https://docs.docker.com/develop/develop-images/build_enhancements/)
- Label the Docker image with [OCI Image Format Specification](https://github.com/opencontainers/image-spec) compliant annotations

## Usage

### On your machine

- Build and run
    - `npm i`
    - `npm run start:dev`
- Test
    - `npm run lint`
    - `npm run test`
    - `npm run test:integration`
    
### In Docker

- Build and run
    - `make build`
    - `docker run --rm -it ts-starter:local`
- Test
    - `make lint`
    - `make unit-test`
    - `make integration`
- Get help
    - `make help`

### Making your own

- Clone this repo and delete `.git`
- Update all the required fields in `package.json`
- Update the variables in the first section of the `Makefile`
- Update the timezone in the `Dockerfile`
- Update this `README`
- Away you go!