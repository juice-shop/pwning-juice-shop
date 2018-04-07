# Customization

One of the core usage scenarios for OWASP Juice Shop is in employee
trainings in order to facilitating security awareness. With its not
entirely serious user roster and product inventory the application might
not be suited for all audiences alike.

In some particularly traditional domains or conservative enterprises it
would be beneficial to have the demo application look and behave more
like an internal application.

OWASP Juice Shop can be customized in its product inventory and look &
feel to accommodate this requirement. It also allows to add an arbitrary
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
Juice Shop look & feel and inventory. Please note that it is not
necessary to run `npm install` after switching customization
configurations.

### Overriding `default.yml` in Docker container

In order to override the default configuration inside your Docker
container with one of the provided configs, you can pass in the
`NODE_ENV` environment variable with the `-e` parameter:

```bash
docker run -d -e "NODE_ENV=bodgeit" -p 3000:3000
```

In order to inject your own configuration, you can use `-v` to mount the
`default.yml` path inside the container to any config file on your
outside file system:

```bash
docker run -d -e "NODE_ENV=myConfig" -v /tmp/myConfig.yml:/juice-shop/config/myConfig.yml -p 3000:3000 --name juice-shop bkimminich/juice-shop
```

## YAML configuration file

The YAML format for customizations is very straightforward. Below you
find its syntax along with an excerpt of the default settings.

* `server`
  * `port` to launch the server on. Defaults to `3000`
* `application`
  * `domain` used for all user email addresses. Defaults to
    `'juice-sh.op'`
  * `name` as shown in title and menu bar Defaults to `'OWASP Juice
    Shop'`
  * `logo` filename in `/app/public/images/` _or_ a URL of an image
    which will first be download to that folder and then used as a logo.
    Defaults to `JuiceShop_Logo.png`
  * `favicon` filename in `/app/public/` _or_ a URL of an image in
    `.ico` format which will first be download to that folder and then
    used as a favicon. Defaults to `favicon_v2.ico`
  * `numberOfRandomFakeUsers` represents the number of random user
    accounts to be created on top of the pre-defined ones (which are
    required for several challenges). Defaults to `0`, meaning no
    additional users are created.
  * `showChallengeSolvedNotifications` shows or hides all instant
    _"challenge solved"_-notifications. Recommended to set to `false`
    for awareness demos. Defaults to `true`.
  * `showCtfFlagsInNotifications` shows or hides the CTF flag codes in
    the _"challenge solved"_-notifications. Is ignored when
    `showChallengeSolvedNotifications` is set to `false`. Defaults to
    `false`.
  * `showChallengeHints` shows or hides hints for each challenge on
    hovering over/clicking its _"unsolved"_ badge on the score board.
    Defaults to `true`.
  * `showVersionNumber` shows or hides the software version from the
    title. Defaults to `true`.
  * `theme` the name of the [Bootswatch](https://bootswatch.com) theme
    used to render the UI. Options are `cerulean`, `cosmo`, `cyborg`,
    `darkly`, `flatly`, `lumen`, `paper`, `readable`, `sandstone`,
    `simplex`, `slate`, `spacelab`, `superhero`, `united` and `yeti`.
    Defaults to `slate`
  * `gitHubRibbon` color of the _"Fork me on GitHub"_ ribbon in the
    top-right corner. Options are `darkblue`, `gray`, `green`, `orange`,
    `red`, `white` and - to hide the ribbon entirely - also `none` .
    Defaults to `orange`.
  * `twitterUrl` used as the Twitter link promising coupon codes on the
    _Your Basket_ screen. Defaults to
    `'https://twitter.com/owasp_juiceshop'`
  * `facebookUrl` used as the Facebook link promising coupon codes on
    the _Your Basket_ screen. Defaults to
    `'https://www.facebook.com/owasp.juiceshop'`
  * `planetOverlayMap` filename in `/app/private` _or_ URL of an image
    to download to that folder and then use as an overlay texture for
    the 3D planet "easter egg". Defaults to `orangemap2k.jpg`
  * `planetName` of the 3D planet "easter egg" as shown in the page
    title. Defaults to `Orangeuze`
  * `recyclePage` custom elements on the _Request Recycling Box_ page
    * `topProductImage` filename in `/app/public/images/products` to use
      as the image on the top of the info column on the page. Defaults
      to `fruit_press.jpg`
    * `bottomProductImage` filename in `/app/public/images/products` to
      use as the image on the bottom of the info column on the page.
      Defaults to `apple_pressings.jpg`
  * `cookieConsent` defines the cookie consent dialog shown in the
    bottom right corner
    * `backgroundColor` of the cookie banner itself. Defaults to
      `'#eb6c44'` (red-orange)
    * `textColor` of the `message` shown in the cookie banner. Defaults
      to `'#ffffff'` (white)
    * `buttonColor` defines the color of the button to dismiss the
      banner. Defaults to `'#f5d948'` (gold)
    * `buttonTextColor` of the `dismissText` on the button. Defaults to
      `'#000000'` (black)
    * `message` explains the cookie usage in the application. Defaults
      to `'This website uses fruit cookies to ensure you get the
      juiciest tracking experience.'`
    * `dismissText` the text shown on the button to dismiss the banner.
      Defaults to `'Me want it!'`
    * `linkText` is shown after the `message` to refer to further
      information. Defaults to `'But me wait!'`
    * `linkUrl` provides further information about cookie usage.
      Defaults to `'https://www.youtube.com/watch?v=9PnbKL3wuH4'`
  * `securityTxt` defines the attributes for the `security.txt` file
    based on the <https://securitytxt.org/> Internet draft
    * `contact` an email address, phone number or URL to report security
      vulnerabilities to. Can be fake obviously. Defaults to
      `mailto:donotreply@owasp-juice.shop`
    * `encryption` URL to a public encryption key for secure
      communication. Can be fake obviously. Defaults to
      `https://keybase.io/bkimminich/pgp_keys.asc?fingerprint=19c01cb7157e4645e9e2c863062a85a8cbfbdcda`
    * `acknowledgements` URL a "hall of fame" page. Can be fake
      obviously. Defaults to `/#/score-board`
* `products` list which, when specified, replaces **the entire list** of
  default products
  * `name` of the product (_mandatory_)
  * `description` of the product (_optional_). Defaults to a static
    placeholder text
  * `price` of the product (_optional_). Defaults to a random price
  * `image` (_optional_) filename in `/app/public/images/products` _or_
    URL of an image to download to that folder and then use as a product
    image. Defaults to `undefined.png`
  * `deletedDate` of the product in `YYYY-MM-DD` format (_optional_).
    Defaults to `null`.
  * `urlForProductTamperingChallenge` sets the original link of the
    product which is the target for
    [the "product tampering" challenge](../part2/broken-access-control.md#change-the-href-of-the-link-within-the-o-saft-product-description).
    Overrides `deletedDate` with `null` (_must be defined on exactly one
    product_)
  * `useForChristmasSpecialChallenge` marks a product as the target for
    [the "christmas special" challenge](../part2/injection.md#order-the-christmas-special-offer-of-2014).
    Overrides `deletedDate` with `2014-12-27` (_must be `true` on
    exactly one product_)
  * `fileForRetrieveBlueprintChallenge` (_must be `true` on exactly one
    product_) filename in `/app/public/images/products` _or_ URL of a
    file download to that folder and then use as the target for the
    [Retrieve Blueprint](../part2/forgotten-content.md#deprive-the-shop-of-earnings-by-downloading-the-blueprint-for-one-of-its-products)
    challenge. If a filename is specified but the file does not exist in
    `/app/public/images/products` the challenge is still solvable by
    just requesting it from the server. Defaults to :warning:
    `JuiceShop.stl`. _**Important note:** To make this challenge
    realistically solvable, include some kind of hint to the blueprint
    file's name/type in the product image (e.g. its `Exif` metadata) or
    in the product description_
  * `reviews` a sub-list which adds reviews to a product (_optional_)
    * `text` of the review (_mandatory_)
    * `author` of the review from the following list of pre-defined
      users in the database: `admin`, `jim`, `bender`, `ciso`,
      `support`, `morty` or `mc.safesearch` (_mandatory_)

### Configuration example

```yaml
server:
  port: 3000
application:
  domain: juice-sh.op
  name: 'OWASP Juice Shop'
  logo: JuiceShop_Logo.png
  favicon: favicon_v2.ico
  numberOfRandomFakeUsers: 0
  showChallengeSolvedNotifications: true
  showCtfFlagsInNotifications: false
  showChallengeHints: true
  showVersionNumber: true
  theme: slate
  gitHubRibbon: orange
  twitterUrl: 'https://twitter.com/owasp_juiceshop'
  facebookUrl: 'https://www.facebook.com/owasp.juiceshop'
  planetOverlayMap: orangemap2k.jpg
  planetName: Orangeuze
  recyclePage:
    topProductImage: fruit_press.jpg
    bottomProductImage: apple_pressings.jpg
  altcoinName: Juicycoin
  cookieConsent:
    backgroundColor: '#eb6c44'
    textColor: '#ffffff'
    buttonColor: '#f5d948'
    buttonTextColor: '#000000'
    message: 'This website uses fruit cookies to ensure you get the juiciest tracking experience.'
    dismissText: 'Me want it!'
    linkText: 'But me wait!'
    linkUrl: 'https://www.youtube.com/watch?v=9PnbKL3wuH4'
  securityTxt:
    contact: 'mailto:donotreply@owasp-juice.shop'
    encryption: 'https://pgp.mit.edu/pks/lookup?op=get&search=0x062A85A8CBFBDCDA'
    acknowledgements: '/#/score-board'
products:
  -
    name: 'Apple Juice (1000ml)'
    price: 1.99
    description: 'The all-time classic.'
    image: apple_juice.jpg
    reviews:
      - { text: 'One of my favorites!', author: admin }
# ~~~~~ ... ~~~~~~
  -
    name: 'OWASP SSL Advanced Forensic Tool (O-Saft)'
    description: 'O-Saft is an easy to use tool to show information about SSL certificate and tests the SSL connection according given list of ciphers and various SSL configurations.'
    price: 0.01
    image: orange_juice.jpg
    urlForProductTamperingChallenge: 'https://www.owasp.org/index.php/O-Saft'
  -
    name: 'Christmas Super-Surprise-Box (2014 Edition)'
    description: 'Contains a random selection of 10 bottles (each 500ml) of our tastiest juices and an extra fan shirt for an unbeatable price!'
    price: 29.99
    image: undefined.jpg
    useForChristmasSpecialChallenge: true
  -
    name: 'OWASP Juice Shop Sticker (2015/2016 design)'
    description: 'Die-cut sticker with the official 2015/2016 logo. By now this is a rare collectors item. <em>Out of stock!</em>'
    price: 999.99
    image: sticker.png
    deletedDate: '2017-04-28'
# ~~~~~ ... ~~~~~~
  -
    name: 'OWASP Juice Shop Logo (3D-printed)'
    description: 'This rare item was designed and handcrafted in Sweden. This is why it is so incredibly expensive despite its complete lack of purpose.'
    price: 99.99
    image: 3d_keychain.jpg
    fileForRetrieveBlueprintChallenge: JuiceShop.stl
# ~~~~~ ... ~~~~~~
```

### Overriding default settings

When creating your own YAML configuration file, you can rely on the
existing default values and only overwrite what you want to change. The
provided `config/ctf.yml` file for capture-the-flag events for example
is as short as this:

```yaml
application:
  logo: JuiceShopCTF_Logo.png
  favicon: favicon_ctf.ico
  showCtfFlagsInNotifications: true
  showChallengeHints: false
  showVersionNumber: false
  gitHubRibbon: none
```

### Testing customizations

To verify if your custom configuration will not break any of the
challenges, you should run the end-to-end tests via `npm run
protractor`. If they pass, all challenges will be working fine!

## Provided customizations

The following three customizations are provided out of the box by OWASP
Juice Shop:
* [7 Minute Security](https://github.com/bkimminich/juice-shop/blob/master/config/7ms.yml):
  Full conversion <https://7ms.us>-theme for the first podcast that
  picked up the Juice Shop way before it was famous! :sunglasses:
* [Mozilla-CTF](https://github.com/bkimminich/juice-shop/blob/master/config/mozilla.yml):
  Another full conversion theme harvested and refined from the
  [Mozilla Austin CTF-event](https://hacks.mozilla.org/2018/03/hands-on-web-security-capture-the-flag-with-owasp-juice-shop)!
  :earth_americas:
* [The BodgeIt Store](https://github.com/bkimminich/juice-shop/blob/master/config/bodgeit.yml):
  An homage to
  [our server-side rendered ancestor](https://github.com/psiinon/bodgeit).
  May it rest in JSPs! :skull:
* [Sick-Shop](https://github.com/bkimminich/juice-shop/blob/master/config/sickshop.yml):
  A store that offers a variety of illnesses and the original PoC theme
  for the customization feature. _Achoo!_ Bless you! :mask:
* [CTF-mode](https://github.com/bkimminich/juice-shop/blob/master/config/ctf.yml):
  Keeps the Juice Shop in its default layout but disabled hints while
  enabling CTF flag codes in the _"challenge solved"_-notifications.
  Refer to [Hosting a CTF event](ctf.md) to learn more about running a
  CTF-event with OWASP Juice Shop. :triangular_flag_on_post:
* [Quiet mode](https://github.com/bkimminich/juice-shop/blob/master/config/quiet.yml):
  Keeps the Juice Shop in its default layout but hides all _"challenge
  solved"_-notifications, GitHub ribbon and challenge hints. :mute:
* [OWASP Juice Box](https://github.com/bkimminich/juice-shop/blob/master/config/juicebox.yml):
  If you find _jo͞osbäks_ much easier to pronounce than _jo͞osSHäp_,
  this customization is for you. :us:

![Mozilla-CTF theme](https://github.com/bkimminich/pwning-juice-shop/raw/master/part1/img/theme_mozilla.png)

![BodgeIt Store theme](https://github.com/bkimminich/pwning-juice-shop/raw/master/part1/img/theme_bodgeit.png)
