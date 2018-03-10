# Security through Obscurity

Most applications contain content which is not supposed to be publicly
accessible. A properly implemented authorization model would ensure that
only users _with appropriate permission_ can access such content. If an
application instead relies on the fact that the content is _not visible
anywhere_, this is called "security through obscurity" which is a severe
anti-pattern:

> In security engineering, security through obscurity (or security by
> obscurity) is the reliance on the secrecy of the design or
> implementation as the main method of providing security for a system
> or component of a system. A system or component relying on obscurity
> may have theoretical or actual security vulnerabilities, but its
> owners or designers believe that if the flaws are not known, that will
> be sufficient to prevent a successful attack. Security experts have
> rejected this view as far back as 1851, and advise that obscurity
> should never be the only security mechanism.[^1]

## Challenges covered in this chapter

| Challenge                                                                                   | Difficulty                           |
|:--------------------------------------------------------------------------------------------|:-------------------------------------|
| Learn about the Token Sale before its official announcement.                                | :star::star::star::star:             |
| Apply some advanced cryptanalysis to find _the real_ easter egg.                            | :star::star::star::star:             |

### Learn about the Token Sale before its official announcement

:wrench: **TODO**

#### Hints

:wrench: **TODO**

### Apply some advanced cryptanalysis to find the real easter egg

Solving the
[Find the hidden easter egg](roll-your-own-security.md#find-the-hidden-easter-egg)
challenge was probably no as satisfying as you had hoped. Now it is time
to tackle the taunt of the developers and hunt down _the real_ easter
egg. This follow-up challenge is basically about finding a secret URL
that - when accessed - will reward you with an easter egg that deserves
the name.

#### Hints

* Make sure you solve
  [Find the hidden easter egg](roll-your-own-security.md#find-the-hidden-easter-egg)
  first.
* You might have to peel through several layers of tough-as-nails
  encryption for this challenge.

[^1]: https://en.wikipedia.org/wiki/Security_through_obscurity
