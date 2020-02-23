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
find its schema along with an excerpt of the default settings.

### `server` section

Offers technical configuration options for the web server hosting the
application.

| Property | Description                   | Default |
|:---------|:------------------------------|:--------|
| `port`   | Port to launch the server on. | `3000`  |

### `application` section

Defines customization options for texts, colors, images, URLs etc.
within the application.

| Property                                                    | Description                                                                                                                                                                                                      | Default                                      |
|:------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------|
| `domain`                                                    | Domain used for all user email addresses.                                                                                                                                                                        | `'juice-sh.op'`                              |
| `name`                                                      | Name as shown in title and menu bar.                                                                                                                                                                             | `'OWASP Juice Shop'`                         |
| `logo`                                                      | Filename in `frontend/dist/frontend/assets/public/images` _or_ a URL of an image which will first be download to that folder and then used as a logo.                                                            | `JuiceShop_Logo.png`                         |
| `favicon`                                                   | Filename in `frontend/dist/frontend/assets/public` _or_ a URL of an image in `.ico` format which will first be download to that folder and then used as a favicon.                                               | `favicon_v2.ico`                             |
| `theme`                                                     | Name of the color theme used to render the UI. Options are `bluegrey-lightgreen`, `blue-lightblue`, `deeppurple-amber`, `indigo-pink`, `pink-bluegrey`, `purple-green` and `deeporange-indigo`.                  | `bluegrey-lightgreen`                        |
| `showVersionNumber`                                         | Shows or hides the software version from the title.                                                                                                                                                              | `true`                                       |
| `showGitHubLinks`                                           | Shows or hides the _"GitHub"_ button in the navigation and side bar as well as the info box about contributing on the _Score Board_.                                                                             | `true`                                       |
| `numberOfRandomFakeUsers`                                   | Represents the number of random user accounts to be created on top of the pre-defined ones (which are required for several challenges).                                                                          | `0`, meaning no additional users are created |
| `altcoinName`                                               | Defines the name of the (fake) crypto currency that is offered on the _Token Sale_ screen.                                                                                                                       | `Juicycoin`                                  |
| `privacyContactEmail`                                       | The email address shown as contact in the _Privacy Policy_.                                                                                                                                                      | `donotreply@owasp-juice.shop`                |
| `customMetricsPrefix`                                       | Prefix for all custom Prometheus metrics. Must be a lowercase letter single world by Prometheus conventions.                                                                                                     | `donotreply@owasp-juice.shop`                |
| [`social` subsection](#social-subsection)                   | Specifies all social links embedded on various screens such as _About Us_ or the _Photo Wall_.                                                                                                                   | `juiceshop`                                  |
| [`recyclePage` subsection](#recyclepage-subsection)         | Defines custom elements on the _Request Recycling Box_ page.                                                                                                                                                     |                                              |
| [`welcomeBanner` subsection](#welcomebanner-subsection)     | Defines a dismissable welcome banner that can be shown when first visiting the application.                                                                                                                      |                                              |
| [`cookieConsent` subsection](#cookieconsent-subsection)     | Defines the cookie consent dialog shown in the bottom right corner.                                                                                                                                              |                                              |
| [`securityTxt` subsection](#securitytxt-subsection)         | Defines the attributes for the `security.txt` file based on thehttps://securitytxt.org/> Internet draft.                                                                                                         |                                              |
| [`promotion` subsection](#promotion-subsection)             | Defines the attributes required for the `/promotion` screen where a marketing video with subtitles is rendered that hosts the [XSS Tier 6](../part2/xss.md#embed-an-xss-payload-into-our-promo-video) challenge. |                                              |
| [`easterEggPlanet` subsection](#eastereggplanet-subsection) | Defines the customizations for the 3D-rendered planet easter egg.                                                                                                                                                |                                              |

#### `social` subsection

Specifies all social links embedded on various screens such as _About
Us_ or the _Photo Wall_.

| Property           | Description                                                                                      | Default                                                                 |
|:-------------------|:-------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------|
| `twitterUrl`       | URL used as the Twitter link promising coupon codes on the _About Us_ and _Your Basket_ screen.  | `'https://twitter.com/owasp_juiceshop'`                                 |
| `facebookUrl`      | URL used as the Facebook link promising coupon codes on the _About Us_ and _Your Basket_ screen. | `'https://www.facebook.com/owasp.juiceshop'`                            |
| `slackUrl`         | URL used as the Slack link on the _About Us_ screen.                                             | `'http://owaspslack.com'`                                               |
| `pressKitUrl`      | URL used as the link to logos and media files on the _About Us_ screen.                          | `'https://github.com/OWASP/owasp-swag/tree/master/projects/juice-shop'` |
| `questionnaireUrl` | URL used as the link to the user questionnaire on the _Score Board_ screen.                      | `'https://forms.gle/2Tr5m1pqnnesApxN8'`                                 |

#### `recyclePage` subsection

Defines custom elements on the _Request Recycling Box_ page.

| Property             | Description                                                                                                                          | Default               |
|:---------------------|:-------------------------------------------------------------------------------------------------------------------------------------|:----------------------|
| `topProductImage`    | Filename in `frontend/dist/frontend/assets/public/images/products` to use as the image on the top of the info column on the page.    | `fruit_press.jpg`     |
| `bottomProductImage` | Filename in `frontend/dist/frontend/assets/public/images/products` to use as the image on the bottom of the info column on the page. | `apple_pressings.jpg` |

#### `welcomeBanner` subsection

Defines a dismissable welcome banner that can be shown when first
visiting the application.

| Property           | Description                                                 | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|:-------------------|:------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `showOnFirstStart` | Shows or hides the banner.                                  | `true`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `title`            | Defines the headline of the banner.                         | `Welcome to OWASP Juice Shop!`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `message`          | Defines the body of the banner. Can contain arbitrary HTML. | `<p>Being a web application with a vast number of intended security vulnerabilities, the <strong>OWASP Juice Shop</strong> is supposed to be the opposite of a best practice or template application for web developers: It is an awareness, training, demonstration and exercise tool for security risks in modern web applications. The <strong>OWASP Juice Shop</strong> is an open-source project hosted by the non-profit <a href='https://owasp.org' target='_blank'>Open Web Application Security Project (OWASP)</a> and is developed and maintained by volunteers. Check out the link below for more information and documentation on the project.</p><h1><a href='https://owasp-juice.shop' target='_blank'>https://owasp-juice.shop</a></h1>` |

#### `cookieConsent` subsection

Defines the cookie consent dialog shown in the bottom right corner.

| Property          | Description                                                                            | Default                                                                                 |
|:------------------|:---------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------|
| `backgroundColor` | Color of the cookie banner itself.                                                     | `'#546e7a'`                                                                             |
| `textColor`       | Color of the `message` shown in the cookie banner.                                     | `'#ffffff'`                                                                             |
| `buttonColor`     | Defines the color of the button to dismiss the banner.                                 | `'#558b2f'`                                                                             |
| `buttonTextColor` | Color of the `dismissText` on the button.                                              | `'#ffffff'`                                                                             |
| `message`         | Explains the cookie usage in the application.                                          | `'This website uses fruit cookies to ensure you get the juiciest tracking experience.'` |
| `dismissText`     | The text shown on the button to dismiss the banner.                                    | `'Me want it!'`                                                                         |
| `linkText`        | Caption of the link that is shown after the `message` to refer to further information. | `'But me wait!'`                                                                        |
| `linkUrl`         | URL that provides further information about cookie usage.                              | `'https://www.youtube.com/watch?v=9PnbKL3wuH4'`                                         |

#### `securityTxt` subsection

Defines the attributes for the `security.txt` file based on the
<https://securitytxt.org/> Internet draft.

| Property           | Description                                                                                         | Default                                                                                           |
|:-------------------|:----------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------|
| `contact`          | An email address, phone number or URL to report security vulnerabilities to. Can be fake obviously. | `mailto:donotreply@owasp-juice.shop`                                                              |
| `encryption`       | URL to a public encryption key for secure communication. Can be fake obviously.                     | `https://keybase.io/bkimminich/pgp_keys.asc?fingerprint=19c01cb7157e4645e9e2c863062a85a8cbfbdcda` |
| `acknowledgements` | URL a "hall of fame" page. Can be fake obviously.                                                   | `/#/score-board`                                                                                  |

#### `promotion` subsection

Defines the attributes required for the `/promotion` screen where a
marketing video with subtitles is rendered that hosts the
[XSS Tier 6](../part2/xss.md#embed-an-xss-payload-into-our-promo-video)
challenge.

| Property    | Description                                                                                                                                                                                                         | Default               |
|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------|
| `video`     | Name of a file with `video/mp4` content type in `frontend/dist/frontend/assets/public/videos` _or_ URL of an image to download to that folder and then use as the promotion video.                                  | `JuiceShopJingle.mp4` |
| `subtitles` | Name of a [Web Video Text Tracks Format](https://www.w3.org/TR/webvtt1/) file in `frontend/dist/frontend/assets/public/videos` _or_ URL of an image to download to that folder and then use as the promotion video. | `JuiceShopJingle.vtt` |

#### `easterEggPlanet` subsection

Defines the customizations for the 3D-rendered planet easter egg.

| Property     | Description                                                                                                                                                            | Default           |
|:-------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------|
| `name`       | Name of the 3D planet "easter egg" as shown in the page title.                                                                                                         | `Orangeuze`       |
| `overlayMap` | Filename in `frontend/dist/frontend/assets/private` _or_ URL of an image to download to that folder and then use as an overlay texture for the 3D planet "easter egg". | `orangemap2k.jpg` |

#### `googleOauth` subsection

Defines the client identifier and allowed redirect URIs for Google OAuth
integration.

| Property                                                   | Description                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|:-----------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `clientId`                                                 | Client identifier of the Google Cloud Platform application to handle OAuth 2.0 requests from OWASP Juice Shop. | `'1005568560502-6hm16lef8oh46hr2d98vf2ohlnj4nfhq.apps.googleusercontent.com'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| [`authorizedRedirects`](#authorizedredirects-sub-sequence) | Sub-list for the redirect URIs authorized for Google OAuth.                                                    | <code>- { uri: 'https://demo.owasp-juice.shop' }<br> - { uri: 'http://demo.owasp-juice.shop' }<br> - { uri: 'https://juice-shop.herokuapp.com' }<br> - { uri: 'http://juice-shop.herokuapp.com' }<br> - { uri: 'https://preview.owasp-juice.shop' }<br> - { uri: 'http://preview.owasp-juice.shop' }<br> - { uri: 'https://juice-shop-staging.herokuapp.com' }<br> - { uri: 'http://juice-shop-staging.herokuapp.com' }<br> - { uri: 'http://juice-shop.wtf' }<br> - { uri: 'http://localhost:3000', proxy: 'http://local3000.owasp-juice.shop' }<br> - { uri: 'http://127.0.0.1:3000', proxy: 'http://local3000.owasp-juice.shop' }<br> - { uri: 'http://localhost:4200', proxy: 'http://local4200.owasp-juice.shop' }<br> - { uri: 'http://127.0.0.1:4200', proxy: 'http://local4200.owasp-juice.shop' }<br> - { uri: 'http://192.168.99.100:3000', proxy: 'http://localmac.owasp-juice.shop' }<br> - { uri: 'http://penguin.termina.linux.test:3000', proxy: 'http://localchromeos.owasp-juice.shop' }</code> |

##### `authorizedRedirects` sub-sequence

Defines the allowed redirect URIs and their optional proxy for Google
OAuth integration.

| Property | Description                                                                                                                                                                                                                                                         | Conditions | Default |
|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------|:--------|
| `uri`    | URI authorized on [Google Cloud Platform](https://console.cloud.google.com/apis/credentials) the Juice Shop is expected to be running on.                                                                                                                           | mandatory  |         |
| `proxy`  | Proxy URI authorized on [Google Cloud Platform](https://console.cloud.google.com/apis/credentials) that will itself redirect back to the original `uri`. Necessary for addresses not allowed as Google OAuth redirect targets, such as `localhost` or IP addresses. | optional   | `null`  |

### `challenges` section

Defines configuration options for the hacking challenges within the
Juice Shop.

| Property                                   | Description                                                                                                                                                                                                                       | Default                   |
|:-------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------|
| `showSolvedNotifications`                  | Shows or hides all instant _"challenge solved"_-notifications. Recommended to set to `false` for awareness demos.                                                                                                                 | `true`                    |
| `showHints`                                | Shows or hides hints for each challenge on hovering over/clicking its _"unsolved"_ badge on the score board.                                                                                                                      | `true`                    |
| `overwriteUrlForProductTamperingChallenge` | URL that should replace the original URL defined in `urlForProductTamperingChallenge` for the [Product Tampering](../part2/broken-access-control.md#change-the-href-of-the-link-within-the-o-saft-product-description) challenge. | `https://owasp.slack.com` |
| `safetyOverride`                           | Enables all [potentially dangerous challenges](challenges.md#potentially-dangerous-challenges) regardless of any harm they might cause when running in a containerized environment. ☠️ **Use at your own risk!**                 | `false`                   |

### `hackingInstructor` section

Allows to enable and customize the
[Hacking Instructor](../part1/challenges.md#hacking-instructor) tutorial
mode.

| Property      | Description                                                                                                                                                                             | Default        |
|:--------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------|
| `isEnabled`   | Shows or hides the [Hacking Instructor](../part1/challenges.md#hacking-instructor) links from the _Score Board_ and _Welcome Banner_.                                                   | `true`         |
| `avatarImage` | Filename in `frontend/dist/frontend/assets/public/images` _or_ a URL of an image which will first be download to that folder and then used as an avatar in the tutorial speech bubbles. | `juicyBot.png` |

### `products` sequence

List of product mappings which, when specified, replaces **the entire
list** of default products.

| Property                                        | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Conditions                             | Default                                                       |
|:------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------|:--------------------------------------------------------------|
| `name`                                          | Name of the product.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | mandatory                              |                                                               |
| `description`                                   | Description of the product.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | optional                               | `'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'` |
| `price`                                         | Price of the product.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | optional                               | A random price                                                |
| `image`                                         | Filename in `frontend/dist/frontend/assets/public/images/products` _or_ URL of an image to download to that folder and then use as a product image.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | optional                               | `undefined.png`                                               |
| `deletedDate`                                   | Deletion date of the product in `YYYY-MM-DD` format.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | optional                               | `null`                                                        |
| `urlForProductTamperingChallenge`               | Sets the original link of the product which is the target for the [Product Tampering](../part2/broken-access-control.md#change-the-href-of-the-link-within-the-o-saft-product-description) challenge. Overrides `deletedDate` with `null`.                                                                                                                                                                                                                                                                                                                                                                                                                                                       | must be defined on exactly one product |                                                               |
| `useForChristmasSpecialChallenge`               | Marks a product as the target for [the "christmas special" challenge](../part2/injection.md#order-the-christmas-special-offer-of-2014). Overrides `deletedDate` with `2014-12-27`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | must be `true` on exactly one product  |                                                               |
| `fileForRetrieveBlueprintChallenge`             | Filename in `frontend/dist/frontend/assets/public/images/products` _or_ URL of a file download to that folder and then use as the target for the [Retrieve Blueprint](../part2/sensitive-data-exposure.md#deprive-the-shop-of-earnings-by-downloading-the-blueprint-for-one-of-its-products) challenge. If a filename is specified but the file does not exist in `frontend/dist/frontend/assets/public/images/products` the challenge is still solvable by just requesting it from the server.  ℹ️ _To make this challenge realistically solvable, include some kind of hint to the blueprint file's name/type in the product image (e.g. its `Exif` metadata) or in the product description._ | must be defined on exactly one product |                                                               |
| `keywordsForPastebinDataLeakChallenge`          | List of keywords which are all mandatory to mention in a feedback or complaint to solve the [DLP Tier 1](../part2/sensitive-data-exposure.md#identify-an-unsafe-product-that-was-removed-from-the-shop-and-inform-the-shop-which-ingredients-are-dangerous) challenge. Overrides `deletedDate` with `2019-02-1`. ℹ️ _To make this challenge realistically solvable, provide the keywords on e.g. PasteBin in an obscured way that works well with the "dangerous ingredients of an unsafe product" narrative._                                                                                                                                                                                  | must be defined on exactly one product |                                                               |
| [`reviews` sub-sequence](#reviews-sub-sequence) | Sub-list which adds reviews to a product.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | optional                               | `~`                                                           |

#### `reviews` sub-sequence

Sub-list which adds reviews to a product.

| Property | Description                                                                 | Conditions |
|:---------|:----------------------------------------------------------------------------|:-----------|
| `text`   | Text of the review.                                                         | mandatory  |
| `author` | Reference by `key` from `data/static/users.yml` to the author of the review | mandatory  |

### `memories` sequence

List which, when specified, replaces all default _Photo Wall_ entries
except a hard-coded one needed to solve the
[Retrieve the photo of Bjoern's cat in "melee combat-mode"](../part2/improper-input-validation.md#retrieve-the-photo-of-bjoerns-cat-in-melee-combat-mode)
challenge.

| Property  | Description                                                                                                                                              | Conditions |
|:----------|:---------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------|
| `image`   | Filename in `frontend/dist/frontend/assets/public/images/uploads/` _or_ URL of an image to download to that folder and then use as a _Photo Wall_ image. | mandatory  |
| `caption` | Text to show when hovering over the image or sending a Tweet about it.                                                                                   | mandatory  |
| `user`    | Reference by `key` from `data/static/users.yml` to the owner of the photo upload.                                                                        | mandatory  |

### `ctf` section

Section to enable and configure the Capture-the-Flag mode built into
OWASP Juice Shop.

| Property                                                    | Description                                                                                                                                                                                                           | Default |
|:------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------|
| `showFlagsInNotifications`                                  | Shows or hides the CTF flag codes in the _"challenge solved"_-notifications. Is ignored when `application.showChallengeSolvedNotifications` is set to `false`.                                                        | `false` |
| `showCountryDetailsInNotifications`                         | Determines if the country (from `countryMapping`) mapped to the solved challenge is displayed in the notification. Can be `none`, `name`, `flag` or `both`. Only useful for CTFs using [FBCTF](ctf.md#running-fbctf). | `none`  |
| [`countryMapping` sub-mapping](#countrymapping-sub-mapping) | List of mappings which associates challenges to countries on the challenge map of [FBCTF](ctf.md#running-fbctf). Only needed for CTFs using [FBCTF](ctf.md#running-fbctf).                                            | `~`     |

#### `countryMapping` sub-mapping

List of mappings which associates challenges to countries on the
challenge map of [FBCTF](ctf.md#running-fbctf). Only needed for CTFs
using [FBCTF](ctf.md#running-fbctf):

* Challenge `key` from `data/static/challenges.yml`
  * `name` the name of the country
  * `code` the two-letter ISO code of the country

ℹ️ _When specifying `countryMapping`, it is mandatory to map **all
challenges** in order to produce a valid configuration file. It is
recommended to use `config/fbctf.yml` as a template for that purpose._

## Configuration example

```yaml
server:
  port: 3000
application:
  domain: juice-sh.op
  name: 'OWASP Juice Shop'
  logo: JuiceShop_Logo.png
  favicon: favicon_js.ico
  theme: bluegrey-lightgreen
  showVersionNumber: true
  showGitHubLinks: true
  numberOfRandomFakeUsers: 0
  altcoinName: Juicycoin
  privacyContactEmail: donotreply@owasp-juice.shop
  customMetricsPrefix: juiceshop
  social:
    twitterUrl: 'https://twitter.com/owasp_juiceshop'
    facebookUrl: 'https://www.facebook.com/owasp.juiceshop'
    slackUrl: 'http://owaspslack.com'
    redditUrl: 'https://www.reddit.com/r/owasp_juiceshop'
    pressKitUrl: 'https://github.com/OWASP/owasp-swag/tree/master/projects/juice-shop'
    questionnaireUrl: 'https://forms.gle/2Tr5m1pqnnesApxN8'
  recyclePage:
    topProductImage: fruit_press.jpg
    bottomProductImage: apple_pressings.jpg
  welcomeBanner:
    showOnFirstStart: true
    title: 'Welcome to OWASP Juice Shop!'
    message: "<p>Being a web application with a vast number of intended security vulnerabilities, the <strong>OWASP Juice Shop</strong> is supposed to be the opposite of a best practice or template application for web developers: It is an awareness, training, demonstration and exercise tool for security risks in modern web applications. The <strong>OWASP Juice Shop</strong> is an open-source project hosted by the non-profit <a href='https://owasp.org' target='_blank'>Open Web Application Security Project (OWASP)</a> and is developed and maintained by volunteers. Check out the link below for more information and documentation on the project.</p><h1><a href='https://owasp-juice.shop' target='_blank'>https://owasp-juice.shop</a></h1>"
  cookieConsent:
    backgroundColor: '#546e7a'
    textColor: '#ffffff'
    buttonColor: '#558b2f'
    buttonTextColor: '#ffffff'
    message: 'This website uses fruit cookies to ensure you get the juiciest tracking experience.'
    dismissText: 'Me want it!'
    linkText: 'But me wait!'
    linkUrl: 'https://www.youtube.com/watch?v=9PnbKL3wuH4'
  securityTxt:
    contact: 'mailto:donotreply@owasp-juice.shop'
    encryption: 'https://keybase.io/bkimminich/pgp_keys.asc?fingerprint=19c01cb7157e4645e9e2c863062a85a8cbfbdcda'
    acknowledgements: '/#/score-board'
  promotion:
    video: JuiceShopJingle.mp4
    subtitles: JuiceShopJingle.vtt
  easterEggPlanet:
    name: Orangeuze
    overlayMap: orangemap2k.jpg
  googleOauth:
    clientId: '1005568560502-6hm16lef8oh46hr2d98vf2ohlnj4nfhq.apps.googleusercontent.com'
    authorizedRedirects:
      - { uri: 'https://demo.owasp-juice.shop' }
      - { uri: 'http://demo.owasp-juice.shop' }
      - { uri: 'https://juice-shop.herokuapp.com' }
      - { uri: 'http://juice-shop.herokuapp.com' }
      - { uri: 'https://preview.owasp-juice.shop' }
      - { uri: 'http://preview.owasp-juice.shop' }
      - { uri: 'https://juice-shop-staging.herokuapp.com' }
      - { uri: 'http://juice-shop-staging.herokuapp.com' }
      - { uri: 'http://juice-shop.wtf' }
      - { uri: 'http://localhost:3000', proxy: 'http://local3000.owasp-juice.shop' }
      - { uri: 'http://127.0.0.1:3000', proxy: 'http://local3000.owasp-juice.shop' }
      - { uri: 'http://localhost:4200', proxy: 'http://local4200.owasp-juice.shop' }
      - { uri: 'http://127.0.0.1:4200', proxy: 'http://local4200.owasp-juice.shop' }
      - { uri: 'http://192.168.99.100:3000', proxy: 'http://localmac.owasp-juice.shop' }
      - { uri: 'http://penguin.termina.linux.test:3000', proxy: 'http://localchromeos.owasp-juice.shop' }
challenges:
  showSolvedNotifications: true
  showHints: true
  safetyOverride: false
  overwriteUrlForProductTamperingChallenge: 'https://owasp.slack.com'
hackingInstructor:
  isEnabled: true
  avatarImage: juicyBot.png
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
memories:
  -
    image: 'magn(et)ificent!-1571814229653.jpg'
    caption: 'Magn(et)ificent!'
    user: bjoernGoogle
  -
    image: 'my-rare-collectors-item!-[̲̅$̲̅(̲̅-͡°-͜ʖ-͡°̲̅)̲̅$̲̅]-1572603645543.jpg'
    caption: 'My rare collectors item! [̲̅$̲̅(̲̅ ͡° ͜ʖ ͡°̲̅)̲̅$̲̅]'
    user: bjoernGoogle
ctf:
  showFlagsInNotifications: false
  showCountryDetailsInNotifications: none
  countryMapping: ~
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
  showVersionNumber: false
  showGitHubLinks: false
  welcomeBanner:
    showOnFirstStart: false
challenges:
  showHints: false
  safetyOverride: true
hackingInstructor:
  isEnabled: false
ctf:
  showFlagsInNotifications: true
```

### Testing customizations

You can validate your custom configuration file against the schema by
running `npm run lint:config -- -f /path/to/myConfig.yml`. This
validation automatically happens on server startup as well.

To verify if your custom configuration will not break any of the
challenges, you should run the end-to-end tests via `npm run
protractor`. If they pass, all challenges will be working fine!

## Provided customizations

The following three customizations are provided out of the box by OWASP
Juice Shop:
* [7 Minute Security](https://github.com/bkimminich/juice-shop/blob/master/config/7ms.yml):
  Full conversion <https://7ms.us>-theme for the first podcast that
  picked up the Juice Shop way before it was famous! 😎
* [Mozilla-CTF](https://github.com/bkimminich/juice-shop/blob/master/config/mozilla.yml):
  Another full conversion theme harvested and refined from the
  [Mozilla Austin CTF-event](https://hacks.mozilla.org/2018/03/hands-on-web-security-capture-the-flag-with-owasp-juice-shop)!
  🦊
* [AllDayDeflOps](https://github.com/bkimminich/juice-shop/blob/master/config/addo.yml):
  This full conversion had its live debut at the
  [All Day DevOps 2019](https://www.alldaydevops.com/) conference and
  was released the same day! 🎀
* [The BodgeIt Store](https://github.com/bkimminich/juice-shop/blob/master/config/bodgeit.yml):
  An homage to
  [our server-side rendered ancestor](https://github.com/psiinon/bodgeit).
  May it rest in JSPs! 💀
* [CTF-mode](https://github.com/bkimminich/juice-shop/blob/master/config/ctf.yml):
  Keeps the Juice Shop in its default layout but disabled hints while
  enabling CTF flag codes in the _"challenge solved"_-notifications.
  Refer to [Hosting a CTF event](ctf.md) to learn more about running a
  CTF-event with OWASP Juice Shop. 🚩
* [Quiet mode](https://github.com/bkimminich/juice-shop/blob/master/config/quiet.yml):
  Keeps the Juice Shop in its default layout but hides all _"challenge
  solved"_-notifications, GitHub ribbon and challenge hints. 🔇
* [OWASP Juice Box](https://github.com/bkimminich/juice-shop/blob/master/config/juicebox.yml):
  If you find _jo͞osbäks_ much easier to pronounce than _jo͞osSHäp_,
  this customization is for you. 🧃
* [Unsafe mode](https://github.com/bkimminich/juice-shop/blob/master/config/unsafe.yml):
  Keeps everything at default settings except _enabling_ all
  [potentially dangerous challenges](challenges.md#potentially-dangerous-challenges)
  even in containerized environments. ☠️ **Use at your own risk!**

![Mozilla-CTF theme](/part1/img/theme_mozilla.png)

![BodgeIt Store theme](/part1/img/theme_bodgeit.png)

## Limitations

* When running a customization (except `default.yml`) that overwrites
  the property `application.domain`, the description of the challenges
  _Ephemeral Accountant_, _Forged Signed JWT_ and _Unsigned JWT_ will
  always be shown in English.
* Configurations (except `default.yml`) do not support translation of
  custom product names and descriptions as of {{book.juiceShopVersion}}.
* Several
  [Hacking Instructor](../part1/challenges.md#hacking-instructor)
  scripts depend on product inventory and product reviews that might not
  exist in the required form when you overwrote the default `products`
  list. Consider turning off the tutorials by setting
  `hackingInstructor.isEnabled` to `false` in that case.

## Additional Browser tweaks

Consider you are doing a live demo with a highly customized corporate
theme. Your narrative is, that this _really_ is an upcoming eCommerce
application _of that company_. [Walking the "happy path"](happy-path.md)
might now lure you into two situations which could spoil the immersion
for the audience.

#### Coupon codes on social media

If you configured the `twitterUrl`/`facebookUrl` as the company's own
account/page, you will most likely not find any coupon codes posted
there. You will probably fail to convince the social media team to tweet
or retweet some coupon code for an application that does not even exist!

![Coupon Immersion Spoiler](/part1/img/coupon_immersion-spoiler.png)

#### OAuth Login

Another immersion spoiler occurs when demonstrating the _Log in with
Google_ functionality, which will show you the application name
registered on Google Cloud Platform: _OWASP Juice Shop_! There is no way
to convince Google to show anything else for obvious trust and integrity
reasons.

![OAuth Immersion Spoiler](/part1/img/oauth_immersion-spoiler.png)

ℹ️ _Since v10.0.0 you can overwrite the
[`googleOauth` subsection](#googleoauth-subsection) to use your own
application on Google Cloud Platform for handling OAuth. This is a
relatively high effort, so maybe you want to kill two birds with one
stone instead as described in the next section._

### On-the-fly text replacement

You can solve both of the above problems _in your own Browser_ by
replacing text on the fly when the Twitter, Facebook or Google-Login
page is loaded. For Chrome
[Word Replacer II](https://chrome.google.com/webstore/detail/word-replacer-ii/djakfbefalbkkdgnhkkdiihelkjdpbfh?hl=en)
is a plugin that does this work for you with very little setup effort.
For Firefox
[FoxReplace](https://addons.mozilla.org/en-US/firefox/addon/foxreplace/)
does a similar job. After installing either plugin you have to create
two text replacements:

1. Create a replacement for `OWASP Juice Shop` (as it appears on
   Google-Login) with your own application name. Best use
   `application.name` from your configuration.
2. Create another replacement for a complete or partial Tweet or
   Facebook post with some marketing text and an actual coupon code. You
   can get valid coupon codes from the OWASP Juice Shop Twitter feed:
   <https://twitter.com/owasp_juiceshop>.

   ![Word Replacer II](/part1/img/word_replacer_ii.png)
3. Enable the plugin and verify your replacements work:

![Coupon Immersion Replacement](/part1/img/coupon_immersion-replacement.png)

![OAuth Immersion Replacement](/part1/img/oauth_immersion-replacement.png)
