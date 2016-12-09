# Walking the "happy path"

When investigating an application for security vulnerabilities, you
should _never_ blindly start throwing attack payloads at it. Instead,
__make sure that you understand how it works__ before attempting any
exploits.

> Before commencing security testing, understanding the structure of the
> application is paramount. Without a thorough understanding of the
> layout of the application, it is unlkely that it will be tested
> thoroughly. Map the target application and understand the principal
> workflows.[^1]

A good way to gain an understanding for the application, is to _actually
use it_ in the way it was meant to be used by a normal user. In regular
software testing this is often called "happy path" testing.

> Also known as the "sunny day" scenario, the happy path is the "normal"
> path of execution through a use case or through the software that
> implements it. Nothing goes wrong, nothing out of the normal happens,
> and we swiftly and directly achieve the user's or caller's goal.[^2]

The OWASP Juice Shop is a rather simple ecommerce application that
covers the typical workflows of a web shop. The following sections
briefly walk you through these "happy path" use cases.

### Browse products

When visiting the OWASP Juice Shop you will be automatically forwarded
to the `#/search` page, which shows a table with all available products.
This is of course the "bread & butter" screen for any ecommerce site.
When you click on the small "eye"-button next to the price of a product,
an overlay screen will open showing you that product including an image
of it.

You can use the _Search..._ box in the navigation bar on the top of the
screen to filter the table for specific products by their name and
description.

### User login

You might notice that there seems to be no way to actually purchase any
of the products. This functionality exists, but is not available to
anonymous users. You first have to log in to the shop with your user
credentials on the `#/login` page. There you can either log in with your
existing credentials (if you are a returning customer) or with your
Google account.

### User registration

In case you are a new customer, you must first register by following the
corresponding link on the login screen to `#/register`. There you must
enter your email address and a password to create a new user account.
With these credentials you can then log in... and finally start
shopping!

### Choosing products to purchase

After logging in to the application you will notice a "shopping
cart"-icon in every row of the products table. Unsurprisingly this will
let you add one or more products into your shopping basket. The _Your
Basket_ button in the navigation bar will bring you to the `#/basket`
page, where you can do several things before actually confirming your
purchase:

* increase ("+") or decrease ("-") the quantity of individual products
  in the shopping basket
* remove products from the shopping basket with the "trashcan"-button

### Checkout

Still on the `#/basket` page you also find some purchase releated
buttons that are worth to be explored:

* unfold the _Coupon_ section with the "gift"-button where you can
  redeem a code for a discount
* unfold the _Payment_ section with the "credit card"-button where you
  find donation and merchandise links

Finally you can click the _Checkout_ button to issue an order. You will
be forwarded to a PDF with the confirmation of your order right away.

_You will not find any "real" payment or delivery address options
anywhere in the Juice Shop as it is not a "real" shop, after all._

----

There also also some secondary use cases that the OWASP Juice Shop
covers. While these are not critical for the shopping workflow itself,
they positively influence the overall customer experience.

### Get information about the shop

Like every proper enterprise, the OWASP Juice Shop has of course an
`#/about` page titled _About Us_. There you find a summary of the
interesting history of the shop along with a link to its official Terms
of Use document. Additionally the page displays a fancy illustrated
slideshow of customer feedback.

### Language selection

From a dropdown menu in the navigation bar you can select a multitude of
languages you want the user interface to be displayed in. On the top of
the list, you find languages with complete translations, the ones below
with a "flask"-icon next to them, offer only partial translation.

> If you want to know more about (or even help with) the localization of
> OWASP Juice Shop, please refer to the
> [Help with translation](/part3/translation.md) chapter in part III of
> this book.

### Provide feedback

Customers are invited to leave feedback about their shopping experience
with the Juice Shop. Simply visit the `#/contact` page by clicking the
_Contact Us_ button in the navigation bar. You might recognize that it
is also possible to leave feedback - when not logged in - as an
anonymous user. The contact form is very straightforward with a free
text _Comment_ field and a _Rating_ on a 1-5 stars scale.

### Complain about problems with an order

The _Complain?_ button is shown only to logged in users in the navbar.
It brings you to the `#/complain` page where you can leave a free text
_Message_ and also attach an _Invoice_ file. The file upload only allows
.PDF files and no files greater than 100 kB - which is totally
sufficient for the user case, if you remember that the order
confirmation shown after checkout was just a one-page PDF file with only
text in it.

### Change user password

If you are currently logged in you will find the obligatory _Change
Password_ button in the navigation bar. On the `#/change-password` page
you can then choose a new password. To prevent abuse you have of course
to supply your current password to legitimate this change.

----

[^1]: https://www.owasp.org/index.php/Map_execution_paths_through_application_(OTG-INFO-007)
[^2]: http://xunitpatterns.com/happy%20path.html
