# Broken Access Control

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

| Name               | Challenge                                                                                                                      | Difficulty                           |
|:-------------------|:-------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------|
| Admin Section      | Access the administration section of the store.                                                                                | :star::star:                         |
| Easter Egg         | Find the hidden easter egg.                                                                                                    | :star::star::star::star:             |
| Five-Star Feedback | Get rid of all 5-star customer feedback.                                                                                       | :star::star:                         |
| Forged Feedback    | Post some feedback in another users name.                                                                                      | :star::star::star:                   |
| Forged Review      | Post a product review as another user or edit any user's existing review.                                                      | :star::star::star:                   |
| Manipulate Basket  | Put an additional product into another user's shopping basket.                                                                 | :star::star::star:                   |
| Product Tampering  | Change the href of the link within the OWASP SSL Advanced Forensic Tool (O-Saft) product description into http://kimminich.de. | :star::star::star:                   |
| SSRF               | Request a hidden resource on server through server.                                                                            | :star::star::star::star::star::star: |
| View Basket        | View another user's shopping basket.                                                                                           | :star::star:                         |

### Access the administration section of the store

Just like the score board, the admin section was not part of your "happy
path" tour because there seems to be no link to that section either. In
case you were already
[logged in with the administrator account](injection.md#log-in-with-the-administrators-user-account)
you might have noticed that not even for him there is a corresponding
option available in the main menu.

* Knowing it exists, you can simply _guess_ what URL the admin section
  might have.
* Alternatively, you can try to find a reference or clue within the
  parts of the application that are _not usually visible_ in the browser
* It is probably just slightly harder to find and gain access to than
  the score board link
* There is some access control in place, but there are at least three
  ways to bypass it.

### Find the hidden easter egg

> An Easter egg is an intentional inside joke, hidden message, or
> feature in an interactive work such as a computer program, video game
> or DVD menu screen. The name is used to evoke the idea of a
> traditional Easter egg hunt.[^2]

* If you solved one of the other four file access challenges, you
  already know where the easter egg is located
* Simply reuse the trick that already worked for the files above

_When you open the easter egg file, you might be a little disappointed,
as the developers taunt you about not having found **the real** easter
egg! Of course finding **that** is
[a follow-up challenge](cryptographic-issues.md#apply-some-advanced-cryptanalysis-to-find-the-real-easter-egg)
to this one._

### Get rid of all 5-star customer feedback

If you successfully solved above
[admin section challenge](#access-the-administration-section-of-the-store)
deleting the 5-star feedback is very easy.

* Nothing happens when you try to delete feedback entries? Check the
  JavaScript console for errors!

### Post some feedback in another users name

The Juice Shop allows users to provide general feedback including a star
rating and some free text comment. When logged in, the feedback will be
associated with the current user. When not logged in, the feedback will
be posted anonymously. This challenge is about vilifying another user by
posting a (most likely negative) feedback in his or her name!

* This challenge can be solved via the user interface or by intercepting
  the communication with the RESTful backend.
* To find the client-side leverage point, closely analyze the HTML form
  used for feedback submission.
* The backend-side leverage point is similar to some of the
  [XSS challenges](xss.md) found in OWASP Juice Shop.

### Post a product review as another user or edit any user's existing review

:wrench: **TODO**

### Put an additional product into another user's shopping basket

[View another user's shopping basket](#view-another-users-shopping-basket)
was only about spying out other customers. For this challenge you need
to get your hands dirty by putting a product into someone else's basket
that cannot be already in there!

* Check the HTTP traffic while placing products into your own shopping
  basket to find a leverage point.
* Adding more instances of the same product to someone else's basket
  does not qualify as a solution. The same goes for stealing from
  someone else's basket.
* This challenge requires a bit more sophisticated tampering than others
  of the same ilk.

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

* _Theoretically_ there are three possible ways to beat this challenge:
  * Finding an administrative functionality in the web application that
    lets you change product data
  * Looking for possible holes in the RESTful API that would allow you
    to update a product
  * Attempting an SQL Injection attack that sneaks in an `UPDATE`
    statement on product data
* _In practice_ two of these three ways should turn out to be dead ends

### Request a hidden resource on server through server

:wrench: **TODO**

### View another user's shopping basket

This horizontal privilege escalation challenge demands you to access the
shopping basket of another user. Being able to do so would give an
attacker the opportunity to spy on the victims shopping behaviour. He
could also play a prank on the victim by manipulating the items or their
quantity, hoping this will go unnoticed during checkout. This could lead
to some arguments between the victim and the vendor.

* Try out all existing functionality involving the shopping basket while
  having an eye on the HTTP traffic.
* There might be a client-side association of user to basket that you
  can try to manipulate.
* In case you manage to update the database via SQL Injection so that a
  user is linked to another shopping basket, the application will _not_
  notice this challenge as solved.

[^1]: https://en.wikipedia.org/wiki/Privilege_escalation
[^2]: https://en.wikipedia.org/wiki/Easter_egg_(media)
