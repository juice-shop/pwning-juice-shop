# Unvalidated Redirects

## Challenges covered in this chapter

| Name               | Description                                                                                    | Difficulty |
|:-------------------|:-----------------------------------------------------------------------------------------------|:-----------|
| Outdated Whitelist | Let us redirect you to one of our crypto currency addresses which are not promoted any longer. | ⭐         |
| Whitelist Bypass   | Enforce a redirect to a page you are not supposed to redirect to.                              | ⭐⭐⭐⭐     |

### Let us redirect you to one of our crypto currency addresses

Some time ago the Juice Shop project accepted donations via Bitcoin,
Dash and Ether. It never received any, so these were dropped at some
point.

* When removing references to those addresses from the code the
  developers have been a bit sloppy.
* More particular, they have been sloppy in a way that even the Angular
  Compiler was not able to clean up after them automatically.
* It is of course not sufficient to just visit any of the crypto
  currency links _directly_ to solve the challenge.

### Enforce a redirect to a page you are not supposed to redirect to

This challenge is about _redirecting_ to an entirely unallowed different
location.

* You can find several places where redirects happen in the OWASP Juice
  Shop
* The application will only allow you to redirect to _whitelisted_ URLs
* Tampering with the redirect mechanism might give you some valuable
  information about how it works under to hood

> White list validation involves defining exactly what _is_ authorized,
> and by definition, everything else is not authorized.[^1]

[^1]: https://wiki.owasp.org/index.php/Input_Validation_Cheat_Sheet#White_List_Input_Validation
