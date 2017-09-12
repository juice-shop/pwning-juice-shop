# Privilege escalation

> Most computer systems are designed for use with multiple users.
> Privileges mean what a user is permitted to do. Common privileges
> include viewing and editing files, or modifying system files.
>
> Privilege escalation means a user receives privileges they are not
> entitled to. These privileges can be used to delete files, view
> private information, or install unwanted programs such as viruses. It
> usually occurs when a system has a bug that allows security to be
> bypassed or, alternatively, has flawed design assumptions about how it
> will be used. Privilege escalation occurs in two forms:
>
> * Vertical privilege escalation, also known as _privilege elevation_,
>   where a lower privilege user or application accesses functions or
>   content reserved for higher privilege users or applications (e.g.
>   Internet Banking users can access site administrative functions or
>   the password for a smartphone can be bypassed.)
> * Horizontal privilege escalation, where a normal user accesses
>   functions or content reserved for other normal users (e.g. Internet
>   Banking User A accesses the Internet bank account of User B)[^1]

## Challenges covered in this chapter

| Challenge                                                                                   | Difficulty |
|:--------------------------------------------------------------------------------------------|:-----------|
| Access the administration section of the store.                                             | 1 of 5     |
| Get rid of all 5-star customer feedback.                                                    | 1 of 5     |
| Change the href of the link within the O-Saft product description into http://kimminich.de. | 3 of 5     |
| Access someone else's basket.                                                               | 2 of 5     |
| Post some feedback in another users name.                                                   | 3 of 5     |

### Access the administration section of the store

Just like the score board, the admin section was not part of your "happy
path" tour because there seems to be no link to that section either. In
case you were already
[logged in with the administrator account](sqli.md#log-in-with-the-administrators-user-account)
you might have noticed that not even for him there is a corresponding
option available in the main menu.

#### Hints

* Knowing it exists, you can simply _guess_ what URL the admin section
  might have.
* Alternatively, you can try to find a reference or clue within the
  parts of the application that are _not usually visible_ in the browser
* It is just slightly harder to find than the score board link

### Get rid of all 5-star customer feedback

If you successfully solved above
[admin section challenge](#access-the-administration-section-of-the-store)
deleting the 5-star feedback is very easy.

#### Hints

* Nothing happens when you try to delete feedback entries? Check the
  JavaScript console for errors!

### Change the href of the link within the O-Saft product description

The _OWASP SSL Advanced Forensic Tool (O-Saft)_ product has a link in
its description that leads to that projects wiki page. In this challenge
you are supposed to change that link so that it will send you to
http://kimminich.de instead. It is important to exactly follow the
challenge instruction to make it light up green on the score board:

* Original link tag in the description: `<a
  href="https://www.owasp.org/index.php/O-Saft"
  target="_blank">More...</a>`
* Expected link tag in the description: `<a href="http://kimminich.de"
  target="_blank">More...</a>`

#### Hints

* _Theoretically_ there are three possible ways to beat this challenge:
  * Finding an administrative functionality in the web application that
    lets you change product data
  * Looking for possible holes in the RESTful API that would allow you
    to update a product
  * Attempting an SQL Injection attack that sneaks in an `UPDATE`
    statement on product data
* _In practice_ two of these three ways should turn out to be dead ends

### Access someone else's basket

This horizontal privilege escalation challenge demands you to access the
shopping basket of another user. Being able to do so would give an
attacker the opportunity to spy on the victims shopping behaviour. He
could also play a prank on the victim by manipulating the items or their
quantity, hoping this will go unnoticed during checkout. This could lead
to some arguments between the victim and the vendor.

#### Hints

* Try out all existing functionality involving the shopping basket while
  having an eye on the HTTP traffic.
* There might be a client-side association of user to basket that you
  can try to manipulate.
* In case you manage to update the database via SQL Injection so that a
  user is linked to another shopping basket, the application will _not_
  notice this challenge as solved.

### Post some feedback in another users name

The Juice Shop allows users to provide general feedback including a star
rating and some free text comment. When logged in, the feedback will be
associated with the current user. When not logged in, the feedback will
be posted anonymously. This challenge is about vilifying another user by
posting a (most likely negative) feedback in his or her name!

#### Hints

* This challenge can be solved via the user interface or by intercepting
  the communication with the RESTful backend.
* To find the client-side leverage point, closely analyze the HTML form
  used for feedback submission.
* The backend-side leverage point is similar to some of the
  [XSS challenges](xss.md) found in OWASP Juice Shop.

[^1]: https://en.wikipedia.org/wiki/Privilege_escalation
