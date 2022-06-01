# Contributing

## Welcome

the 2048 team pleased to have you as a contributor to this project.

---

## Table of content

[Our enviroments](#our-enviroments)

[Branching strategy](#branching-strategy)

[Release flows](#release-flows)

---

## Branching strategy

Initially, the default branch would be master. We will create the develop branch and we will make develop branch as the default branch.

- develop (default)

- master

### new features

So for any new feature to be developed, a new branch should be created from develop branch, which should be named like **feature/x.**

### bug fixes

For any bug to be fixed, here also a new branch should be created from develop branch, which should be named **bugfix/x**

## Release flows

### Submitting a Pull Request (PR)

1. make your changes in a new git branch:

```shell
git checkout -b feature/myfeature develop
```

2. Commit your changes using a descriptive commit message that follows our commit message conventions. Adherence to these conventions is necessary because release notes are automatically generated from these messages.

```shell
git commit
```

we use husky as git hook to check formatting.

3. Push your branch to GitHub:

```shell
git push origin feature/myfeature
```

4. Keep your branch updated with develop by Rebasing your branch with develop branch. in case, if you have a conflict you have to resolve it.

```shell
$ git checkout develop
$ git pull
$ git checkout feature/myfeature
$ git rebase develop # update base commit in feature branch
$ git push -f
```

5. If you have multiple commits squash them and write a descriptive commit message that follows our commit message conventions.

```shell
$ git rev-list origin/develop..HEAD #find the number of commits between a branch and develop
$ git rebase -i HEAD~3 # squash commits for example 3 commits
An editor opened, leave the top commit by pick and change all commits to squash/s, save and quit
next windows choose the proper commit messages base on commit message conventions, save and quit
git push -f
```

your commits squash into one.

6. In GitHub, create a pull request to develop branch.

### Commit Message Format

We use [Angular Commit Message Conventions](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit-header). It is very precise rules over how our Git commit messages must be formatted. This format leads to easier to read commit history.

Each commit message consists of a header, a body, and a footer.

```
<header>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The header is mandatory and must conform to the Commit Message Header format.

The body is optional. It must conform to the Commit Message Body format.

The footer is optional. The Commit Message Footer format describes what the footer is used for and the structure it must have.

#### <a name="commit-header"></a>Commit Message Header

```
<type>(<scope>): <short summary>
  │       │             │
  │       │             └─⫸ Summary in present tense. Not capitalized. No period at the end.
  │       │
  │       └─⫸ Commit Scope: animations|bazel|benchpress|common|compiler|compiler-cli|core|
  │                          elements|forms|http|language-service|localize|platform-browser|
  │                          platform-browser-dynamic|platform-server|router|service-worker|
  │                          upgrade|zone.js|packaging|changelog|docs-infra|migrations|ngcc|ve|
  │                          devtools
  │
  └─⫸ Commit Type: build|ci|docs|feat|fix|perf|refactor|test|content
```

The `<type>` and `<summary>` fields are mandatory, the `(<scope>)` field is optional.

##### Type

Must be one of the following:

- **build**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
- **ci**: Changes to our CI configuration files and scripts (examples: CircleCi, SauceLabs)
- **docs**: Documentation only changes
- **feat**: A new feature
- **fix**: A bug fix
- **perf**: A code change that improves performance
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **test**: Adding missing tests or correcting existing tests

##### Scope

The scope is conventional and optional, based on your project scopes. If angular scope helps you, use it. otherwise use your desire scopes.
The scope should be the name of the npm package affected (as perceived by the person reading the changelog generated from commit messages).

### release base on commit message types

| commit message type | release type |
| :-----------------: | :----------: |
|   breaking change   |    major     |
|       revert        |    patch     |
|        feat         |    minor     |
|         fix         |    patch     |
|        perf         |    patch     |
|       content       |    patch     |

### Release branches

Releases are based on 3 different branches

- alpha
- beta
- master

#### master branch:

It releases images and pushes them to the registry based on the type of commit messages. It uses in the production environment. If you want to have a release image please merge in fast-forward way from the beta branch to the master branch.
It uses manual GitHub actions for creating docker images and push to the registry.

#### Merging to master:

For merge beta into the master branch please follow these steps or only run "semantic release | manual" workflow, because it has a step for merging beta into master branch automatically.

```shell
git checkout beta
git pull
git checkout master
git pull
git merge beta --ff-only
git push origin/master
```

#### alpha branch:

It releases alpha (pre-release) docker images and pushes them to the registry based on the type of commit messages. It uses in the development environment. If you want to have an alpha image please create an alpha branch from develop branch. after releasing this pre-release(alpha) to the master(release) branch, please remove it, because we do not need it anymore.
It uses automatic Github actions for creating docker images and push to the registry.

#### beta branch:

It releases beta (pre-release) docker images and pushes them to the registry based on the type of commit messages. It uses in the staging environment. If you want to have a beta image please create a beta branch from beta. after releasing this pre-release(beta) to the master(release) branch, please remove it, because we do not need it anymore.
It uses automatic GitHub actions for creating docker images and push to the registry.

### Non release branches

#### feature/bugfix branches
