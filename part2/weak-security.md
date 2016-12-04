# Weak security mechanisms

## Challenges covered in this chapter

| Challenge                                                                                                                          | Difficulty |
|:-----------------------------------------------------------------------------------------------------------------------------------|:-----------|
| Log in with the administrator's user credentials without previously changing them or applying SQL Injection.                       | 2 of 5     |
| Log in with Bjoern's user account without previously changing his password, applying SQL Injection, or hacking his Google account. | 3 of 5     |
| Exploit OAuth 2.0 to log in with the Chief Information Security Officer's user account.                                            | 4 of 5     |
| Wherever you go, there you are.                                                                                                    | 4 of 5     |

### Log in with the administrator's user credentials without previously changing them or applying SQL Injection {#weakPasswordChallenge}

You might have already solved this challenge along with
[Log in with the administrator's user account](sqli.md#loginAdminChallenge)
if you chose not to use SQL Injection. This challenge can only be solved
if you use the original password of the administrator. If you
_accidentally_ changed the password, do not despair: The original
password will _always_ be accepted to make sure you can solve this
challenge.

#### Hints

* Guessing might work just fine.
* If you harvested the admin's password hash, you can try to attack
  that.
* In case you use some hacker tool, you can also go for a _brute force
  attack_ using a generic _password list_

### Log in with Bjoern's user account without previously changing his password, applying SQL Injection, or hacking his Google account

#### Hints

### Exploit OAuth 2.0 to log in with the Chief Information Security Officer's user account

#### Hints

### Wherever you go, there you are {#redirectChallenge}

This challenge is undoubtedtly the one with the most ominous
description. It is actually a quote from the computer game
[Diablo](http://us.blizzard.com/en-us/games/legacy/), which is shown on
screen when the player activates a
[Holy Shrine](http://diablo.gamepedia.com/Shrines_(Diablo_I)). The
shrine casts the spell
[Phasing](http://diablo.gamepedia.com/Phasing_(Diablo_I)) on the player,
which results in _teleportation_ to a random location.

By now you probably made the connection: This challenge is about
_redirecting_ to a different location.

#### Hints

* You can find several places where redirects happen in the OWASP Juice
  Shop
* The application will only allow you to redirect to _whitelisted_ URLs
* Tampering with the redirect mechanism might give you some valuable
  information about how it works under to hood

> White list validation involves defining exactly what _is_ authorized,
> and by definition, everything else is not authorized.[^1]

----

[^1]: https://www.owasp.org/index.php/Input_Validation_Cheat_Sheet#White_List_Input_Validation
