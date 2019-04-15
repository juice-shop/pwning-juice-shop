# Improper Input Validation

> When software does not validate input properly, an attacker is able to
> craft the input in a form that is not expected by the rest of the
> application. This will lead to parts of the system receiving
> unintended input, which may result in altered control flow, arbitrary
> control of a resource, or arbitrary code execution.[^1]

## Challenges covered in this chapter

| Challenge                                           | Difficulty         |
|:----------------------------------------------------|:-------------------|
| Follow the DRY principle while registering a user.  | :star:             |
| Give a devastating zero-star feedback to the store. | :star:             |
| Get registered as admin user.                       | :star::star::star: |
| Place an order that makes you rich.                 | :star::star::star: |
| Upload a file larger than 100 kB.                   | :star::star::star: |
| Upload a file that has no .pdf extension.           | :star::star::star: |

### Follow the DRY principle while registering a user

:wrench: **TODO**

#### Hints

:wrench: **TODO**

### Give a devastating zero-star feedback to the store

You might have realized that it is not possible to submit customer
feedback on the _Contact Us_ screen until you entered a comment and
selected a star rating from 1 to 5. This challenge is about tricking the
application into accepting a feedback with 0 stars.

#### Hints

* Before you invest time bypassing the API, you might want to play
  around with the UI a bit

### Get registered as admin user

The Juice Shop does not bother to separate administrative functionality
into a deployment unit of its own. Instead, the cheapest solution was
chosen by simply leaving then admin features in the web shop itself and
(allegedly) demanding a higher level of access to use them.

### Hints

* Register as an ordinary user to learn what API endpoints are involved
  in this use case
* Think of the simplest possible implementations of a distinction
  between regular users and administrators

### Place an order that makes you rich

It is probably every web shop's nightmare that customers might figure
out away to _receive_ money instead of _paying_ for their purchase.

#### Hints

* You literally need to make the shop owe you any amount of money
* Investigate the shopping basket closely to understand how it prevents
  you from creating orders that would fulfil the challenge

### Upload a file larger than 100 kB

The Juice Shop offers its customers the chance to complain about an
order that left them unsatisfied. One of the juice bottles might have
leaked during transport or maybe the shipment was just two weeks late.
To prove their claim, customers are supposed to attach their order
confirmation document to the online complaint. To prevent abuse of this
functionality, the application only allows file uploads of 100 kB or
less.

#### Hints

* First you should try to understand how the file upload is actually
  handled on the client and server side
* With this understanding you need to find a "weak spot" in the right
  place and have to craft an exploit for it

### Upload a file that has no .pdf extension

In addition to the maximum file size, the Juice Shop also verifies that
the uploaded file is actually a PDF. All other file types are rejected.

#### Hints

* If you solved the
  [Upload a file larger than 100 kB](#upload-a-file-larger-than-100-kb)
  challenge, you should try to apply the same solution here

[^1]: https://cwe.mitre.org/data/definitions/20.html