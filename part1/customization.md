# Customization

One of the core usage scenarios for OWASP Juice Shop is in employee
trainings in order to facilitating security awareness. With its not
entirely serious user roster and product inventory the application might
not be suited for all audiences alike.

In some particularly traditional domains or sonservative enterprises it
would be benefitial to have the demo application look and behave more
like an internal application.

OWASP Juice Shop can be customized in its product inventory and look &
feel to accomodate this requirement. It also allows to add an arbitrary
number of fake users to make demonstrations - particularly those of
`UNION-SQL` injection attacks - even more impressive. Furthermore the
Challenge solved!-notifications can be turned off in order to keep the
impression of a "real" application undisturbed.

## How to customize the application

The customization is powered by a YAML configuration file placed in
`/config`. To run a customized OWASP Juice Shop you need to:

1. Place your own `.yml` configuration file into `/config`
2. Set the environment variable `NODE_ENV` to the filename of your
   config without the `.yml` extension
   * On Windows: `set NODE_ENV=nameOfYourConfig`
   * On Linux: `export NODE_ENV=nameOfYourConfig`
3. Run `npm start`

You can also run a config directly in one command (on Linux) via
`NODE_ENV=nameOfYourConfig npm start`. By default the
`config/default.yml` config is used which generates the original OWASP
Juice Shop look & feel and inventory.Please note that it is not
necessary to run `npm install` after switching customization
configurations.

## YAML configuration file

The YAML format for customizations is very straightforward. Below you
find its syntax along with an excerpt of the default settings.

* `server`
  * `port` to launch the server on. Defaults to `3000`
* `application`
  * `domain` used for all user email addresses. Defaults to
    `"juice-sh.op"`
  * `name` as shown in title and menu bar Defaults to `"OWASP Juice
    Shop"`
  * `logo` filename in `/app/public/images/` _or_ a URL of an image
    which will first be download to that folder and then used as a logo.
    Defaults to `"JuiceShop_Logo.png"`
  * `favicon` filename in `/app/public/` _or_ a URL of an image in
    `.ico` format which will first be download to that folder and then
    used as a favicon. Defaults to `"favicon_v2.ico"`
  * `numberOfRandomFakeUsers` represents the number of random user
    accounts to be created on top of the pre-defined ones (which are
    required for serveral challenges). Defaults to `0`, meaning no
    additional users are created.
  * `showChallengeSolvedNotifications` shows or hides all instant
    _"challenge solved"_-notifications. Recommended to set to `false`
    for awareness demos. Defaults to `true`.
  * `showCtfFlagsInNotifications` shows or hides the CTF flag codes in
    the _"challenge solved"_-notifications. Is ignored when
    `showChallengeSolvedNotifications` is set to `false`. Defaults to
    `false`.
  * `showGitHubRibbon` shows or hides the _"Fork me on GitHub"_ ribbon
    in the top-right corner. Defaults to `true`.
  * `showChallengeHints` shows or hides hints for each challenge on
    hovering over/clicking its _"unsolved"_ badge on the score board.
    Defaults to `true`.
  * `theme` the name of the [Bootswatch](https://bootswatch.com) theme
    used to render the UI. Defaults to `"slate"`
  * `twitterUrl` used as the Twitter link promising coupon codes on the
    _Your Basket_ screen. Defaults to
    `"https://twitter.com/owasp_juiceshop"`
  * `facebookUrl` used as the Facebook link promising coupon codes on
    the _Your Basket_ screen. Defaults to
    `"https://www.facebook.com/owasp.juiceshop"`
* `products` list which, when specified, replaces **the entire list** of
  default products.
  * `name` of the product (_mandatory_)
  * `description` of the product (_optional)_. Defaults to a static
    placeholder text
  * `price` of the product (_optional)_. Defaults to a random price
  * `image` (_optional_) filename in `/app/public/images/products` _or_
    URL of an image to download to that folder and then use as a product
    image. Defaults to `undefined.png`
  * `useForProductTamperingChallenge` marks a product as the target for
    [the "product tampering" challenge](../part2/privilege-escalation.md#change-the-href-of-the-link-within-the-o-saft-product-description)
    (_must be `true` on exactly one product_)
  * `useForChristmasSpecialChallenge` marks a product as the target for
    [the "christmas special" challenge](../part2/sqli.md#order-the-christmas-special-offer-of-2014)
    (_must be `true` on exactly one product_)

### Configuration example

```yaml
server:
  port: 3000
application:
  domain: "juice-sh.op"
  name: "OWASP Juice Shop"
  logo: "JuiceShop_Logo.png"
  favicon: "favicon_v2.ico"
  numberOfRandomFakeUsers: 0
  showChallengeSolvedNotifications: true
  showCtfFlagsInNotifications: false
  showGitHubRibbon: true
  showChallengeHints: true
  theme: "slate"
  twitterUrl: "https://twitter.com/owasp_juiceshop"
  facebookUrl: "https://www.facebook.com/owasp.juiceshop"
products:
  - name: "Apple Juice (1000ml)"
    price: 1.99
    description: "The all-time classic."
    image: "apple_juice.jpg"
# ~~~~~ ... ~~~~~~
  - name: 'OWASP SSL Advanced Forensic Tool (O-Saft)'
    description: 'O-Saft is an easy to use tool to show information...'
    price: 0.01
    image: 'owasp_osaft.jpg'
    useForProductTamperingChallenge: true
  - name: 'Christmas Super-Surprise-Box (2014 Edition)'
    description: 'Contains a random selection of 10 bottles...'
    price: 29.99
    image: 'undefined.jpg'
    useForChristmasSpecialChallenge: true
# ~~~~~ ... ~~~~~~
```

### Overriding default settings

When creating your own YAML configuration file, you can rely on the
existing default values and only overwrite what you want to change. The
provided `config/ctf.yml` file for capture-the-flag events for example
is as short as this:

```yaml
application:
  logo: "JuiceShopCTF_Logo.png"
  favicon: "favicon_ctf.ico"
  showCtfFlagsInNotifications: true
  showGitHubRibbon: false
```

### Testing customizations

To verify if your custom configuration will not break any of the
challenges, you should run the end-to-end tests via `npm run
protractor`. If they pass, all challenges will be working fine!

## Provided customizations

The following three customizations are provided out of the box by OWASP
Juice Shop:
* [The BodgeIt Store](https://github.com/bkimminich/juice-shop/blob/master/config/bodgeit.yml):
  An homage to
  [our server-side rendered ancestor](https://github.com/psiinon/bodgeit)
* [Sick-Shop](https://github.com/bkimminich/juice-shop/blob/master/config/sickshop.yml):
  A store that offers a variety of illnesses. _Achoo!_ Bless you!
* [CTF-mode](https://github.com/bkimminich/juice-shop/blob/master/config/ctf.yml):
  Keeps the Juice Shop in its default layout but enables CTF flag codes
  in the _"challenge solved"_-notifications. Refer to
  [Appendix B: Hosting a CTF event](../appendix/ctf.md) to learn more
  about running a CTF-event with OWASP Juice Shop.
