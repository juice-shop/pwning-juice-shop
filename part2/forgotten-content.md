# Forgotten content

The challenges in this chapter are all about files or features that were
simply forgotten and are completely unprotected against access.

## Challenges covered in this chapter

| Challenge                                                                          | Difficulty                     |
|:-----------------------------------------------------------------------------------|:-------------------------------|
| Let us redirect you to a donation site that went out of business.                  | :star:                         |
| Use a deprecated B2B interface that was not properly shut down.                    | :star::star:                   |
| Retrieve the language file that never made it into production.                     | :star::star::star::star::star: |
| Deprive the shop of earnings by downloading the blueprint for one of its products. | :star::star::star::star::star: |

### Let us redirect you to a donation site that went out of business

One of the sites that the Juice Shop accepted donations from went out of
business end of 2017.

#### Hints

* When removing references to the site from the code the developers have
  been a bit sloppy.
* More particular, they have been sloppy in a way that even the Angular
  Compiler was not able to clean up after them automatically.
* It is of course not sufficient to just visit the donation site
  _directly_ to solve the challenge.

### Use a deprecated B2B interface that was not properly shut down

The Juice Shop represents a classic Business-to-Consumer (B2C)
application, but it also has some enterprise customers for which it
would be inconvenient to order large quantities of juice through the
webshop UI. For those customers there is a dedicated B2B interface.

#### Hints

* The old B2B interface was replaced with a more modern version
  recently.
* When deprecating the old interface, not all of its parts were cleanly
  removed from the code base.
* Simply using the deprecated interface suffices to solve this
  challenge. No attack or exploit is necessary.

### Retrieve the language file that never made it into production

> A project is internationalized when all of the project’s materials and
> deliverables are consumable by an international audience. This can
> involve translation of materials into different languages, and the
> distribution of project deliverables into different countries.[^1]

Following this requirement OWASP sets for all its projects, the Juice
Shop's user interface is available in different languages. One extra
language is actually available that you will not find in the selection
menu.

![Language selection dropdown](/part3/img/languages.png)

#### Hints

* First you should find out how the languages are technically changed in
  the user interface.
* Guessing will most definitely not work in this challenge.
* You should rather choose between the following two ways to beat this
  challenge:
  * _Apply brute force_ (and don't give up to quickly) to find it.
  * _Investigate online_ what languages are actually available.

### Deprive the shop of earnings by downloading the blueprint for one of its products

Why waste money for a product when you can just as well get your hands
on its blueprint in order to make it yourself?

#### Hints

* The product you might want to give a closer look is the _OWASP Juice
  Shop Logo (3D-printed)_
* For your inconvenience the blueprint was _not_ misplaced into the same
  place like so many others forgotten files covered in this chapter

:information_source: _If you are running the Juice Shop with a custom
theme and product inventory, the product to inspect will be a different
one. The tooltip on the Score Board will tell you which one to look into._

[^1]: https://www.owasp.org/index.php/OWASP_2014_Project_Handbook#tab=Project_Requirements

