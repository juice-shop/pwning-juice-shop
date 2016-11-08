# Information Leakage

> Applications can unintentionally leak information about their configuration, internal workings, or violate privacy through a variety of application problems. Applications can also leak internal state via how long they take to process certain operations or via different responses to differing inputs, such as displaying the same error text with different error numbers. Web applications will often leak information about their internal state through detailed or debug error messages. Often, this information can be leveraged to launch or even automate more powerful attacks.[^1]

## Challenges covered in this chapter

| Challenge | Difficulty |
| --------- | ---------- |
| Provoke an error that is not very gracefully handled. | 1 of 5 |

### Provoke an error that is not very gracefully handled

#### Hints

----

[^1]: https://www.owasp.org/index.php/Top_10_2007-Information_Leakage
