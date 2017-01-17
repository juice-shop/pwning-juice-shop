# Information Leakage

> Applications can unintentionally leak information about their
> configuration, internal workings, or violate privacy through a variety
> of application problems. Applications can also leak internal state via
> how long they take to process certain operations or via different
> responses to differing inputs, such as displaying the same error text
> with different error numbers. Web applications will often leak
> information about their internal state through detailed or debug error
> messages. Often, this information can be leveraged to launch or even
> automate more powerful attacks.[^1]

## Challenges covered in this chapter

| Challenge                                             | Difficulty |
|:------------------------------------------------------|:-----------|
| Provoke an error that is not very gracefully handled. | 1 of 5     |

### Provoke an error that is not very gracefully handled

The OWASP Juice Shop is quite _forgiving_ when it comes to bad input,
broken requests or other failure situations. It is just not very
sophisticated at _handling_ errors properly. You can harvest a lot of
interesting information from error messages that contain too much
information. Sometimes you will even see error messages that should not
be visible at all.

#### Hints

* This challenge actually triggers from various possible error
  conditions.
* You can try to submit bad input to forms to provoke an improper error
  handling
* Tampering with URL paths or parameters might also trigger an unforeseen
  error

If you see the success notification for this challenge but no error
message on screen, the error was probably logged on the Javascript
console of the browser. You were supposed to have it open all the time
anyway, remember?

[^1]: https://www.owasp.org/index.php/Top_10_2007-Information_Leakage
