# 2048-react

![example](https://user-images.githubusercontent.com/19590194/64501857-c37bc600-d2f5-11e9-80b2-879fcaa060e2.png)

This is the [react](https://reactjs.org/) port of the 2048 game designed by Gabriele Cirulli https://github.com/gabrielecirulli/2048

# Issues & Questions

For reporting issues or asking questions please use the [github issues](https://github.com/fazizsoltani/2048/issues)

# Getting Started

Before getting started, you need to install the [latest LTS version of nodejs](https://nodejs.org/en/download/). Also, It is better to use yarn as package manager, for this purpose you can use the following instruction:

```bash
# Install via npm
npm install --global yarn

# Install via Chocolatey
choco install yarn

# Install via Scoop
scoop install yarn

yarn --version
```

## How to install dependencies

Installing all the dependencies is just simple as running one of the following commands:

NPM:

```bash
npm install
```

Yarn:

```bash
yarn install
```

## How to start development

After installing dependencies, running the following command will run a node server on [http://localhost:3000](http://localhost:3000) and code will be compiled at loading of each page. It also supports hot reload, so every change on the source code will be applied to view simultaneously.

NPM:

```bash
npm start
```

Yarn:

```bash
yarn start
```

## How to test dockerize app

build docker image with this command:

```
docker build . -t 2048:1.0.0
```

run container with this command:

```
docker run -d --name 2048-app -p 3000:3000 2048:1.0.0
```

After running conainer, running the following command will run a node server on [http://localhost:3000](http://localhost:3000) and code will be compiled at loading of each page. It also supports hot reload, so every change on the source code will be applied to view simultaneously.

## Contributing

### Contributing Guidelines

Read through our [contributing guidelines](CONTRIBUTING.md) to learn about our submission process, coding rules and more.

## License

The gem is available as open source under the terms of the [MIT License](MIT-LICENSE).
