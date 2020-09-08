# Improper Input Validation

> When software does not validate input properly, an attacker is able to
> craft the input in a form that is not expected by the rest of the
> application. This will lead to parts of the system receiving
> unintended input, which may result in altered control flow, arbitrary
> control of a resource, or arbitrary code execution.[^1]

## Challenges covered in this chapter

| Name                    | Description                                                                                 | Difficulty |
|:------------------------|:--------------------------------------------------------------------------------------------|:-----------|
| Admin Registration      | Register as a user with administrator privileges.                                           | ⭐⭐⭐       |
| Deluxe Fraud            | Obtain a Deluxe Membership without paying for it.                                           | ⭐⭐⭐       |
| Expired Coupon          | Successfully redeem an expired campaign coupon code.                                        | ⭐⭐⭐⭐     |
| Missing Encoding        | Retrieve the photo of Bjoern's cat in "melee combat-mode".                                  | ⭐          |
| Payback Time            | Place an order that makes you rich.                                                         | ⭐⭐⭐       |
| Poison Null Byte        | Bypass a security control with a Poison Null Byte to access a file not meant for your eyes. | ⭐⭐⭐⭐     |
| Repetitive Registration | Follow the DRY principle while registering a user.                                          | ⭐          |
| Upload Size             | Upload a file larger than 100 kB.                                                           | ⭐⭐⭐       |
| Upload Type             | Upload a file that has no .pdf or .zip extension.                                           | ⭐⭐⭐       |
| Zero Stars              | Give a devastating zero-star feedback to the store.                                         | ⭐          |

### Register as a user with administrator privileges

The Juice Shop does not bother to separate administrative functionality
into a deployment unit of its own. Instead, the cheapest solution was
chosen by simply leaving then admin features in the web shop itself and
(allegedly) demanding a higher level of access to use them.

* Register as an ordinary user to learn what API endpoints are involved
  in this use case
* Think of the simplest possible implementations of a distinction
  between regular users and administrators

### Obtain a Deluxe Membership without paying for it

The perks that come with a deluxe membership are reserved for paying
customers only. There sure seem to be a lot of ways for a potential
power user to give their money to juice shop. Perhaps, one of these
payment methods could have some unforseen loopholes

* Go to the payment page for a deluxe membership and try paying through
  different methods
* Try inspecting the requests that go out for each of these methods,
  using the browser's developer tools
* Maybe playing around with the parameters in these requests could
  reveal something interesting

### Successfully redeem an expired campaign coupon code

Apart from the monthly coupon codes found on Twitter the Juice Shop also
offered some seasonal special campaign at least once.

* Look for clues about the past campaign or holiday event somewhere in
  the application
* Solving this challenge does not require actual time traveling

### Retrieve the photo of Bjoern's cat in "melee combat-mode"

Who wouldn't want to see Bjoern's cat fighting fiercely with a furry
green plush toy?

* When you visit the _Photo Wall_ you will notice a broken image on one
  of the entries
* You just have to (literally) inspect the problem to understand the
  basic issue
* It can also help to try out the _Tweet_-button of the entry and
  observe what happens

![Broken image on photo wall](img/broken_image-photo_wall.png)

### Place an order that makes you rich

It is probably every web shop's nightmare that customers might figure
out away to _receive_ money instead of _paying_ for their purchase.

* You literally need to make the shop owe you any amount of money
* Investigate the shopping basket closely to understand how it prevents
  you from creating orders that would fulfil the challenge

### Bypass a security control with a Poison Null Byte

> By embedding NULL Bytes/characters into applications that do not
> handle postfix NULL terminators properly, an attacker can exploit a
> system using techniques such as Local File Inclusion. The Poison Null
> Byte exploit takes advantage strings with a known length that can
> contain null bytes, and whether or not the API being attacked uses
> null terminated strings. By placing a NULL byte in the string at a
> certain byte, the string will terminate at that point, nulling the
> rest of the string, such as a file extension.[^2]

🛠️ **TODO**

### Follow the DRY principle while registering a user

> The DRY (Don't Repeat Yourself) Principle states:
>
> > Every piece of knowledge must have a single, unambiguous,
> > authoritative representation within a system.

* The obvious repetition in the _User Registration_ form is the _Repeat
  Password_ field
* Try to register with either an empty or different value in _Repeat
  Password_
* You can solve this challenge by cleverly interacting with the UI or
  bypassing it altogether

### Upload a file larger than 100 kB

The Juice Shop offers its customers the chance to complain about an
order that left them unsatisfied. One of the juice bottles might have
leaked during transport or maybe the shipment was just two weeks late.
To prove their claim, customers are supposed to attach their order
confirmation document to the online complaint. To prevent abuse of this
functionality, the application only allows file uploads of 100 kB or
less.

* First you should try to understand how the file upload is actually
  handled on the client and server side
* With this understanding you need to find a "weak spot" in the right
  place and have to craft an exploit for it

### Upload a file that has no .pdf or .zip extension

In addition to the maximum file size, the Juice Shop also verifies that
the uploaded file is actually a PDF. All other file types are rejected.

* If you solved the
  [Upload a file larger than 100 kB](#upload-a-file-larger-than-100-kb)
  challenge, you should try to apply the same solution here

### Give a devastating zero-star feedback to the store

You might have realized that it is not possible to submit customer
feedback on the _Contact Us_ screen until you entered a comment and
selected a star rating from 1 to 5. This challenge is about tricking the
application into accepting a feedback with 0 stars.

* Before you invest time bypassing the API, you might want to play
  around with the UI a bit

[^1]: https://cwe.mitre.org/data/definitions/20.html

[^2]: <http://hakipedia.com/index.php/Poison_Null_Byte>

