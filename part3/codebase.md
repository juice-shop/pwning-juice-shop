# Codebase 101

Jumping head first into any foreign codebase can cause a little
headache. This section is there to help you find your way through the
code of OWASP Juice Shop. On its top level the Juice Shop codebase is
mainly separated into a client and a server tier, the latter with an
underlying lightweight database and file system as storage.

## Client Tier

:wrench: **TODO**

![Client tier focus](img/architecture-client.png)

### Services

:wrench: **TODO**

### Controllers

:wrench: **TODO**

### Views

:wrench: **TODO**

### Index page template

:wrench: **TODO**

### Client-side code minification

All client side code (except the `index.html`) is first _uglified_ (for
[security by obscurity](https://en.wikipedia.org/wiki/Security_through_obscurity))
and then _minified_ (for initial load time reduction) during the build
process (launched with `npm install`) of the application. This creates
an `app/dist/juice-shop.min.js` file, which is included by the
`index.html` to load all application-specific client-side code.

If you want to quickly test client-side code changes, it can be
cumbersome to launch `npm install` over and over again. Instead you can
simply trigger the minification to generate the `juice-shop.min.js` file
with

```
grunt minify
```

and then refresh your browser with `F5` to test your changes. This will
require grunt being installed globally on your system, so if above
command fails for you, please run `npm install -g grunt-cli` once to
install this useful task runner. From then on, `grunt minify` should
work.

## Server Tier

:wrench: **TODO**

![Server tier focus](img/architecture-server.png)

### Routes

:wrench: **TODO**

#### Generated API endpoints

:wrench: **TODO**

#### Hand-written routes

:wrench: **TODO**

### Custom libraries

:wrench: **TODO**

#### Useful utilities

:wrench: **TODO**

#### Insecurity features

:wrench: **TODO**

## Storage Tier

:wrench: **TODO**

![DB tier focus](img/architecture-database.png)

### Database

:wrench: **TODO**

#### Populating the DB

:wrench: **TODO**

### File system

:wrench: **TODO**
