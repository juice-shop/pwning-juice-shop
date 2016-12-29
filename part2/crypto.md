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
| Solve challenge #99. Unfortunately, this challenge does not exist.                                                   | 5 of 5     |
| Unlock Premium Challenge to access exclusive content.                                                                | 5 of 5     |

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

### Solve challenge #99

The OWASP Juice Shop is _so broken_ that even its convenience features
(which have nothing to do with the ecommerce use cases) are designed to
be vulnerable. One of these features is the
[Your Hacking Session](/part1/challenges.md#saving-and-restoring-hacking-progress)
section on top of the Score Board that allows to save and restore
previously achieved hacking progress after a server crash or a few days
pause.

In order to not mess with the _real challenges_ accidentally, the
challenge is to fake a signal to the application that you successfully
solved challenge #99 - which does not exist.

#### Hints

* Find out how saving and restoring progress is done behind the scenes
* Deduce from all available information (e.g. the `package.json.bak`)
  how the application encrypts and decrypts your hacking progress.
* Other than the user's passwords, the hacking progress involves an
  additional secret during its encryption.
* What would be a _really stupid_ mistake a developer might make when
  choosing such a secret?

### Unlock Premium Challenge to access exclusive content.

These days a lot of seeminly free software comes with hidden or
follow-up costs to use it to its full potential. For example: In
computer games, letting players pay for _Downloadable Content_ (DLC)
after they purchased a full-price game, has become the norm. Often this
is okay, because the developers actually _added_ something worth the
costs to their game. But just as often gamers are supposed to pay for
_just unlocking_ features that were already part of the original
release.

This hacking challenge represents the latter kind of "premium" feature.
_It only exists to rip you hackers off!_ Of course you should never
tolerate such a business policy, let alone support it with your precious
Bitcoins!

That is why the actual challenge here is to unlock and solve the
"premium" challenge _bypassing the paywall_ in front of it.

#### Hints

* This challenge could also have been put into chapter
  [Weak security mechanisms](weak-security.md).
* There is no inappropriate, self-written or misconfigured cryptographic
  library to be exploited here.
* How much protection does a sturdy top-quality door lock add to your
  house if you...
    * ...put the key under the door mat?
    * ...hide the key in the nearby plant pot?
    * ...tape the key to the underside of the mailbox?
* Once more: **You do not have to pay anything to unlock this
  challenge!**

> Sidenote: The Bitcoin address behind the taunting _Unlock_ button is
> actually a valid address of the author. So, if you'd like to donate a
> small amount for the ongoing maintenance and development of OWASP
> Juice Shop - feel free to actually use it! More on
> [donations in part 3](../part3/README.md#donations) of this book.

----

[^1]: https://www.owasp.org/index.php/Guide_to_Cryptography



