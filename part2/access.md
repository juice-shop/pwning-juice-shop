# Broken access restrictions

## Challenges covered in this chapter

| Challenge | Difficulty |
| --------- | ---------- |
| Access the administration section of the store. | 1 of 5 |
| Get rid of all 5-star customer feedback. | 1 of 5 |
| Change the href of the link within the O-Saft product description into http://kimminich.de. | 3 of 5 |

### Access the administration section of the store {#adminSectionChallenge}

Just like the score board, the admin section was not part of your "happy path" tour because there seems to be no link to that section either.

#### Hints

* Knowing it exists, you can simply _guess_ what URL the admin section might have.
* Alternatively, you can try to find a reference or clue within the parts of the application that are _not usually visible_ in the browser
* It is just slightly harder to find than the score board link

### Get rid of all 5-star customer feedback {#fiveStarFeedbackChallenge}

If you successfully solved above [admin section challenge](#adminSectionChallenge) deleting the 5-star feedback is very easy.

#### Hints

* Nothing happens when you try to delete feedback entries? Check the Javascript console for errors!

### Change the href of the link within the O-Saft product description {#changeProductChallenge}

The _OWASP SSL Advanced Forensic Tool (O-Saft)_ product has a link in its description that leads to that projects wiki page. In this challenge you are supposed to change that link so that it will send you to http://kimminich.de instead. It is important to exactly follow the challenge instruction to make it light up green on the score board:

* Original link tag in the description: `<a href="https://www.owasp.org/index.php/O-Saft" target="_blank">More...</a>`
* Expected link tag in the description: `<a href="http://kimminich.de" target="_blank">More...</a>`

#### Hints

* _Theoretically_ there are three possible ways to beat this challenge:
  * Finding an administrative functionality in the web application that lets you change product data
  * Looking for possible holes in the RESTful API that would allow you to update a product
  * Attempting an SQL Injection attack that sneaks in an `UPDATE` statement on product data
* _In practice_ two of these three ways should turn out to be dead ends
