# Helping with translations

The user interface of OWASP Juice Shop is fully translated into several
languages. For many other languages there is a partial translation
available:

![Language selection dropdown](img/languages.png)

> As long as the original author is taking part in the project's
> maintenance, there will always be **English** and a complete
> **German** translation available. Everything beyond that depends on
> volunteer translators!

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
4. In the _Files_ tab select the listed source file `en.json`
5. Pick an untranslated label (marked with a red box) and provide a
   translation
6. That is all it takes!

![Crowdin project page](img/crowdin_project.png)

### Adding another language

If you do not find the language you would like to provide a translation
for in the list, please contact the OWASP Juice Shop
[project leader](mailto:bjoern.kimminich@owasp.org) or
[raise an issue on GitHub](https://github.com/bkimminich/juice-shop/issues/new)
asking for the missing language. It will be added asap!

## Translating directly via GitHub PR

1. Fork the repository https://github.com/bkimminich/juice-shop
2. Translate the labels in the desired language-`.json` file in
   `/app/i18n`
3. Commit, push and open a Pull Request
4. Done!

If the language you would like to translate into is missing, just add a
corresponding two-letter-ISO-code-`.json` file to the folder
`/app/i18n`. It will be imported to Crowdin afterwards and added as a
new language there as well.

> The Crowdin process is the preferred way for the project to handle its
> translations as it comes with built-in review and approval options and
> is very easy to use. But of course it would be stupid of us to turn
> down a translation just because someone likes to edit JSON files
> manually more!

----

[^1]: <https://crowdin.com/>
