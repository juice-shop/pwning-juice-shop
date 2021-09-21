# Helping with translations

The user interface of OWASP Juice Shop is fully translated into several
languages. For many more languages there is a partial translation
available:

![Language selection dropdown](img/languages.png)

Since release v9.1.0 translation of backend strings such as product
names & descriptions, challenge descriptions and hints as well as
security questions is also supported.

As long as the original author is taking part in the project's
maintenance, there will always be **English** and a complete **German**
translation available. Everything beyond that depends on other volunteer
translators!

## Crowdin

Juice Shop uses a [Crowdin](https://crowdin.com) project to translate
the project and perform reviews:

<https://crowdin.com/project/owasp-juice-shop>

Crowdin is a _Localization Management Platform_ that allows to
crowdsource translations of mobile apps, web, desktop software and
related assets. It is free for open source projects.[^1]

### How to participate?

1. Create an account at Crowdin and log in.
2. Visit the project invitation page
   <https://crowdin.com/project/owasp-juice-shop/invite>
3. Pick a language you would like to help translate the project into

   ![Crowdin project page](img/crowdin_project.png)
4. In the _Files_ tab select the one of the two listed `en.json` source
   files, i.e. `/frontend/src/assets/i18n/en.json` for the UI texts or
   `/data/static/i18n/en.json` for the product, challenge & security
   questions strings.
5. Pick an untranslated label (marked with a red box) and provide a
   translation
6. That is all it takes!

In the background, Crowdin will use the dedicated `l10n_develop` Git
branch to synchronize translations into the `app/i18n/??.json` language
files where `??` is a language code (e.g. `en` or `de`).

### Adding another language

If you do not find the language you would like to provide a translation
for in the list, please contact the OWASP Juice Shop
[project leader](mailto:bjoern.kimminich@owasp.org) or
[raise an issue on GitHub](https://github.com/juice-shop/juice-shop/issues/new)
asking for the missing language. It will be added asap!

## Translating directly via GitHub PR

1. Fork the repository https://github.com/juice-shop/juice-shop
2. Translate the labels in the desired language-`.json` file in
   `/frontend/src/assets/i18n` or `/data/static/i18n`
3. Commit, push and open a Pull Request
4. Done!

If the language you would like to translate into is missing, just add a
corresponding ISO-code-`.json` file to the folders
`/frontend/src/assets/i18n` and `/data/static/i18n`. It will be manually
imported to Crowdin afterwards and added as a new language there as
well.

**The Crowdin process is the preferred way for the project to handle its
translations** as it comes with built-in review and approval options and
is very easy to use. But of course it would be stupid of us to turn down
a translation just because someone likes to edit JSON files manually
more! Just be aware that this is causing extra effort for the core
maintainers of the project to get everything "back in sync".

[^1]: <https://crowdin.com/>

