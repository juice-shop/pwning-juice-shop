# Cross Site Scripting (XSS)

> Cross-Site Scripting (XSS) attacks are a type of injection, in which
> malicious scripts are injected into otherwise benign and trusted web
> sites. XSS attacks occur when an attacker uses a web application to
> send malicious code, generally in the form of a browser side script,
> to a different end user. Flaws that allow these attacks to succeed are
> quite widespread and occur anywhere a web application uses input from
> a user within the output it generates without validating or encoding
> it.
>
> An attacker can use XSS to send a malicious script to an unsuspecting
> user. The end user’s browser has no way to know that the script should
> not be trusted, and will execute the script. Because it thinks the
> script came from a trusted source, the malicious script can access any
> cookies, session tokens, or other sensitive information retained by
> the browser and used with that site. These scripts can even rewrite
> the content of the HTML page.[^1]

## Challenges covered in this chapter

| Name                       | Description                                                                                                                                                                                                                                                                                                                                                       | Difficulty |
|:---------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------|
| API-only XSS               | Perform a _persisted_ XSS attack with ``<iframe src="javascript:alert(`xss`)">`` without using the frontend application at all.                                                                                                                                                                                                                                   | ⭐⭐⭐       |
| Bonus Payload              | Use the bonus payload `<iframe width="100%" height="166" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/771984076&color=%23ff5500&auto_play=true&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"></iframe>` in the _DOM XSS_ challenge. | ⭐          |
| Classic Stored XSS         | Perform an XSS attack with ``<script>alert(`xss`)</script>`` on a legacy page within the application.                                                                                                                                                                                                                                                             | ⭐⭐        |
| Client-side XSS Protection | Perform a _persisted_ XSS attack with ``<iframe src="javascript:alert(`xss`)">`` bypassing a client-side security mechanism.                                                                                                                                                                                                                                      | ⭐⭐⭐       |
| DOM XSS                    | Perform a _DOM_ XSS attack with ``<iframe src="javascript:alert(`xss`)">``.                                                                                                                                                                                                                                                                                       | ⭐          |
| HTTP-Header XSS            | Perform a _persisted_ XSS attack with ``<iframe src="javascript:alert(`xss`)">`` through an HTTP header.                                                                                                                                                                                                                                                          | ⭐⭐⭐⭐     |
| Reflected XSS              | Perform a _reflected_ XSS attack with ``<iframe src="javascript:alert(`xss`)">``.                                                                                                                                                                                                                                                                                 | ⭐⭐        |
| Server-side XSS Protection | Perform a _persisted_ XSS attack with ``<iframe src="javascript:alert(`xss`)">`` bypassing a server-side security mechanism.                                                                                                                                                                                                                                      | ⭐⭐⭐⭐     |
| Video XSS                  | Embed an XSS payload ``</script><script>alert(`xss`)</script>`` into our promo video.                                                                                                                                                                                                                                                                             | ⭐⭐⭐⭐⭐⭐  |

### Perform a persisted XSS attack without using the frontend application at all

As presented in the
[Architecture Overview](/introduction/architecture.md), the OWASP Juice
Shop uses a JavaScript client on top of a RESTful API on the server
side. Even without giving this fact away in the introduction chapter,
you would have quickly figured this out looking at their interaction
happening on the network. Most actions on the UI result in
`XMLHttpRequest` (`XHR`) objects being sent and responded to by the
server.

![XHR requests to the backend API](img/xhr-api_requests.png)

For the XSS Tier 3 challenge it is necessary to work with the
server-side API directly. You will need a command line tool like `curl`
or a
[tool for HTTP request tampering](/part1/rules.md#tools-for-http-request-tampering)
to master this challenge.

* A matrix of known data entities and their supported HTTP verbs through
  the API can help you here
* Careless developers might have exposed API methods that the client
  does not even need

### Use the bonus payload in the DOM XSS challenge

🛠️ **TODO**

### Perform an XSS attack on a legacy page within the application

In the [Architecture overview](../introduction/architecture.md) you were
told that the Juice Shop uses a modern _Single Page Application_
frontend. That was not entirely true.

* Find a screen in the application that looks subtly odd and dated
  compared with all other screens
* What is _even better_ than homegrown validation based on a RegEx?
  Homegrown sanitization based on a RegEx!

### Perform a persisted XSS attack bypassing a client-side security mechanism

This challenge is founded on a very common security flaw of web
applications, where the developers ignored the following golden rule of
input validation:

> Be aware that any JavaScript input validation performed on the client
> can be bypassed by an attacker that disables JavaScript or uses a Web
> Proxy. Ensure that any input validation performed on the client is
> also performed on the server.[^4]

* There are only some input fields in the Juice Shop forms that validate
  their input.
* Even less of these fields are persisted in a way where their content
  is shown on another screen.
* Bypassing client-side security can typically be done by
  * either disabling it on the client (i.e. in the browser by
    manipulating the DOM tree)
  * or by ignoring it completely and interacting with the backend
    instead.

### Perform a DOM XSS attack

> DOM-based Cross-Site Scripting is the de-facto name for XSS bugs which
> are the result of active browser-side content on a page, typically
> JavaScript, obtaining user input and then doing something unsafe with
> it which leads to execution of injected code.
>
> The DOM, or Document Object Model, is the structural format used to
> represent documents in a browser. The DOM enables dynamic scripts such
> as JavaScript to reference components of the document such as a form
> field or a session cookie. The DOM is also used by the browser for
> security - for example to limit scripts on different domains from
> obtaining session cookies for other domains. A DOM-based XSS
> vulnerability may occur when active content, such as a JavaScript
> function, is modified by a specially crafted request such that a DOM
> element that can be controlled by an attacker.[^3]

* This challenge is almost indistinguishable from
  [Perform a reflected XSS attack](#perform-a-reflected-xss-attack) if
  you do not look "under the hood" to find out what the application
  actually does with the user input

### Perform a persisted XSS attack through an HTTP header

This XSS challenge originates from an unsafely processed user input via
an HTTP header. The difficulty lies in finding the attack path whereas
the actual exploit is rather business as usual.

* Finding a piece of information displayed in the UI that could
  originate from an HTTP header
* You might have to look into less common or even proprietary HTTP
  headers to find the leverage point
* Adding insult to injury, the HTTP header you need will never be sent
  by the application on its own

### Perform a reflected XSS attack

> Reflected Cross-site Scripting (XSS) occur when an attacker injects
> browser executable code within a single HTTP response. The injected
> attack is not stored within the application itself; it is
> non-persistent and only impacts users who open a maliciously crafted
> link or third-party web page. The attack string is included as part of
> the crafted URI or HTTP parameters, improperly processed by the
> application, and returned to the victim.[^2]

* Look for a URL parameter where its value appears on the page it is
  leading to
* Try probing for XSS vulnerabilities by submitting text wrapped in an
  HTML tag which is easy to spot on screen, e.g. `<h1>` or `<strike>`.

### Perform a persisted XSS attack bypassing a server-side security mechanism

This is one of the hardest XSS challenges, as it cannot be solved by
just fiddling with the client-side JavaScript or bypassing the client
entirely. Whenever there is a server-side validation or input processing
involved, you should investigate how it works. Finding out
implementation details e.g. used libraries, modules or algorithms -
should be your priority. If the application does not leak this kind of
details, you can still go for a _blind approach_ by testing lots and
lots of different attack payloads and check the reaction of the
application.

_When you actually understand a security mechanism you have a lot higher
chance to beat or trick it somehow, than by using a trial and error
approach._

* The _Comment_ field in the _Contact Us_ screen is where you want to
  put your focus on
* The attack payload ``<iframe src="javascript:alert(`xss`)">`` will
  _not be rejected_ by any validator but _stripped from the comment_
  before persisting it
* Look for possible dependencies related to input processing in the
  `package.json.bak` you harvested earlier
* If an `xss` alert shows up but the challenge does not appear as solved
  on the _Score Board_, you might not have managed to put the _exact_
  attack string ``<iframe src="javascript:alert(`xss`)">`` into the
  database?

### Embed an XSS payload into our promo video

As with the previous one, the difficulty of this challenge is based on
how hard it is to successfully place the XSS payload in the application.

* Without utilizing the vulnerability behind another ⭐⭐⭐⭐⭐⭐ challenge
  it is not possible to plant the XSS payload for this challenge
* The mentioned "marketing collateral" might have been publicly
  advertised by the Juice Shop but is not necessarily part of its
  sitemap yet
* This challenge will always partially keep you blindfolded, no matter
  how hard you do research and analysis.

[^1]: https://owasp.org/www-community/attacks/xss/
[^2]: https://wiki.owasp.org/index.php/Testing_for_Reflected_Cross_site_scripting_(OWASP-DV-001)
[^3]: https://wiki.owasp.org/index.php/Testing_for_DOM-based_Cross_site_scripting_(OTG-CLIENT-001)
[^4]: https://owasp.org/www-project-cheat-sheets/cheatsheets/Input_Validation_Cheat_Sheet

