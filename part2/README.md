# Part II - Challenge hunting

This part of the book can be read from end to end as a _hacking guide_.
Used in that way you will be walked through various types of web
vulnerabilities and learn how to exploit their occurences in the Juice
Shop application. Alternatively you can start hacking the Juice Shop on
your own and use this part simply as a reference and _source of hints_
in case you get stuck at a particular challenge.

In case you want to look up hints for a particular challenge, the
following table lists all challenges of the OWASP Juice Shop in the same
order as on the Score Board.

| Challenge                                                                                                                          | Hints                                                    |
|:-----------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------|
| Find the carefully hidden 'Score Board' page.                                                                                      | [>>](score-board.md#scoreBoardChallenge)                 |
| Provoke an error that is not very gracefully handled.                                                                              | [>>](leakage.md#errorHandlingChallenge)                  |
| XSS Tier 1: Perform a reflected XSS attack with `<script>alert("XSS1")</script>`.                                                  | [>>](xss.md#xss1Challenge)                               |
| Get rid of all 5-star customer feedback.                                                                                           | [>>](privilege-escalation.md#fiveStarFeedbackChallenge)                |
| Access a confidential document.                                                                                                    | [>>](forgotten-content.md#confidentialDocumentChallenge) |
| Access the administration section of the store.                                                                                    | [>>](privilege-escalation.md#adminSectionChallenge)                    |
| Give a devastating zero-star feedback to the store.                                                                                | [>>](validation.md#zeroStarFeedbackChallenge)            |
| Log in with the administrator's user account.                                                                                      | [>>](sqli.md#loginAdminChallenge)                        |
| Log in with the administrator's user credentials without previously changing them or applying SQL Injection.                       | [>>](weak-security.md#weakPasswordChallenge)             |
| Access someone else's basket.                                                                                                      | [>>](privilege-escalation.md{#accessBasketChallenge})                                                         |
| Access a salesman's forgotten backup file.                                                                                         | [>>](forgotten-content.md#forgottenBackupChallenge)      |
| Change Bender's password into _slurmCl4ssic_ without using SQL Injection.                                                          | [>>](csrf.md#csrfChallenge)                              |
| Inform the shop about an algorithm or library it should definitely not use the way it does.                                        | [>>](crypto.md#weirdCryptoChallenge)                     |
| Order the Christmas special offer of 2014.                                                                                         | [>>](sqli.md#christmasSpecialChallenge)                  |
| Log in with Jim's user account.                                                                                                    | [>>](sqli.md#loginJimChallenge)                          |
| Log in with Bender's user account.                                                                                                 | [>>](sqli.md#loginBenderChallenge)                       |
| XSS Tier 2: Perform a persisted XSS attack with `<script>alert("XSS2")</script>` bypassing a client-side security mechanism.       | [>>](xss.md#xss2Challenge)                               |
| XSS Tier 3: Perform a persisted XSS attack with `<script>alert("XSS3")</script>` without using the frontend application at all.    | [>>](xss.md#xss3Challenge)                               |
| Retrieve a list of all user credentials via SQL Injection                                                                          | [>>](sqli.md#unionSqlInjectionChallenge)                 |
| Post some feedback in another users name.                                                                                          | [>>](privilege-escalation.md{#forgedFeedbackChallenge})                                                         |
| Place an order that makes you rich.                                                                                                | [>>](validation.md#negativeOrderChallenge)               |
| Access a developer's forgotten backup file.                                                                                        | [>>](forgotten-content.md#forgottenDevBackupChallenge)   |
| Change the `href` of the link within the O-Saft product description into http://kimminich.de.                                      | [>>](privilege-escalation.md{#changeProductChallenge})                 |
| Inform the shop about a vulnerable library it is using. (Mention the exact library name and version in your comment)               | [>>](crypto.md#knownVulnerableComponentChallenge)        |
| Find the hidden easter egg.                                                                                                        | [>>](forgotten-content.md#easterEgg1Challenge)           |
| Travel back in time to the golden era of web design.                                                                               | [>>](forgotten-content.md#geocitiesThemeChallenge)       |
| Upload a file larger than 100 kB.                                                                                                  | [>>](validation.md#uploadSizeChallenge)                  |
| Upload a file that has no .pdf extension.                                                                                          | [>>](validation.md#uploadTypeChallenge)                  |
| Log in with Bjoern's user account without previously changing his password, applying SQL Injection, or hacking his Google account. | [>>](weak-security.md#oauthUserPasswordChallenge)                                                         |
| XSS Tier 4: Perform a persisted XSS attack with `<script>alert("XSS4")</script>` bypassing a server-side security mechanism.       | [>>](xss.md#xss4Challenge)                               |
| Wherever you go, there you are.                                                                                                    | [>>](weak-security.md#redirectChallenge)                 |
| Apply some advanced cryptanalysis to find _the real_ easter egg.                                                                   | [>>](forgotten-content.md#easterEgg2Challenge)           |
| Retrieve the language file that never made it into production.                                                                     | [>>](forgotten-content.md#extraLanguageChallenge)        |
| Exploit OAuth 2.0 to log in with the Chief Information Security Officer's user account.                                            | [>>](weak-security.md#loginCisoChallenge)                                                         |
| Forge a coupon code that gives you a discount of at least 80%.                                                                     | [>>](crypto.md#forgeCouponChallenge)                     |
| Fake a continue code that solves only (the non-existent) challenge #99.                                                            | [>>](crypto.md#continueCodeChallenge)                                                          |

## Challenge Solutions

In case you are getting frustrated with a particular challenge, you can
refer to [Appendix - Challenge solutions](/appendix/README.md) where you
find explicit instructions how to successfully exploit each
vulnerability. It is highly recommended to use this option only as a
last resort. You will learn __a lot more__ from hacking entirely on your
own or relying only on the hints in this part of the book.
