# Vulnerable Components

The challenges in this chapter are all about security issues of
libraries or other 3rd party components the application uses internally.

## Challenges covered in this chapter

| Challenge                                                                                                            | Difficulty |
|:---------------------------------------------------------------------------------------------------------------------|:-----------|
| Inform the shop about a vulnerable library it is using. (Mention the exact library name and version in your comment) | 3 of 5     |
| Inform the shop about a typosquatting trick it has become victim of. (Mention the exact name of the culprit)         | 3 of 5     |
| Inform the shop about a more literal instance of typosquatting it fell for. (Mention the exact name of the culprit)  | 4 of 5     |

### Inform the shop about a vulnerable library it is using

This challenge is quite similar to
[Inform the shop about an algorithm or library it should definitely not use the way it does](crypto.md#inform-the-shop-about-an-algorithm-or-library-it-should-definitely-not-use-the-way-it-does)
with the difference, that here not the _general use_ of the library is
the issue. The application is just using _a version_ of a library that
contains known vulnerabilities.

#### Hints

* Use the _Contact Us_ form to submit a feedback mentioning the
  vulnerable library including its exact version.
* There are two possible answers and you only need to identify one to
  solve the challenge.
* Look for possible dependencies related to security in the
  `package.json.bak` you harvested earlier.
* Do some research on the internet for known security issues in the most
  suspicious application dependencies.

### Inform the shop about a typosquatting trick it has become victim of

> Typosquatting, also called URL hijacking, a sting site, or a fake URL,
> is a form of cybersquatting, and possibly brandjacking which relies on
> mistakes such as typos made by Internet users when inputting a website
> address into a web browser. Should a user accidentally enter an
> incorrect website address, they may be led to any URL (including an
> alternative website owned by a cybersquatter).
>
> The typosquatter's URL will usually be one of four kinds, all similar
> to the victim site address (e.g. example.com):
>
> * A common misspelling, or foreign language spelling, of the intended
>   site: exemple.com
> * A misspelling based on typos: examlpe.com
> * A differently phrased domain name: examples.com
> * A different top-level domain: example.org
> * An abuse of the Country Code Top-Level Domain (ccTLD): example.cm by
>   using .cm, example.co by using .co, or example.om by using .om. A
>   person leaving out a letter in .com in error could arrive at the
>   fake URL's website.
>
> Once in the typosquatter's site, the user may also be tricked into
> thinking that they are in fact in the real site, through the use of
> copied or similar logos, website layouts or content. Spam emails
> sometimes make use of typosquatting URLs to trick users into visiting
> malicious sites that look like a given bank's site, for instance.[^1]

:wrench: **TODO**

#### Hints

* This challenge has nothing to do with URLs or domains.
* Investigate the
  [forgotten developer's backup file](forgotten-content.md#access-a-developers-forgotten-backup-file)
  instead.
* [Malicious packages in npm](https://iamakulov.com/notes/npm-malicious-packages/)
  is a worthwhile read on [Ivan Akulov’s blog](https://iamakulov.com).

### Inform the shop about a more literal instance of typosquatting it fell for

:wrench: **TODO**

#### Hints

* Like
  [the above one](#inform-the-shop-about-a-typosquatting-trick-it-has-become-victim-of)
  this challenge also has nothing to do with URLs or domains.
* Other than for the above tier one, combing through the
  `package.json.bak` does not help for this challenge.
* This typoquatting instance literally exploits a potentially common
  typo.

[^1]: https://en.wikipedia.org/wiki/Typosquatting

