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

| Challenge                                                                                                                          | Hints                                                                                                                             |
|:-----------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------|
| Find the carefully hidden 'Score Board' page.                                                                                      | [>>](score-board.md#find-the-carefully-hidden-score-board-page)                                                                   |
| Provoke an error that is not very gracefully handled.                                                                              | [>>](leakage.md#provoke-an-error-that-is-not-very-gracefully-handled)                                                             |
| XSS Tier 1: Perform a reflected XSS attack with `<script>alert("XSS1")</script>`.                                                  | [>>](xss.md#xss-tier-1-perform-a-reflected-xss-attack)                                                                            |
| Get rid of all 5-star customer feedback.                                                                                           | [>>](privilege-escalation.md#get-rid-of-all-5-star-customer-feedback)                                                             |
| Access a confidential document.                                                                                                    | [>>](forgotten-content.md#access-a-confidential-document)                                                                         |
| Access the administration section of the store.                                                                                    | [>>](privilege-escalation.md#access-the-administration-section-of-the-store)                                                      |
| Give a devastating zero-star feedback to the store.                                                                                | [>>](validation.md#give-a-devastating-zero-star-feedback-to-the-store)                                                            |
| Log in with the administrator's user account.                                                                                      | [>>](sqli.md#log-in-with-the-administrators-user-account)                                                                         |
| Log in with the administrator's user credentials without previously changing them or applying SQL Injection.                       | [>>](weak-security.md#log-in-with-the-administrators-user-credentials-without-previously-changing-them-or-applying-sql-injection) |
| Access someone else's basket.                                                                                                      | [>>](privilege-escalation.md#access-someone-elses-basket)                                                                         |
| Access a salesman's forgotten backup file.                                                                                         | [>>](forgotten-content.md#access-a-salesmans-forgotten-backup-file)                                                               |
| Change Bender's password into _slurmCl4ssic_ without using SQL Injection.                                                          | [>>](csrf.md#change-benders-password-into-_slurmcl4ssic_-without-using-sql-injection)                                             |
| Inform the shop about an algorithm or library it should definitely not use the way it does.                                        | [>>](crypto.md#inform-the-shop-about-an-algorithm-or-library-it-should-definitely-not-use-the-way-it-does)                        |
| Order the Christmas special offer of 2014.                                                                                         | [>>](sqli.md#order-the-christmas-special-offer-of-2014)                                                                           |
| Log in with Jim's user account.                                                                                                    | [>>](sqli.md#log-in-with-jims-user-account)                                                                                       |
| Log in with Bender's user account.                                                                                                 | [>>](sqli.md#log-in-with-benders-user-account)                                                                                    |
| XSS Tier 2: Perform a persisted XSS attack with `<script>alert("XSS2")</script>` bypassing a client-side security mechanism.       | [>>](xss.md#xss-tier-2-perform-a-persisted-xss-attack-bypassing-a-client-side-security-mechanism)                                 |
| XSS Tier 3: Perform a persisted XSS attack with `<script>alert("XSS3")</script>` without using the frontend application at all.    | [>>](xss.md#xss-tier-3-perform-a-persisted-xss-attack-without-using-the-frontend-application-at-all)                              |
| Retrieve a list of all user credentials via SQL Injection                                                                          | [>>](sqli.md#retrieve-a-list-of-all-user-credentials-via-sql-injection)                                                           |
| Post some feedback in another users name.                                                                                          | [>>](privilege-escalation.md#post-some-feedback-in-another-users-name)                                                            |
| Place an order that makes you rich.                                                                                                | [>>](validation.md#place-an-order-that-makes-you-rich)                                                                            |
| Access a developer's forgotten backup file.                                                                                        | [>>](forgotten-content.md#access-a-developers-forgotten-backup-file)                                                              |
| Change the `href` of the link within the O-Saft product description into http://kimminich.de.                                      | [>>](privilege-escalation.md#change-the-href-of-the-link-within-the-o-saft-product-description)                                   |
| Inform the shop about a vulnerable library it is using. (Mention the exact library name and version in your comment)               | [>>](crypto.md#inform-the-shop-about-a-vulnerable-library-it-is-using)                                                            |
| Find the hidden easter egg.                                                                                                        | [>>](forgotten-content.md#find-the-hidden-easter-egg)                                                                             |
| Travel back in time to the golden era of web design.                                                                               | [>>](forgotten-content.md#travel-back-in-time-to-the-golden-era-of-web-design)                                                    |
| Upload a file larger than 100 kB.                                                                                                  | [>>](validation.md#upload-a-file-larger-than-100-kb)                                                                              |
| Upload a file that has no .pdf extension.                                                                                          | [>>](validation.md#upload-a-file-that-has-no-pdf-extension)                                                                       |
| Log in with Bjoern's user account without previously changing his password, applying SQL Injection, or hacking his Google account. | [>>](weak-security.md#log-in-with-bjoerns-user-account)                                                                           |
| XSS Tier 4: Perform a persisted XSS attack with `<script>alert("XSS4")</script>` bypassing a server-side security mechanism.       | [>>](xss.md#xss-tier-4-perform-a-persisted-xss-attack-bypassing-a-server-side-security-mechanism)                                 |
| Wherever you go, there you are.                                                                                                    | [>>](weak-security.md#wherever-you-go-there-you-are)                                                                              |
| Apply some advanced cryptanalysis to find _the real_ easter egg.                                                                   | [>>](forgotten-content.md#find-the-hidden-easter-egg)                                                                                                    |
| Retrieve the language file that never made it into production.                                                                     | [>>](forgotten-content.md#retrieve-the-language-file-that-never-made-it-into-production)                                                                                 |
| Exploit OAuth 2.0 to log in with the Chief Information Security Officer's user account.                                            | [>>](weak-security.md#exploit-oauth-20-to-log-in-with-the-cisos-user-account)                                                                                         |
| Forge a coupon code that gives you a discount of at least 80%.                                                                     | [>>](crypto.md#forge-a-coupon-code-that-gives-you-a-discount-of-at-least-80)                                                                                              |
| Fake a continue code that solves only (the non-existent) challenge #99.                                                            | [>>](crypto.md#fake-a-continue-code-that-solves-only-challenge-99)                                                                                             |
| Log in with the support team's original user credentials without applying SQL Injection or any other bypass.                       | [>>](weak-security.md#log-in-with-the-support-teams-original-user-credentials)                                                                                      |

## Challenge Solutions

In case you are getting frustrated with a particular challenge, you can
refer to [Appendix - Challenge solutions](/appendix/README.md) where you
find explicit instructions how to successfully exploit each
vulnerability. It is highly recommended to use this option only as a
last resort. You will learn __a lot more__ from hacking entirely on your
own or relying only on the hints in this part of the book.
