# Broken Authentication

## Challenges covered in this chapter

| Name                      | Description                                                                                                                            | Difficulty |
|:--------------------------|:---------------------------------------------------------------------------------------------------------------------------------------|:-----------|
| Bjoern's Favorite Pet     | Reset the password of Bjoern's OWASP account via the Forgot Password mechanism with _the truthful answer_ to his security question.    | ⭐⭐⭐      |
| Change Bender's Password  | Change Bender's password into _slurmCl4ssic_ without using SQL Injection or Forgot Password.                                           | ⭐⭐⭐⭐     |
| GDPR Data Erasure         | Log in with Chris' erased user account.                                                                                                | ⭐⭐⭐      |
| Login Bjoern              | Log in with Bjoern's Gmail account without previously changing his password, applying SQL Injection, or hacking his Google account.    | ⭐⭐⭐⭐     |
| Login CISO                | Exploit OAuth 2.0 to log in with the Chief Information Security Officer's user account.                                                | ⭐⭐⭐⭐⭐   |
| Password Strength         | Log in with the administrator's user credentials without previously changing them or applying SQL Injection.                           | ⭐⭐        |
| Reset Bender's Password   | Reset Bender's password via the Forgot Password mechanism with _the truthful answer_ to his security question.                         | ⭐⭐⭐⭐     |
| Reset Bjoern's Password   | Reset the password of Bjoern's internal account via the Forgot Password mechanism with _the truthful answer_ to his security question. | ⭐⭐⭐⭐⭐   |
| Reset Jim's Password      | Reset Jim's password via the Forgot Password mechanism with _the truthful answer_ to his security question.                            | ⭐⭐⭐      |
| Two Factor Authentication | Solve the 2FA challenge for user "wurstbrot". (Disabling, bypassing or overwriting his 2FA settings does not count as a solution)      | ⭐⭐⭐⭐⭐   |

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

* Hints to the answer to Bjoern's question can be found by looking him
  up on the Internet.
* More precisely, Bjoern might have accidentally (😜) doxxed himself by
  mentioning his security answer on at least one occasion where a camera
  was running.
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

### Change Bender's password into slurmCl4ssic without using SQL Injection or Forgot Password

This challenge can only be solved by changing the password of user
Bender into _slurmCl4ssic_. Using any sort of SQL Injection will _not_
solve the challenge, even if the password is successfully changed in the
process. Beating Bender's security question to change his password also
does not suffice to solve this challenge!

* In previous releases of OWASP Juice Shop this challenge was wrongly
  accused of being based on
  [Cross-Site Request Forgery](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)).
* It might also have been put into the
  [Improper Input Validation](improper-input-validation.md) category.
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

### Log in with Chris' erased user account

This challenge is about loggin in with the account of a user who
previously insisted on his "right to be forgotten" in accordance with
Art. 17 GDPR.

* Trying out the _Request Data Erasure_ functionality might be
  interesting, but cannot help you solve this challenge in real time.
* If you have solved the challenge
  [Retrieve a list of all user credentials via SQL Injection](injection.md#retrieve-a-list-of-all-user-credentials-via-sql-injection)
  you might have already retrieved some information about how the Juice
  Shop "deletes" users upon their request.
* What the Juice Shop does here is totally incompliant with GDPR.
  Luckily a 4% fine on a gross income of 0$ is still 0$.

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

### Exploit OAuth 2.0 to log in with the CISO's user account

You should expect a Chief Information Security Officer knows everything
there is to know about password policies and best practices. The Juice
Shop CISO took it even one step further and chose an incredibly long
random password with all kinds of regular and special characters. Good
luck brute forcing that!

* The challenge description already suggests that the flaw is to be
  found somewhere in the OAuth 2.0 login process.
* While it is also possible to use SQL Injection to log in as the CISO,
  this will not solve the challenge.
* Try to utilize a broken convenience feature in your attack.

### Log in with the administrator's user credentials without previously changing them or applying SQL Injection

You might have already solved this challenge along with
[Log in with the administrator's user account](injection.md#log-in-with-the-administrators-user-account)
if you chose not to use SQL Injection. This challenge can only be solved
if you use the original password of the administrator. If you changed
the password previously, do not despair: The original password will
_always_ be accepted to make sure you can solve this challenge.

* Guessing might work just fine.
* If you harvested the admin's password hash, you can try to attack
  that.
* In case you use some hacker tool, you can also go for a _brute force
  attack_ using a generic _password list_

### Reset Bender's password via the Forgot Password mechanism

This challenge is about finding the answer to user Bender's security
question. It is probably slightly harder to find out than Jim's answer.

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

### Reset the password of Bjoern's internal account via the Forgot Password mechanism

This challenge is about finding the answer to the security question of
Bjoern's internal user account `bjoern@juice-sh.op`.

* Other than with
  [his OWASP account](#reset-the-password-of-bjoerns-owasp-account-via-the-forgot-password-mechanism),
  Bjoern was a bit less careless with his choice of security and answer
  to his internal account.
* Bjoern chose to answer his chosen question truthfully but tried to
  make it harder for attackers by applying sort of a historical twist.
* Again, hints to the answer to Bjoern's question can be found by
  looking him up on the Internet.
* Brute forcing the answer should be next to impossible.

### Reset Jim's password via the Forgot Password mechanism

This challenge is about finding the answer to user Jim's security
question.

* The hardest part of this challenge is actually to find out who Jim
  actually is
* Jim picked one of the worst security questions and chose to answer it
  truthfully
* As Jim is a celebrity, the answer to his question is quite easy to
  find in publicly available information on the internet
* Even brute forcing the answer should be possible with the right kind
  of word list

### Solve the 2FA challenge for user "wurstbrot"

> **Multi-factor authentication (MFA)** is an authentication method in
> which a computer user is granted access only after successfully
> presenting two or more pieces of evidence (or factors) to an
> authentication mechanism: knowledge (something the user and only the
> user knows), possession (something the user and only the user has),
> and inherence (something the user and only the user is).
>
> **Two-factor authentication** (also known as **2FA**) is a type, or
> subset, of multi-factor authentication. It is a method of confirming
> users' claimed identities by using a combination of two different
> factors: 1) something they know, 2) something they have, or 3)
> something they are.
>
> A good example of two-factor authentication is the withdrawing of
> money from an ATM; only the correct combination of a bank card
> (something the user possesses) and a PIN (something the user knows)
> allows the transaction to be carried out.
>
> Two other examples are to supplement a user-controlled password with a
> one-time password (OTP) or code generated or received by an
> authenticator (e.g. a security token or smartphone) that only the user
> possesses.[^4]

In the Juice Shop one customer was very security-aware and set up 2FA
for his account. He goes by the hilarious username _wurstbrot_.[^5]

* As always, first learn how the feature under attack is used and
  behaves under normal conditions.
* Make sure you understand how 2FA with TOTP (time-based one-time
  password) works and which part of it is the critically sensitive one.
* Solving the challenge
  [Retrieve a list of all user credentials via SQL Injection](injection.md#retrieve-a-list-of-all-user-credentials-via-sql-injection)
  before tackling this one will definitely help. But it will not carry
  you all the way.

[^1]: http://goodsecurityquestions.com
[^2]: https://en.wikipedia.org/wiki/Doxing
[^3]: https://en.wikipedia.org/wiki/Rainbow_table
[^4]: https://en.wikipedia.org/wiki/Multi-factor_authentication
[^5]: https://www.dict.cc/?s=wurstbrot