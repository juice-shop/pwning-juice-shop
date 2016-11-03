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

----

[^1]: https://www.owasp.org/index.php/Cross-site_Scripting_(XSS)

----
----

__If you see the text `<script>alert("XSS1")</script>` below in regular text style, everything is fine. If you don't and maybe even see a Javascript popup with 'XSS1' as text, you are in trouble!__
<script>alert("XSS1")</script>
__^^^^^^^^^^^^^^^^^^^^^^^^^^^^^__
