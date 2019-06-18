# Security Misconfiguration

## Challenges covered in this chapter

| Challenge                                                                                                       | Difficulty                           |
|:----------------------------------------------------------------------------------------------------------------|:-------------------------------------|
| Provoke an error that is not very gracefully handled.                                                           | :star:                               |
| Access a salesman's forgotten backup file.                                                                      | :star::star::star::star:             |
| Log in with the support team's original user credentials without applying SQL Injection or any other bypass.    | :star::star::star::star::star::star: |

### Provoke an error that is not very gracefully handled

The OWASP Juice Shop is quite _forgiving_ when it comes to bad input,
broken requests or other failure situations. It is just not very
sophisticated at _handling_ errors properly. You can harvest a lot of
interesting information from error messages that contain too much
information. Sometimes you will even see error messages that should not
be visible at all.

> Applications can unintentionally leak information about their
> configuration, internal workings, or violate privacy through a variety
> of application problems. Applications can also leak internal state via
> how long they take to process certain operations or via different
> responses to differing inputs, such as displaying the same error text
> with different error numbers. Web applications will often leak
> information about their internal state through detailed or debug error
> messages. Often, this information can be leveraged to launch or even
> automate more powerful attacks.[^1]

#### Hints

* This challenge actually triggers from various possible error
  conditions.
* You can try to submit bad input to forms to provoke an improper error
  handling
* Tampering with URL paths or parameters might also trigger an
  unforeseen error

If you see the success notification for this challenge but no error
message on screen, the error was probably logged on the JavaScript
console of the browser. You were supposed to have it open all the time
anyway, remember?

### Access a salesman's forgotten backup file

A salesperson as accidentally uploaded a list of (by now outdated)
coupon codes to the application. Downloading this file will not only
solve the _Access a salesman's forgotten backup file_ challenge but
might also prove useful in another challenge later on.

#### Hints

* Analyze and tamper with links in the application that deliver a file
  directly.
* The file is not directly accessible because a security mechanism
  prevents access to it.
* You need to trick the security mechanism into thinking that the file
  has a valid file type.

### Log in with the support team's original user credentials

This is another _follow-the-breadcrumbs_ challenge of the tougher sort.
As a little background story, imagine that the OWASP Juice Shop was
developed in the _classic style_: The development team wrote the code
and then threw it over the fence to an operations and support team to
run and troubleshoot the application. Not the slightest sign of
[DevOps](https://en.wikipedia.org/wiki/DevOps) culture here.

#### Hints

* The support team is located in some low-cost country and the team
  structure fluctuates a lot due to people leaving for jobs with even
  just slightly better wages.
* To prevent abuse the password for the support team account is very
  strong.
* To allow easy access during an incident, the support team utilizes a
  3rd party tool which every support engineer can access to get the
  current account password from.
* While it is also possible to use SQL Injection to log in as the
  support team, this will not solve the challenge.

[^1]: https://www.owasp.org/index.php/Top_10_2007-Information_Leakage

[^2]: https://www.owasp.org/index.php/Brute_force_attack

