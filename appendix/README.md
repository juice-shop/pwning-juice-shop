# Appendix - Challenge solutions

All URLs in the challenge solutions assume you are running the
application locally and on the default port http://localhost:3000.
Change the URL accordingly if you use a different root URL.

Often there are multiple ways to solve a challenge. In most cases just
one possible solution is presented here. This is typically the easiest
or most obvious one from the authors perspective.

### Find the carefully hidden 'Score Board' page

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

### Provoke an error that is not very gracefully handled.

Any request that cannot be properly handled by the server will
eventually be passed to a global error handling component that sends an
error page to the client that includes a stacktrace and other sensitive
information. The restful API behaves in a similar way, passing back a
JSON error object with sensitive data, such as SQL query strings.

Here are four examples (out of many different ways) to provoke such an
error situation and solve this challenge along the way:

* Visit <http://localhost:3000/#/search?q=';>

![Javascript Error](img/error-js_console.png)

* Visit <http://localhost:3000/ftp/crash>

![404 Error](img/error_page-404.png)

* Visit <http://localhost:3000/ftp/crash.md>

![403 Error](img/error_page-403.png)

* Log in to the application with `'` (single-quote) as _Email_ and
  anything as _Password_

![SQL in UI Error](img/login-error_sql.png)

### XSS Tier 1: Perform a reflected XSS attack

1. Paste the attack string `<script>alert("XSS1")</script>` into the
   _Search..._ field.
2. Click the _Search_ button.
3. An alert box with the text "XSS1" should appear.

![XSS1 alert box](img/xss1_alert.png)

### Get rid of all 5-star customer feedback

1. Log in to the application with any user.
2. Solve
   [Access the administration section of the store](#access-the-administration-section-of-the-store)
3. Delete all entries with five star rating from the _Customer Feedback_
   table using the trashcan button

![Feedback table on Administration page](img/customer_feedback-table.png)

### Access a confidential document

1. Follow the link to titled _Check out our boring terms of use if you
   are interested in such lame stuff_
   (<http://localhost:3000/ftp/legal.md?md_debug=true>) on the _About
   Us_ page.
2. Successfully attempt to browse the directory by changing the URL into
   <http://localhost:3000/ftp>
3. Open <http://localhost:3000/ftp/acquisitions.md> to solve the
   challenge.

![FTP directory browser](img/ftp_directory.png)

### Access the administration section of the store

1. Open the `juice-shop.min.js` in your brower's developer tools and
   search for "admin".
2. Among the first entries you will find a route mapping to
   `/administration`.
3. Navigate to http://localhost:3000/#/administration to solve the
   challenge.

![Administration page route in juice-shop.min.js](img/minified_js-admin.png)

### Give a devastating zero-star feedback to the store

1. Visit the _Contact Us_ form and put in a _Comment_ text.
2. The _Submit_ button is **disabled** because you did not select a
   _Rating_.
3. Select any of the stars to set a _Rating_.
4. The _Submit_ button is now **enabled**.
5. Select the same star again to unset the _Rating_.
6. Click the (still **enabled**) _Submit_ button to solve the challenge.
7. You can verify the feedback was saved by checking the _Customer
   Feedback_ widget on the _About Us_ page.

![Zero star feedback entry](img/zero_star_feedback-form.png)

![Zero star feedback entry](img/zero_star_feedback-carousel.png)

### Log in with the administrator's user account

* Log in with _Email_ `' or 1=1--` and any _Password_ which will
  authenticate the first entry in the `Users` table which happens to be
  the administrator
* or log in with _Email_ `admin@juice-sh.op'--` and any _Password_ if
  you have already harvested the email address of the admin from a
  previous attack.

### Log in with the administrator's user credentials without previously changing them or applying SQL Injection

1. Log in with _Email_ `admin@juice-sh.op` and _Password_ `admin123`
   which is as easy to guess as it is to brute force.

### Access a salesman's forgotten backup file

1. Browse to <http://localhost:3000/ftp> (like in
   [Access a confidential document](#access-a-confidential-document).
2. Opening <http://localhost:3000/ftp/coupons_2013.md.bak> directly will
   fail complaining about an illegal file type.
3. Exploit a bug in the `md_debug` parameter that was obviously not
   supposed to go into production to bypass the filter and solve the
   challenge:
   <http://localhost:3000/ftp/coupons_2013.md.bak?md_debug=.md>

Alternatively this challenge can also be solved via _Poison Null Byte_
injection as in
[Access a developer's forgotten backup file](#access-a-developers-forgotten-backup-file).

### XSS Tier 2: Perform a persisted XSS attack bypassing a client-side security mechanism

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

### XSS Tier 3: Perform a persisted XSS attack without using the frontend application at all

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

### Access a developer's forgotten backup file

1. Browse to <http://localhost:3000/ftp> (like in
   [Access a confidential document](#access-a-confidential-document).
2. Opening <http://localhost:3000/ftp/package.json.bak> directly will
   fail complaining about an illegal file type.
3. Exploiting the `md_debug` parameter like in
   [Access a salesman's forgotten backup file](#access-a-salesmans-forgotten-backup-file)
   will not work here - probably because `package.json.bak` is not a
   Markdown file.
4. Using a _Poison Null Byte_ (`%00`) the filter can be tricked, but
   only with a twist:
    * Accessing <http://localhost:3000/ftp/package.json.bak%00.md> will
      suprisingly **not** succeed...
    * ...because the `%` character needs to be URL-encoded (into `%25`)
      as well in order to work its magic later during the file system
      access.
5. <http://localhost:3000/ftp/package.json.bak%2500.md> will ultimately
   solve the challenge.

> By embedding NULL Bytes/characters into applications that do not
> handle postfix NULL terminators properly, an attacker can exploit a
> system using techniques such as Local File Inclusion. The Poison Null
> Byte exploit takes advantage strings with a known length that can
> contain null bytes, and whether or not the API being attacked uses
> null terminated strings. By placing a NULL byte in the string at a
> certain byte, the string will terminate at that point, nulling the
> rest of the string, such as a file extension.[^1]

### Find the hidden easter egg

> An Easter egg is an intentional inside joke, hidden message, or
> feature in an interactive work such as a computer program, video game
> or DVD menu screen. The name is used to evoke the idea of a
> traditional Easter egg hunt.[^2]

1. Use the _Poison Null Byte_ attack described in
   [Access a developer's forgotten backup file](#access-a-developers-forgotten-backup-file)...
2. ...to download <http://localhost:3000/ftp/eastere.gg%2500.md>

### XSS Tier 4: Perform a persisted XSS attack bypassing a server-side security mechanism

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

----

[^1]: http://hakipedia.com/index.php/Poison_Null_Byte
[^2]: https://en.wikipedia.org/wiki/Easter_egg_(media)