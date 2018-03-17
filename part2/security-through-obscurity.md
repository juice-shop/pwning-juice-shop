# Security through Obscurity

Many applications contain content which is not supposed to be publicly
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

| Challenge                                                        | Difficulty               |
|:-----------------------------------------------------------------|:-------------------------|
| Learn about the Token Sale before its official announcement.     | :star::star::star:       |
| Apply some advanced cryptanalysis to find _the real_ easter egg. | :star::star::star::star: |

### Learn about the Token Sale before its official announcement

Juice Shop does not want to miss out on the chance to gain some easy
extra funding, so it prepared to launch a "Token Sale" (synonymous for
"Initial Coin Offering") to sell its newly invented cryptocurrency to
its customers and future investors. This challenge is about finding the
prepared-but-not-yet-published page about this ICO in the application.

> An initial coin offering (ICO) is a controversial means of
> crowdfunding centered around cryptocurrency, which can be a source of
> capital for startup companies. In an ICO, a quantity of the
> crowdfunded cryptocurrency is preallocated to investors in the form of
> "tokens", in exchange for legal tender or other cryptocurrencies such
> as bitcoin or ethereum. These tokens supposedly become functional
> units of currency if or when the ICO's funding goal is met and the
> project launches.
>
> ICOs provide a means by which startups avoid costs of regulatory
> compliance and intermediaries, such as venture capitalists, bank and
> stock exchanges, while increasing risk for investors. ICOs may fall
> outside existing regulations or may need to be regulated depending on
> the nature of the project, or are banned altogether in some
> jurisdictions, such as China and South Korea.
>
> \[...\] The term may be analogous with "token sale" or crowdsale,
> which refers to a method of selling participation in an economy,
> giving investors access to the features of a particular project
> starting at a later date. ICOs may sell a right of ownership or
> royalties to a project, in contrast to an initial public offering
> which sells a share in the ownership of the company itself.[^2]

#### Hints

* Guessing or brute forcing the URL of the token sale page is very
  unlikely to succeed.
* You should closely investigate the place where all paths within the
  application are defined.
* Beating the employed obfuscation mechanism manually will take some
  time. Maybe there is an easier way to undo it?

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

[^2]: https://en.wikipedia.org/wiki/Initial_coin_offering
