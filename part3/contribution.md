# Contribute to development

If you would like to contribute to OWASP Juice Shop but need some idea
what task to address, the best place to look is in the GitHub issue
lists at <https://github.com/bkimminich/juice-shop/issues>.

!["help wanted" label on GitHub](img/help_wanted-label.png)
!["good first issue" label on GitHub](img/good_first_issue-label.png)

* Issues labelled with **help wanted** indicate tasks where the project
  team would very much appreciate help from the community
* Issues labelled with **good first issue** indicate tasks that are
  isolated and not too hard to implement, so they are well-suited for
  new contributors

The following sections describe in detail the most important rules and
processes when contributing to the OWASP Juice Shop project.

## Tips for newcomers

If you are new to application development - particularly with AngularJS
and Express.js - it is recommended to read the
[Codebase 101](codebase.md) to get an overview what belongs where. It
will lower the entry barrier for you significantly.

## Version control

The project uses `git` as its version control system and GitHub as the
central server and collaboration platform. OWASP Juice Shop resides in
the following repository:

<https://github.com/bkimminich/juice-shop>

### Branching model

OWASP Juice Shop is maintained in a simplified
[Gitflow](http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/)
fashion, where all active development happens on the `develop` branch
while `master` is used to deploy stable versions to the
[Heroku demo instance](https://juice-shop.herokuapp.com) and later
create tagged releases from.

Feature branches are only used for long-term tasks that could jeopardize
regular releases from `develop` in the meantime. Likewise prototypes and
experiments must be developed on an individual branch or a distinct fork
of the entire project.

### Versioning

Any release from `master` is tagged with a unique version in the format
`vMAJOR.MINOR.PATCH`, for example `v1.3.0` or `v4.1.2`.

> Given a version number `MAJOR.MINOR.PATCH`, increment the:
>
> 1. `MAJOR` version when you make incompatible API changes,
> 2. `MINOR` version when you add functionality in a
>    backwards-compatible manner, and
> 3. `PATCH` version when you make backwards-compatible bug fixes.[^1]

The current version of the project must be manually maintained in the
following two places:

* `/package.json` in property `"version"`
* `/bower.json` in property `"version"`

All other occurrences of the version (i.e. Docker images, packaged
releases & the menu bar of the application itself) are resolved through
the `"version"` property of `/package.json` automatically.

### Pull requests

Using Git-Flow means that PRs have the highest chance of getting
accepted and merged when you open them on the `develop` branch of your
fork. That allows for some post-merge changes by the team without
directly compromising the `master` branch, which is supposed to hold
always be in a release-ready state.

It is usually not a big deal if you accidentally open a PR for the
`master` branch. GitHub added the possibility to change the target
branch for a PR afterwards some time ago.

## Contribution guidelines

The minimum requirements for code contributions are:

1. The code must be compliant with the
   [JS Standard Code Style rules](http://standardjs.com)
2. All new and changed code should have a corresponding unit and/or
   integration test
3. New and changed challenges should have a corresponding e2e test
4. All unit, integration and e2e tests must pass locally

### JavaScript standard style guide

Since v2.7.0 the `npm test` script also verifies code compliance with
the `standard` style before running the tests. If PRs deviate from this
coding style, they will now immediately fail their build and will not be
merged until compliant.

![JavaScript Style Guide](img/badge.svg)

In case your PR is failing from style guide issues try running `standard
--fix` over your code - this will fix all syntax or code style issues
automatically without breaking your code. You might need to `npm i -g
standard` first.

### Testing

```
npm test           # check for code style violations and run all unit tests
npm run frisby     # run all API integration tests
npm run protractor # run all end-to-end tests
```

Pull Requests are verified to pass all of the following test stages
during the
[continuous integration build](https://travis-ci.org/bkimminich/juice-shop).
It is recommended that you run these tests on your local computer to
verify they pass before submitting a PR. New features should be
accompanied by an appropriate number of corresponding tests to verify
they behave as intended.

#### Unit tests

There is a full suite containing isolated unit tests

* for all client-side code in `test/client`
* for the server-side routes and libraries in `test/server`

```
npm test
```

#### Integration tests

The integration tests in `test/api` verify if the backend for all normal
use cases of the application works. All server-side vulnerabilities are
also tested.

```
npm run frisby
```

These tests automatically start a server and run the tests against it. A
working internet connection is recommended.

#### End-to-end tests

The e2e test suite in `test/e2e` verifies if all client- and server-side
vulnerabilities are exploitable. It passes only when all challenges are
solvable on the score board.

```
npm run protractor
```

The end-to-end tests require a locally installed Google Chrome browser
and internet access to be able to pass.

#### Mutation tests

The [mutation tests](https://en.wikipedia.org/wiki/Mutation_testing)
ensure the quality of the unit test suite by making small changes to the
code that should cause one or more tests to fail. If none does this
"mutated line" is not properly covered by meaningful assertions and the
mutation testing engine that will inform you about this.

```
npm run stryker
```

Currently only the client-side unit tests are covered by mutation tests.
The integration and end-to-end tests are not suitable for mutation
testing because they run against a real server instance with
dependencies to the database and an internet connection. The mutation
tests are intentionally not executed on Travis-CI due to their
significant execution time.

## Continuous integration & deployment

### Travis-CI

The main build and CI server for OWASP Juice Shop is set up on
Travis-CI:

<https://travis-ci.org/bkimminich/juice-shop>

On every push to any branch on GitHub, a build is triggered on
Travis-CI. A build consists of several jobs: One for each version of
Node.js that is officially supported by the application. Each job
performs the following actions:

1. Clone the repository and checkout the branch to build
2. Build the application
3. Execute the quality checks consisting of
   * Compliance check against the
     [JS Standard Code Style rules](http://standardjs.com)
   * Unit tests for the Angular client
   * Unit tests for the Express routes and server-side libraries
   * Integration tests for the server-side API
   * End-to-end tests verifying that all challenges can be solved
4. Upload of the quality metrics to
   [Code Climate](https://codeclimate.com/github/bkimminich/juice-shop)
5. Deployment to a Heroku instance
   * <https://juice-shop-staging.herokuapp.com> for `develop` branch
     builds
   * <https://juice-shop.herokuapp.com> for `master` branch builds
6. Trigger some monitoring endpoints about the build result

Pull Requests are built in the same manner (steps 1-3) to assess if they
can safely be merged into the codebase. For tag-builds (i.e. versions to
be released) an additional step is to package release-artifacts for
Linux for each Node.js version and attach these to the release page on
GitHub.

### AppVeyor

AppVeyor is used as a secondary CI server to check if the application
can be built on Windows. It also packages and attaches release-artifacts
for Windows in case a tag-build is executed:

<https://ci.appveyor.com/project/bkimminich/juice-shop>

### Testing packaged distrubutions

During releases the application will be packaged into `.zip`/`.tgz`
archives for another easy setup method. When you contribute a change
that impacts what the application needs to include, make sure you test
this manually on your system.

```
grunt package
```

Then take the created archive from `/dist` and follow the steps
described above in
[Packaged Distributions](https://github.com/bkimminich/juice-shop#packaged-distributions--)
to make sure nothing is broken or missing.

[^1]: <http://semver.org>
