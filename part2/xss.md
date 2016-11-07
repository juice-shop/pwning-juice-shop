# Cross Site Scripting (XSS)

> Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted web sites. XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user. Flaws that allow these attacks to succeed are quite widespread and occur anywhere a web application uses input from a user within the output it generates without validating or encoding it.
>
> An attacker can use XSS to send a malicious script to an unsuspecting user. The end user’s browser has no way to know that the script should not be trusted, and will execute the script. Because it thinks the script came from a trusted source, the malicious script can access any cookies, session tokens, or other sensitive information retained by the browser and used with that site. These scripts can even rewrite the content of the HTML page.[^1]

## Challenges covered in this chapter

| Challenge | Difficulty |
| --------- | ---------- |
| XSS Tier 1: Perform a reflected XSS attack with `<script>alert("XSS1")</script>`. | 1 of 5 |
| XSS Tier 2: Perform a persisted XSS attack with `<script>alert("XSS2")</script>` bypassing a client-side security mechanism. | 3 of 5 |
| XSS Tier 3: Perform a persisted XSS attack with `<script>alert("XSS3")</script>` without using the frontend application at all. | 3 of 5 |
| XSS Tier 4: Perform a persisted XSS attack with `<script>alert("XSS4")</script>` bypassing a server-side security mechanism. | 4 of 5 |

### XSS Tier 1: Perform a reflected XSS attack

> Reflected Cross-site Scripting (XSS) occur when an attacker injects browser executable code within a single HTTP response. The injected attack is not stored within the application itself; it is non-persistent and only impacts users who open a maliciously crafted link or third-party web page. The attack string is included as part of the crafted URI or HTTP parameters, improperly processed by the application, and returned to the victim.[^2]

#### Hints

* Look for an input field where its content appears in the response HTML when its form is submitted.
* Try probing for XSS vulberabilities by submitting text wrapped in an HTML tag which is easy to spot on screen, e.g. `<h1>` or `<strike>`.

### XSS Tier 2: Perform a persisted XSS attack bypassing a client-side security mechanism

#### Hints

* There are only some input fields in the Juice Shop forms that validate their input
* Even less of these fields are persisted in a way where their content is shown on another screen
* Bypassing client-side security can be done by
  * either disabling it on the client
  * or ignoring it completely by interacting with the backend instead

### XSS Tier 3: Perform a persisted XSS attack without using the frontend application at all

#### Hints

* You might want to create a matrix of known data entities and supported HTTP verbs through the API 
* Careless developers might have exposed API functionality that the client never actually uses

### XSS Tier 4: Perform a persisted XSS attack bypassing a server-side security mechanism

#### Hints

* The _Comment_ field if the _Contact Us_ is where you want to put your focus on
* Try injecting the required attack payload directly, and it will be eliminated on server side
* This challenge can be solved fastest with some research - start in the `package.json.bak` you harvested and look for possible validation-related dependencies

----

[^1]: https://www.owasp.org/index.php/Cross-site_Scripting_(XSS)
[^2]: https://www.owasp.org/index.php/Testing_for_Reflected_Cross_site_scripting_(OWASP-DV-001)

----

__If you see the text `<script>alert("XSS1")</script>` below in regular text style, everything is fine. If you don't and maybe even see a Javascript popup with 'XSS1' as text, you are in trouble!__
<script>alert("XSS1")</script>
__^^^^^^^^^^^^^^^^^^^^^^^^^^^^^__
