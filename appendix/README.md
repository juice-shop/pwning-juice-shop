# Appendix - Challenge solutions

In case you want to look up solutions for a particular challenge, the
following table lists all challenges of the OWASP Juice Shop in the same
order as on the Score Board.

| Challenge                                                                                                                          | Hints                              |
|:-----------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------|
| Find the carefully hidden 'Score Board' page.                                                                                      | [>>](#scoreBoardChallengeSolution) |
| Provoke an error that is not very gracefully handled.                                                                              |                                    |
| XSS Tier 1: Perform a reflected XSS attack with `<script>alert("XSS1")</script>`.                                                  | [>>](#xss1ChallengeSolution)       |
| Get rid of all 5-star customer feedback.                                                                                           |                                    |
| Access a confidential document.                                                                                                    |                                    |
| Access the administration section of the store.                                                                                    |                                    |
| Give a devastating zero-star feedback to the store.                                                                                |                                    |
| Log in with the administrator's user account.                                                                                      |                                    |
| Log in with the administrator's user credentials without previously changing them or applying SQL Injection.                       |                                    |
| Access someone else's basket.                                                                                                      |                                    |
| Access a salesman's forgotten backup file.                                                                                         |                                    |
| Change Bender's password into _slurmCl4ssic_ without using SQL Injection.                                                          |                                    |
| Inform the shop about an algorithm or library it should definitely not use the way it does.                                        |                                    |
| Order the Christmas special offer of 2014.                                                                                         |                                    |
| Log in with Jim's user account.                                                                                                    |                                    |
| Log in with Bender's user account.                                                                                                 |                                    |
| XSS Tier 2: Perform a persisted XSS attack with `<script>alert("XSS2")</script>` bypassing a client-side security mechanism.       | [>>](#xss2ChallengeSolution)       |
| XSS Tier 3: Perform a persisted XSS attack with `<script>alert("XSS3")</script>` without using the frontend application at all.    | [>>](#xss3ChallengeSolution)       |
| Retrieve a list of all user credentials via SQL Injection                                                                          |                                    |
| Post some feedback in another users name.                                                                                          |                                    |
| Place an order that makes you rich.                                                                                                |                                    |
| Access a developer's forgotten backup file.                                                                                        |                                    |
| Change the `href` of the link within the O-Saft product description into http://kimminich.de.                                      |                                    |
| Inform the shop about a vulnerable library it is using. (Mention the exact library name and version in your comment.)              |                                    |
| Find the hidden easter egg.                                                                                                        |                                    |
| Travel back in time to the golden era of web design.                                                                               |                                    |
| Upload a file larger than 100 kB.                                                                                                  |                                    |
| Upload a file that has no .pdf extension.                                                                                          |                                    |
| Log in with Bjoern's user account without previously changing his password, applying SQL Injection, or hacking his Google account. |                                    |
| XSS Tier 4: Perform a persisted XSS attack with `<script>alert("XSS4")</script>` bypassing a server-side security mechanism.       | [>>](#xss4ChallengeSolution)       |
| Wherever you go, there you are.                                                                                                    |                                    |
| Apply some advanced cryptanalysis to find _the real_ easter egg.                                                                   |                                    |
| Retrieve the language file that never made it into production.                                                                     |                                    |
| Exploit OAuth 2.0 to log in with the Chief Information Security Officer's user account.                                            |                                    |
| Forge a coupon code that gives you a discount of at least 80%.                                                                     |                                    |
| Fake a continue code that solves only (the non-existent) challenge #99.                                                            |                                    |
| Log in with the support team's original user credentials without applying SQL Injection or any other bypass. | |

All URLs in the challenge solutions assume you are running the
application locally and on the default port http://localhost:3000.
Change the URL accordingly if you use a different root URL.

### Find the carefully hidden 'Score Board' page {#scoreBoardChallengeSolution}

1. Open the _Source code view_ of your brower from any screen of the
   Juice Shop application.
2. Scroll down to the end of the `<nav>` tag that defines the menu bar
   (see code snippet below).
3. Notice the commented out `<li>` entry labeled "Score Board".
4. Navigate to http://localhost:3000/#/score-board to solve the
   challenge.

```html
      <li class="dropdown" ng-show="isLoggedIn()">
          <a href="#/complain"><i class="fa fa-bomb fa-lg"></i> <span translate="NAV_COMPLAIN"></span></a>
      </li>
      <!--
      <li class="dropdown">
          <a href="#/score-board">Score Board</a>
      </li>
      -->
      <li class="dropdown ribbon-spacer">
          <a href="#/about"><i class="fa fa-info-circle fa-lg"></i> <span translate="TITLE_ABOUT"></span></a>
      </li>
    </ul>
  </div>
</nav>
```

### XSS Tier 1: Perform a reflected XSS attack {#xss1ChallengeSolution}

1. Paste the attack string `<script>alert("XSS1")</script>` into the
   _Search..._ field.
2. Click the _Search_ button.
3. An alert box with the text "XSS1" should appear.

![XSS1 alert box](img/xss1_alert.png)

### XSS Tier 2: Perform a persisted XSS attack bypassing a client-side security mechanism {#xss2ChallengeSolution}

![XSS2 request in PostMan](img/xss2_postman.png)

1. Submit a POST request to http://localhost:3000/api/Users with
    * `{"email": "<script>alert(\"XSS2\")</script>", "password": "xss"}`
      as body
    * and `application/json` as `Content-Type` header.
2. Log in to the application with any user.
3. Visit http://localhost:3000/#/administration.
4. An alert box with the text "XSS2" should appear.
5. Close this box. Notice the seemingly empty row in the _Registered
   Users_ table?
6. Click the "eye"-button next to that empty row.
7. A modal overlay dialog with the user details opens where the attack
   string is rendered as harmless text.

![XSS2 alert box](img/xss2_alert.png)
![XSS2 user in details dialog](img/xss2_user-modal.png)

### XSS Tier 3: Perform a persisted XSS attack without using the frontend application at all {#xss3ChallengeSolution}

![XSS3 request headers in PostMan](img/xss3_postman-header.png)
![XSS3 request body in PostMan](img/xss3_postman-body.png)

1. Log in to the application with any user.
2. Copy your `Authorization` header from any HTTP request submitted via
   browser.
3. Submit a POST request to http://localhost:3000/api/Products with
    * `{"name": "XSS3", "description":
      "<script>alert(\"XSS3\")</script>", "price": 47.11}` as body,
    * `application/json` as `Content-Type`
    * and `Bearer ?` as `Authorization` header, replacing the `?` with
      the token you copied from the browser.
4. Visit http://localhost:3000/#/search.
5. An alert box with the text "XSS3" should appear.
6. Close this box. Notice the product row which seemingly lacks a
   description in the _All Products_ table?
7. Click the "eye"-button next to that row.
8. Another alert box with the text "XSS3" should appear.

![XSS3 alert box](img/xss3_alert.png)
![XSS3 alert box in product details](img/xss3_product-modal_alert.png)

### XSS Tier 4: Perform a persisted XSS attack bypassing a server-side security mechanism {#xss4ChallengeSolution}

In the `package.json.bak` you might have noticed the pinned dependency
`"sanitize-html": "1.4.2"`. Internet research will yield a reported
[XSS - Sanitization not applied recursively](https://nodesecurity.io/advisories/135)
vulnerability, which was fixed with version 1.4.3 - one release later
than used by the Juice Shop. The referenced
[GitHub issue](https://github.com/punkave/sanitize-html/issues/29)
explains the problem and gives an exploit example:

> Sanitization is not applied recursively, leading to a vulnerability to
> certain masking attacks. Example:
>
> `I am not harmless: <<img src="csrf-attack"/>img src="csrf-attack"/>`
> is sanitized to `I am not harmless: <img src="csrf-attack"/>`
>
> Mitigation: Run sanitization recursively until the input html matches
> the output html.

1. Visit http://localhost:3000/#/contact.
2. Enter `<<script>Foo</script>script>alert("XSS4")<</script>/script>`
   as _Comment_
3. Choose a rating and click _Submit_
4. Visit http://localhost:3000/#/about for a first "XSS4" alert (from
   the _Customer Feedback_ slideshow)
5. Visit http://localhost:3000/#/administration for a second "XSS4"
   alert (from the _Customer Feedback_ table)

![XSS4 alert box](img/xss4_alert.png)
![XSS4 alert box in admin area](img/xss4_alert-admin.png)
