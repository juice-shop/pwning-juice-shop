# Cryptographic issues

> Initially confined to the realms of academia and the military,
> cryptography has become ubiquitous thanks to the Internet. Common
> every day uses of cryptography include mobile phones, passwords, SSL,
> smart cards, and DVDs. Cryptography has permeated everyday life, and
> is heavily used by many web applications.
>
> Cryptography (or crypto) is one of the more advanced topics of
> information security, and one whose understanding requires the most
> schooling and experience. It is difficult to get right because there
> are many approaches to encryption, each with advantages and
> disadvantages that need to be thoroughly understood by web solution
> architects and developers. In addition, serious cryptography research
> is typically based in advanced mathematics and number theory,
> providing a serious barrier to entry.
>
> The proper and accurate implementation of cryptography is extremely
> critical to its efficacy. A small mistake in configuration or coding
> will result in removing a large degree of the protection it affords
> and rending the crypto implementation useless against serious attacks.
>
> A good understanding of crypto is required to be able to discern
> between solid products and snake oil. The inherent complexity of
> crypto makes it easy to fall for fantastic claims from vendors about
> their product. Typically, these are “a breakthrough in cryptography”
> or “unbreakable” or provide "military grade" security. If a vendor
> says "trust us, we have had experts look at this,” chances are they
> weren't experts![^1]

## Challenges covered in this chapter

| Challenge                                                                                                            | Difficulty |
|:---------------------------------------------------------------------------------------------------------------------|:-----------|
| Inform the shop about an algorithm or library it should definitely not use the way it does.                          | 2 of 5     |
| Inform the shop about a vulnerable library it is using. (Mention the exact library name and version in your comment) | 3 of 5     |
| Apply some advanced cryptanalysis to find _the real_ easter egg.                                                     | 4 of 5     |
| Forge a coupon code that gives you a discount of at least 80%.                                                       | 5 of 5     |
| Fake a continue code that solves only (the non-existent) challenge #99.                                              | 5 of 5     |

### Inform the shop about an algorithm or library it should definitely not use the way it does

To fulfill this challenge you must identify a cryprographic algorithm
(or crypto library) that either * should not be used _at all_ * or is a
_bad choice_ for a given requirement * or is used in an _insecure way_.

#### Hints

* Use the _Contact Us_ form to submit a feedback mentioning the abused
  algorithm or library.
* There are four possible answers and you only need to identify one to
  solve the challenge.
* Cryptographic functions used in the
  [Apply some advanced cryptanalysis to find _the real_ easter egg](#apply-some-advanced-cryptanalysis-to-find-_the-real_-easter-egg)
  challenge _do not count_ as they are only a developer's prank and not
  a serious security problem.

### Inform the shop about a vulnerable library it is using

This challenge is quite similar to
[Inform the shop about an algorithm or library it should definitely not use the way it does](#inform-the-shop-about-an-algorithm-or-library-it-should-definitely-not-use-the-way-it-does)
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

### Apply some advanced cryptanalysis to find _the real_ easter egg

Solving the
[Find the hidden easter egg](forgotten-content.md#find-the-hidden-easter-egg)
challenge was probably no as satisfying as you had hoped. Now it is time
to tackle the taunt of the developers and hunt down _the real_ easter
egg. This follow-up challenge is basically about finding a secret URL
that - when accessed - will reward you with an easter egg that deserves
the name.

#### Hints

* Make sure you solve
  [Find the hidden easter egg](forgotten-content.md#find-the-hidden-easter-egg)
  first.
* You might have to peel through several layers of tough-as-nails
  encryption for this challenge.

### Forge a coupon code that gives you a discount of at least 80%

This is probably one of the hardest challenges in the OWASP Juice Shop.
As you learned during [the "happy path" tour](/part1/happy-path.md), the
webshop offers a _Coupon_ field to get a discount on your entire order
during checkout. The challenge is to get a discount of at least 80% on
an order. As no coupons with this high a discount are published, it is
up to you to forge your own.

#### Hints

* One viable solution would be to reverse-engineer how coupon codes are
  generated and craft your own 80% coupon by using the same (or at least
  similar) implementation.
* Another possible solution might be harvesting as many previous coupon
  as possible and look for patterns that might give you a leverage for a
  brute force attack.
* If all else fails, you could still try to blindly brute force the
  coupon code field before checkout.

### Fake a continue code that solves only challenge #99

The OWASP Juice Shop is _so broken_ that even its convenience features
that have nothing to do with the ecommerce use cases are designed to be
vulnerable. One of these features is the
[Continue Codes](/part1/challenges.md#continue-codes) that allow to
restore previously achieved hacking progress after a break or server
crash.

In order to not mess with the existing challenges accidentally the
challenge is to fake an explicit continue code that would solve
challenge #99 - which does not exist.

#### Hints

* Deduce from all available information (e.g. the `package.json.bak`)
  how the application encrypts and decrypts its continue codes.
* Other than the passwords the continue codes involve an additional
  secret during their encryption.
* What would be a _really stupid_ mistake a developer might make when
  choosing such a secret?

----

[^1]: https://www.owasp.org/index.php/Guide_to_Cryptography
