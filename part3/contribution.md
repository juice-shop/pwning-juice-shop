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

If you are new to application development - particularly with Angular
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

The current version of the project (omitting the leading `v`) must be
manually maintained in the following three places:

* `/package.json` in the `"version"` property
* `/frontend/package.json` in the `"version"` property
* `/Dockerfile` in the `LABEL` named `org.opencontainers.image.version`

All other occurrences of the version (i.e. packaged releases & the menu
bar of the application itself) are resolved through the `"version"`
property of `/package.json` automatically.

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

### Linting

![JavaScript Style Guide](img/badge.svg)

```bash
npm run lint
```

The `npm run lint` script verifies code compliance with

* the `standard` code style (for all server-side JavaScript code)
* the TSLint rules for the frontend TypeScript code (which are defined
  to be equal to `standard` by deriving from `tslint-config-standard`)

If PRs deviate from this coding style, they will the build and will not
be merged until made compliant.

In case your PR is failing from style guide issues try running `standard
--fix` over your code - this will fix all syntax or code style issues
automatically without breaking your code.

:point_up: For this you will need to install `standard` globally on your
computer with `npm i -g standard`.

### Testing

```bash
npm test           # run all unit tests
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

* for all client-side code in `frontend/src/app/**/*.spec.ts`
* for the server-side routes and libraries in `test/server/*Spec.js`

```bash
npm test
```

#### Integration tests

The integration tests in `test/api/*Spec.js` verify if the backend for
all normal use cases of the application works. All server-side
vulnerabilities are also tested.

```bash
npm run frisby
```

These tests automatically start a server and run the tests against it. A
working internet connection is recommended.

#### End-to-end tests

The e2e test suite in `test/e2e/*Spec.js` verifies if all client- and
server-side vulnerabilities are exploitable. It passes only when all
challenges are solvable on the score board.

```bash
npm run protractor
```

The end-to-end tests require a locally installed Google Chrome browser
and internet access to be able to pass.

If you have a web proxy configured via `HTTP_PROXY` environment
variable, the end-to-end tests will honor this setting. This can be
useful to e.g. run the tests through tools like
[OWASP ZAP](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)
or Burpsuite.

### Testing packaged distrubutions

During releases the application will be packaged into `.zip`/`.tgz`
archives for another easy setup method. When you contribute a change
that impacts what the application needs to include, make sure you test
this manually on your system.

```bash
npm install --production && grunt package
```

Then take the created archive from `/dist` and follow the steps
described above in
[Packaged Distributions](https://github.com/bkimminich/juice-shop#packaged-distributions--)
to make sure nothing is broken or missing.

## Continuous integration & deployment

### Travis-CI

The main build and CI server for OWASP Juice Shop is set up on
Travis-CI:

<https://travis-ci.org/bkimminich/juice-shop>

On every push to GitHub, a build is triggered on Travis-CI. A build
consists of several stages in which one or more jobs are executed. Not
only direct pushes to the `master` and `develop` branches are built, but
Pull Requests from other branches or forks as well. This helps the
project team to assess if a PR can be safely merged into the codebase.
For tag-builds (i.e. versions to be released) the some additional steps
are necessary to package the
[release-artifacts for Linux for each supported Node.js version](../part1/running.md#from-pre-packaged-distribution)
and attach these to the release page on GitHub. Lastly, not all stages
are executed for all supported Node.js versions in order to shorten the
feedback loop. The higher-level integration and e2e tests are only run
for the officially preferred Node.js version
{{book.recommendedNodeVersion}}.


| :arrow_right: Stage Trigger :arrow_down: | Lint                                                           | Test                                                                                                                                                 | Integration                                                                                                                                                                                                                        | E2e                                                                              | Deploy                                                          |
|:-----------------------------------------|:---------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------|:----------------------------------------------------------------|
|                                          | [Linting](#linting) on Node.js {{book.recommendedNodeVersion}} | [Unit tests](#unit-tests) on Node.js {{book.nodeVersions}}                                                                                           | [Integration tests](#integration-tests) and re-run [Unit tests](#unit-tests) on Node.js {{book.recommendedNodeVersion}} and publish combined coverage data to [Code Climate](https://codeclimate.com/github/bkimminich/juice-shop) | [End-to-end tests](#end-to-end-tests) on Node.js {{book.recommendedNodeVersion}} | Deploy Node.js {{book.recommendedNodeVersion}} to Heroku        |
| **Push to `develop`**                    | :heavy_check_mark:                                             | :heavy_check_mark:                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                 | :heavy_check_mark:                                                               | :heavy_check_mark: to <http://juice-shop-staging.herokuapp.com> |
| **Push to `master`**                     | :heavy_check_mark:                                             | :heavy_check_mark:                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                 | :heavy_check_mark:                                                               | :heavy_check_mark: to <http://juice-shop.herokuapp.com>         |
| **Pull Request**                         | :heavy_check_mark:                                             | :heavy_check_mark:                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                 | :heavy_check_mark:                                                               | :x:                                                             |
| **Version tag**                          | :x:                                                            | :x: instead compile and release [pre-packaged distributions](#testing-packaged-distrubutions) for Linux with Node.js {{book.nodeVersions}} to GitHub | :x:                                                                                                                                                                                                                                | :x:                                                                              | :x:                                                             |

:information_source: The stages in the table above are executed
sequentially from left to right. A failing job in any stage will break
the build and all following stages will not be executed allowing a
faster feedback loop.

### AppVeyor

AppVeyor is used as a secondary CI server to check if the application
can be built on Windows:

<https://ci.appveyor.com/project/bkimminich/juice-shop>

No linters or test suites are executed. Instead AppVeyor packages and
attaches
[release-artifacts for Windows for each supported Node.js version](../part1/running.md#from-pre-packaged-distribution)
to GitHub in case a tag-build is executed.

| Trigger               | Build Tasks                                                                                                                      |
|:----------------------|:---------------------------------------------------------------------------------------------------------------------------------|
|                       | Compile and archive [pre-packaged distributions](#testing-packaged-distrubutions) for Windows with Node.js {{book.nodeVersions}} |
| **Push to `develop`** | :heavy_check_mark:                                                                                                               |
| **Push to `master`**  | :heavy_check_mark:                                                                                                               |
| **Pull Request**      | :heavy_check_mark:                                                                                                               |
| **Version tag**       | :heavy_check_mark: and release to GitHub                                                                                         |

[^1]: <http://semver.org>
