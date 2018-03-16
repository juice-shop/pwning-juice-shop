# Roll your own Security

## Challenges covered in this chapter

| Challenge                                               | Difficulty                     |
|:--------------------------------------------------------|:-------------------------------|
| Find the hidden easter egg.                             | :star::star::star::star:       |
| Access a developer's forgotten backup file.             | :star::star::star::star:       |
| Access a misplaced SIEM signature file.                 | :star::star::star::star:       |
| Wherever you go, there you are.                         | :star::star::star::star:       |
| Submit 10 or more customer feedbacks within 10 seconds. | :star::star::star::star::star: |

### Find the hidden easter egg

> An Easter egg is an intentional inside joke, hidden message, or
> feature in an interactive work such as a computer program, video game
> or DVD menu screen. The name is used to evoke the idea of a
> traditional Easter egg hunt.[^1]

#### Hints

* If you solved one of the other four file access challenges, you
  already know where the easter egg is located
* Simply reuse the trick that already worked for the files above

_When you open the easter egg file, you might be a little disappointed,
as the developers taunt you about not having found **the real** easter
egg! Of course finding **that** is
[a follow-up challenge](security-through-obscurity.md#apply-some-advanced-cryptanalysis-to-find-the-real-easter-egg)
to this one._

### Access a developer's forgotten backup file

During an emergency incident and the hotfix that followed, a developer
accidentally pasted an application configuration file into the wrong
place. Downloading this file will not only solve the _Access a
developer's forgotten backup file_ challenge but might also prove
crucial in several other challenges later on.

#### Hints

* Analyze and tamper with links in the application that deliver a file
  directly.
* The file is not directly accessible because a security mechanism
  prevents access to it.
* You need to trick the security mechanism into thinking that the file
  has a valid file type.
* For this challenge there is only _one approach_ to pull this trick.

### Access a misplaced SIEM signature file.

> Security information and event management (SIEM) technology supports
> threat detection and security incident response through the real-time
> collection and historical analysis of security events from a wide
> variety of event and contextual data sources. It also supports
> compliance reporting and incident investigation through analysis of
> historical data from these sources. The core capabilities of SIEM
> technology are a broad scope of event collection and the ability to
> correlate and analyze events across disparate sources.[^2]

The misplaced signature file is actually a rule file for
[Sigma](https://github.com/Neo23x0/sigma), a generic signature format
for SIEM systems:

> Sigma is a generic and open signature format that allows you to
> describe relevant log events in a straight forward manner. The rule
> format is very flexible, easy to write and applicable to any type of
> log file. The main purpose of this project is to provide a structured
> form in which researchers or analysts can describe their once
> developed detection methods and make them shareable with others.
>
> Sigma is for log files what Snort is for network traffic and YARA is
> for files.[^3]

#### Hints

* If you solved one of the other four file access challenges, you
  already know where the SIEM signature file is located
* Simply reuse the trick that already worked for the files above

### Wherever you go, there you are

This challenge is undoubtedly the one with the most ominous description.
It is actually a quote from the computer game
[Diablo](http://us.blizzard.com/en-us/games/legacy/), which is shown on
screen when the player activates a
[Holy Shrine](http://diablo.gamepedia.com/Shrines_%28Diablo_I%29). The
shrine casts the spell
[Phasing](http://diablo.gamepedia.com/Phasing_%28Diablo_I%29) on the
player, which results in _teleportation_ to a random location.

By now you probably made the connection: This challenge is about
_redirecting_ to a different location.

#### Hints

* You can find several places where redirects happen in the OWASP Juice
  Shop
* The application will only allow you to redirect to _whitelisted_ URLs
* Tampering with the redirect mechanism might give you some valuable
  information about how it works under to hood

> White list validation involves defining exactly what _is_ authorized,
> and by definition, everything else is not authorized.[^4]

### Submit 10 or more customer feedbacks within 10 seconds

The _Contact Us_ form for customer feedback contains a CAPTCHA to
protect it from being abused through scripting. This challenge is about
beating this automation protection.

> A completely automated public Turing test to tell computers and humans
> apart, or CAPTCHA, is a program that allows you to distinguish between
> humans and computers. First widely used by Alta Vista to prevent
> automated search submissions, CAPTCHAs are particularly effective in
> stopping any kind of automated abuse, including brute-force attacks.
> They work by presenting some test that is easy for humans to pass but
> difficult for computers to pass; therefore, they can conclude with
> some certainty whether there is a human on the other end.
>
> For a CAPTCHA to be effective, humans must be able to answer the test
> correctly as close to 100 percent of the time as possible. Computers
> must fail as close to 100 percent of the time as possible.[^5]

#### Hints

* You could prepare 10 browser tabs, solving every CAPTCHA and filling
  out the each feedback form. Then you'd need to very quickly switch
  through the tabs and submit the forms in under 10 seconds total.
* Should the Juice Shop ever decide to change the challenge into
  _"Submit 100 or more customer feedbacks within 60 seconds"_ or worse,
  you'd probably have a hard time keeping up with any tab-switching
  approach.
* Investigate closely how the CAPTCHA mechanism works and try to find
  either a bypass or some automated way of solving it dynamically.
* Wrap this into a script (in whatever programming language you prefer)
  that repeats this 10 times.

[^1]: https://en.wikipedia.org/wiki/Easter_egg_(media)

[^2]: https://www.gartner.com/it-glossary/security-information-and-event-management-siem/

[^3]: https://github.com/Neo23x0/sigma#what-is-sigma

[^4]: https://www.owasp.org/index.php/Input_Validation_Cheat_Sheet#White_List_Input_Validation

[^5]: https://www.owasp.org/index.php/Blocking_Brute_Force_Attacks#Sidebar:_Using_CAPTCHAS