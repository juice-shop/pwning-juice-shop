# Broken Authentication

## Challenges covered in this chapter

| Challenge                                                                                                                                                | Difficulty                     |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------|
| Log in with the administrator's user credentials without previously changing them or applying SQL Injection.                                             | :star::star:                   |
| Log in with Chris' erased user account.                                                                                                                  | :star::star::star:             |
| Reset the password of Bjoern's OWASP account via the Forgot Password mechanism with _the truthful answer_ to his security question.                      | :star::star::star:             |
| Reset Jim's password via the Forgot Password mechanism with _the truthful answer_ to his security question.                                              | :star::star::star:             |
| Change Bender's password into _slurmCl4ssic_ without using SQL Injection.                                                                                | :star::star::star::star:       |
| Log in with Bjoern's Gmail account without previously changing his password, applying SQL Injection, or hacking his Google account.                      | :star::star::star::star:       |
| Reset Bender's password via the Forgot Password mechanism with _the truthful answer_ to his security question.                                           | :star::star::star::star:       |
| Exploit OAuth 2.0 to log in with the Chief Information Security Officer's user account.                                                                  | :star::star::star::star::star: |
| Reset the password of Bjoern's internal account via the Forgot Password mechanism with _the truthful answer_ to his security question.                   | :star::star::star::star::star: |
| Inform the development team about a danger to some of _their_ credentials. (Send them the URL of the _original report_ or the CVE of this vulnerability) | :star::star::star::star::star: |

### Log in with the administrator's user credentials without previously changing them or applying SQL Injection

You might have already solved this challenge along with
[Log in with the administrator's user account](injection.md#log-in-with-the-administrators-user-account)
if you chose not to use SQL Injection. This challenge can only be solved
if you use the original password of the administrator. If you changed
the password previously, do not despair: The original password will
_always_ be accepted to make sure you can solve this challenge.

#### Hints

* Guessing might work just fine.
* If you harvested the admin's password hash, you can try to attack
  that.
* In case you use some hacker tool, you can also go for a _brute force
  attack_ using a generic _password list_

### Log in with Chris' erased user account

:wrench: **TODO**

#### Hints

:wrench: **TODO**

### Reset the password of Bjoern's OWASP account via the Forgot Password mechanism

This challenge is not about any technical vulnerability. Instead it is
about finding out the answer to user Bjoern's chosen security question
and use it to reset the password of his OWASP account.

> Many website registrations use security questions for both password
> retrieval/reset and sign-in verification. Some also ask the same
> security questions when users call on the phone. Security questions
> are one method to verify the user and stop unauthorized access. But
> there are problems with security questions. Websites may use poor
> security questions that may have negative results:
>
> The user can’t accurately remember the answer or the answer changed,
> The question doesn’t work for the user, The question is not safe and
> could be discovered or guessed by others. It is essential that we use
> good questions. Good security questions meet five criteria. The answer
> to a good security question is:
>
> * **Safe**: cannot be guessed or researched
> * **Stable**: does not change over time
> * **Memorable**: can remember
> * **Simple**: is precise, easy, consistent
> * **Many**: has many possible answers
>
> It is difficult to find questions that meet all five criteria which
> means that some questions are good, some fair, and most are poor. **In
> reality, there are few if any GOOD security questions.** People share
> so much personal information on social media, blogs, and websites,
> that it is hard to find questions that meet the criteria above. In
> addition, many questions are not applicable to some people; for
> example, what is your oldest child’s nickname – but you don’t have a
> child.[^1]

#### Hints

* Hints to the answer to Bjoern's question can be found by looking him
  up on the Internet.
* More precisely, Bjoern might have accidentally
  (:stuck_out_tongue_winking_eye:) doxxed himself by mentioning his
  security answer on at least one occasion where a camera was running.
* Brute forcing the answer might be very well possible with a
  sufficiently extensive list of common pet names.

> Doxing (from dox, abbreviation of documents) or doxxing is the
> Internet-based practice of researching and broadcasting private or
> identifiable information (especially personally identifiable
> information) about an individual or organization.
>
> The methods employed to acquire this information include searching
> publicly available databases and social media websites (like
> Facebook), hacking, and social engineering. It is closely related to
> Internet vigilantism and hacktivism.
>
> Doxing may be carried out for various reasons, including to aid law
> enforcement, business analysis, risk analytics, extortion, coercion,
> inflicting harm, harassment, online shaming, and vigilante
> justice.[^2]

### Reset Jim's password via the Forgot Password mechanism

This challenge is about finding the answer to user Jim's security
question.

#### Hints

* The hardest part of this challenge is actually to find out who Jim
  actually is
* Jim picked one of the worst security questions and chose to answer it
  truthfully
* As Jim is a celebrity, the answer to his question is quite easy to
  find in publicly available information on the internet
* Even brute forcing the answer should be possible with the right kind
  of word list

### Change Bender's password into slurmCl4ssic without using SQL Injection or Forgot Password

This challenge can only be solved by changing the password of user
Bender into _slurmCl4ssic_. Using any sort of SQL Injection will _not_
solve the challenge, even if the password is successfully changed in the
process. Beating Bender's security question to change his password also
does not suffice to solve this challenge!

#### Hints

* In previous releases of OWASP Juice Shop this challenge was wrongly
  accused of being based on
  [Cross-Site Request Forgery](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)).
* It might also have been put into the
  [Weak security mechanisms](roll-your-own-security.md) category.
* Bender's current password is so strong that brute force, rainbow table
  or guessing attacks will probably not work.

> A rainbow table is a precomputed table for reversing cryptographic
> hash functions, usually for cracking password hashes. Tables are
> usually used in recovering a plaintext password up to a certain length
> consisting of a limited set of characters. It is a practical example
> of a space/time trade-off, using less computer processing time and
> more storage than a brute-force attack which calculates a hash on
> every attempt, but more processing time and less storage than a simple
> lookup table with one entry per hash. Use of a key derivation function
> that employs a salt makes this attack infeasible.[^3]

### Log in with Bjoern's Gmail account

The author of the OWASP Juice Shop (and of this book) was bold enough to
link his Google account to the application. His account even ended up in
the initial user records that are shipped with the Juice Shop for your
hacking pleasure!

If you do not see the _Log in with Google_ button, do not despair! The
hostname your Juice Shop is running on is simply not configured in the
OAuth integration with Google. The OAuth-related challenges are still
solvable! It might just take a little bit more detective work to find
out how an OAuth login is handled.

You can always use the official demo instance at
<http://demo.owasp-juice.shop> to play with Google login and learn how
it works there, then apply what you learned on your local instance.

#### Hints

* There are essentially two ways to light up this challenge in green on
  the score board:
  * In case you, dear reader, happen to be Bjoern Kimminich, just log in
    with your Google account to automatically solve this challenge!
    Congratulations!
  * Everybody else might want to take detailed look into how the OAuth
    login with Google is implemented.
* It could bring you some insight to register with your own Google
  account and analyze closely what happens behind the scenes.
* The security flaw behind this challenge is 100% Juice Shop's fault and
  0% Google's.

The unremarkable side note _**without** hacking his Google account_ in
the challenge description is _not a joke_. Please do not try to break
into Bjoern's (or anyone else's) Google account. This would be a
criminal act.

### Reset Bender's password via the Forgot Password mechanism

This challenge is about finding the answer to user Bender's security
question. It is probably slightly harder to find out than Jim's answer.

#### Hints

* If you have no idea who Bender is, please put down this book _right
  now_ and watch the first episodes of
  [Futurama](http://www.imdb.com/title/tt0149460/) before you come back.
* Unexpectedly, Bender also chose to answer his chosen question
  truthfully.
* Hints to the answer to Bender's question can be found in publicly
  available information on the Internet.
* If a seemingly correct answer is not accepted, you _might_ just need
  to try some alternative spelling.
* Brute forcing the answer should be next to impossible.

### Exploit OAuth 2.0 to log in with the CISO's user account

You should expect a Chief Information Security Officer knows everything
there is to know about password policies and best practices. The Juice
Shop CISO took it even one step further and chose an incredibly long
random password with all kinds of regular and special characters. Good
luck brute forcing that!

#### Hints

* The challenge description already suggests that the flaw is to be
  found somewhere in the OAuth 2.0 login process.
* While it is also possible to use SQL Injection to log in as the CISO,
  this will not solve the challenge.
* Try to utilize a broken convenience feature in your attack.

### Reset the password of Bjoern's internal account via the Forgot Password mechanism

This challenge is about finding the answer to the security question of
Bjoern's internal user account `bjoern@juice-sh.op`.

#### Hints

* Other than with
  [his OWASP account](#reset-the-password-of-bjoerns-owasp-account-via-the-forgot-password-mechanism),
  Bjoern was a bit less careless with his choice of security and answer
  to his internal account.
* Bjoern chose to answer his chosen question truthfully but tried to
  make it harder for attackers by applying sort of a historical twist.
* Again, hints to the answer to Bjoern's question can be found by
  looking him up on the Internet.
* Brute forcing the answer should be next to impossible.

### Inform the development team about a danger to some of their credentials

> A software supply chain attack is when an attacker gains access to a
> legitimate software vendor and then compromises either the software or
> update repository. This is done with the intention of installing a
> backdoor, or other malicious code, into the legitimate software update
> provided by the vendor. As users update their software, unwittingly
> falling victim to the Trojanized update, they also install the
> embedded malicious code.[^4]

:information_source: Please note that having the OWASP Juice Shop
installed on your computer _does not_ put you at any actual risk! This
challenge does _neither_ install a backdoor or Trojan nor does it bring
any other harmful code to your system!

#### Hints

* The shop's end users are not the targets here. The developers of the
  shop are!
* This is a research-heavy challenge which does not involve any actual
  hacking.
* Solving
  [Access a developer's forgotten backup file](roll-your-own-security.md#access-a-developers-forgotten-backup-file)
  before attempting this challenge will save you from a lot of
  frustration.

[^1]: http://goodsecurityquestions.com

[^2]: https://en.wikipedia.org/wiki/Doxing

[^3]: https://en.wikipedia.org/wiki/Rainbow_table

[^4]: https://www.rsa.com/en-us/blog/2017-02/are-software-supply-chain-attacks-the-new-norm