# Hacking exercise rules

## Tools you can use

### Browser

When hacking a web application a good internet browser is mandatory. The emphasis lies on _good_ here, so you do _not_ want to use Internet Explorer. Other than that it is up to your personal preference. Chrome and Firefox both work fine from the authors experience.

#### Browser development toolkit

When choosing a browser to work with you want to pick one with good integrated (or pluggable) developer tooling. Google's Chrome comes with its own _DevTools_, Mozilla's Firefox has similar built-in tools as well as the powerful ["FireBug"](https://addons.mozilla.org/de/firefox/addon/firebug/) plugin to offer.

When hacking a web application that is built is Javascript, __it is essential to your success to monitor the _Javascript Console_ permanently!__ It might leak valuable information to you through error or debugging logs!

> There is a _free_ online-learning course ["Discover DevTools"](https://www.codeschool.com/courses/discover-devtools) on [Code School](https://www.codeschool.com) where you can get a hands-on introduction to Chrome's powerful developer toolkit.

#### API testing plugin

API testing plugins like [PostMan](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop) for Chrome or [RESTClient](https://addons.mozilla.org/de/firefox/addon/restclient/) for Firefox allow you to communicate with the RESTful backend of a web application directly. Skipping the UI can often be useful to circumvent client-side security mechanisms or simply get certain tasks done faster. Here you can create requests for all available HTTP verbs (`GET`, `POST`, `PUT`, `DELETE` etc.) with all kinds of content-types, request headers etc.

> If the command line is a second home for you, the `curl` command will work - at least - just as good.

#### Request tampering plugin

### Penetration Testing Tools

#### Intercepting proxies

#### Kali Linux

### Internet

## Things you should not use

### Source code

Juice Shop is supposed to be attacked in a "black box" manner. That means you cannot look into the source code to search for vulnerabilities. As the application tracks your successful attacks on its challenges, the code must contain checks to verify if you succeeded. These checks would give many solutions away immediately.

The same goes for several other implementation details, where vulnerabilities were arbitrarily programmed into the application. These would be obvious when the source code is reviewed.

Finally the end-to-end test suite of Juice Shop was built hack all challenges automatically, in order to verify they can all be solved. These tests deliver then required attacks on a silver plate when reviewed.


### Server logfile

The server logs each request and all database queries executed. Many challenges actually rely on certain additions or changes to the database, so they are verified via SQL statements as well. These would show up in the log as well, potentially giving away several challenge solutions.

### GitHub repository

The GitHub repository https://github.com/bkimminich/juice-shop is entirely off limits for hackers - except for the [README.md]() of course. First and foremost because it contains the source code (see above).

Additionally it hosts the issue tracker of the project, which is used for idea management and task planning as well as bug tracking. You can of course submit an issue if you run into technical problems that are not covered by the [Troubleshooting section of the README.md](). You just should not read issues labeled `challenge` as they might contain spoilers or solutions.

## Getting hints

### This book

### Community chat

### Slack channel

### Mailing list
