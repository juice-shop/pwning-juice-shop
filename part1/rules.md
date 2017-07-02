# Hacking exercise rules

## :white_check_mark: Recommended hacking tools

### Browser

When hacking a web application a good internet browser is mandatory. The
emphasis lies on _good_ here, so you do _not_ want to use Internet
Explorer. Other than that it is up to your personal preference. Chrome
and Firefox both work fine from the authors experience.

#### Browser development toolkit

When choosing a browser to work with you want to pick one with good
integrated (or pluggable) developer tooling. Google's Chrome comes with
its own _DevTools_, Mozilla's Firefox has similar built-in tools as well
as the powerful
[FireBug](https://addons.mozilla.org/de/firefox/addon/firebug/) plugin
to offer.

When hacking a web application that relies havily on Javascript, **it is
essential to your success to monitor the _Javascript Console_
permanently!** It might leak valuable information to you through error
or debugging logs!

![DevTools Console tab](img/devtools_console.png)

Other useful features of DevTools and FireBug are their network overview
as well as insight into the client-side Javascript code, cookies and
other local storage being used by the application.

![DevTools Network tab](img/devtools_network.png)

![DevTools Sources tab](img/devtools_sources.png)

![DevTools Application tab](img/devtools_cookies.png)

If you are not familiar with the features of DevTools yet, there is a
worthwhile online-learning course
[Discover DevTools](https://www.codeschool.com/courses/discover-devtools)
on [Code School](https://www.codeschool.com) availabble for free. It
teaches you hands-on how Chrome's powerful developer toolkit works. The
course is worth a look even if you think you know the DevTools quite
well already.

![Discover DevTools course on Code School](img/codeschool_devtools.png)

#### API testing plugin

API testing plugins like
[PostMan](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop)
for Chrome or
[RESTClient](https://addons.mozilla.org/de/firefox/addon/restclient/)
for Firefox allow you to communicate with the RESTful backend of a web
application directly. Skipping the UI can often be useful to circumvent
client-side security mechanisms or simply get certain tasks done faster.
Here you can create requests for all available HTTP verbs (`GET`,
`POST`, `PUT`, `DELETE` etc.) with all kinds of content-types, request
headers etc.

If you feel more at home on the command line, `curl` will do the trick
just as fine as the recommended browser plugins.

#### Request tampering plugin

Request tampering plugins like
[TamperData](https://addons.mozilla.org/de/firefox/addon/tamper-data/)
for Firefox or
[Tamper Chrome](https://chrome.google.com/webstore/detail/tamper-chrome-extension/hifhgpdkfodlpnlmlnmhchnkepplebkb)
let you monitor and - more importantly - modify HTTP requests _before_
they are submitted from the browser to the server.

These can be crucial tools when trying to bypass certain input
validation or access restriction mechanisms, that are not properly
checked _on the server_ once more.

### Penetration testing tools

You _can_ solve all challenges just using a browser and the plugins
mentioned above. If you are new to web application hacking (or
penetration testing in general) this is also the _recommended_ set of
tools to start with. In case you have experience with professional
pentesting tools, you are free to use those! And you are _completely
free_ in your choice, so expensive commercial products are just as fine
as open source tools. With this kind of tooling you will have a
competitive advantage for some of the challenges, especially those where
_brute force_ is a viable attack. But there are just as many
multi-staged vulnerabilities in the OWASP Juice Shop where - at the time
of this writing - automated tools would probably not help you at all.

In the following sections you find some recommended pentesting tools in
case you want to try one. Please be aware that the tools are not trivial
to learn - let alone master. Trying to learn about the web application
security basics _and_ hacking tools _at the same time_ is unlikely to
get you very far in either of the two topics.

#### Intercepting proxies

An intercepting proxy is a software that is set up as _man in the
middle_ between your browser and the application you want to attack. It
monitors and analyzes all the HTTP traffic and typically lets you
tamper, replay and fuzz HTTP requests in various ways. These tools come
with lots of attack patterns built in and offer active as well as
passive attacks that can be scripted automatically or while you are
surfing the target application.

The open-source
[OWASP Zed Attack Proxy (ZAP)](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)
is such a software and offers many useful hacking tools for free:

> ZAP is an easy to use integrated penetration testing tool for finding
> vulnerabilities in web applications. It is designed to be used by
> people with a wide range of security experience and as such is ideal
> for developers and functional testers who are new to penetration
> testing. ZAP provides automated scanners as well as a set of tools
> that allow you to find security vulnerabilities manually.[^1]

![ZAP Logo](img/zap.png)

#### Pentesting Linux distributions

Instead of installing a tool such as ZAP on your computer, why not take
it, add _several hundred_ of other offensive security tools and put them
all into a ready-to-use Linux distribution? Entering
[Kali Linux](https://www.kali.org) and similar toolboxes:

> Kali Linux is a Debian-based Linux distribution aimed at advanced
> Penetration Testing and Security Auditing. Kali contains several
> hundred tools aimed at various information security tasks, such as
> Penetration Testing, Forensics and Reverse Engineering.[^2]

The keyword in the previous quote is _advanced_! More precisely, Kali
Linux is _easily overwhelming_ when beginners try to work with it, as
even the Kali development team states:

> As the distribution’s developers, you might expect us to recommend
> that everyone should be using Kali Linux. The fact of the matter is,
> however, that Kali is a Linux distribution specifically geared towards
> professional penetration testers and security specialists, and given
> its unique nature, it is __NOT__ a recommended distribution if you’re
> unfamiliar with Linux \[...\]. Even for experienced Linux users, Kali
> can pose some challenges.[^3]

Although there exist some more light-weight pentesting distributions,
they basically still present a high hurdle for people new to the IT
security field. If you still feel up to it, give Kali Linux a try!

![Kali Logo](img/kali.jpg)

### Internet

You are free to use Google during your hacking session to find helpful
websites or tools. The OWASP Juice Shop is leaking useful information
all over the place if you know where to look, but sometimes you simply
need to extend your research to the Internet in order to gain some
relevant piece of intel to beat a challenge.

## :bulb: Getting hints

Frankly speaking, you are reading the _premium source of hints_ right
now! Congratulations! In case you want to hack more on your own than
[follow the breadcrumbs through the wood of challenges in part II](../part2/README.md),
the most direct way to ask for specific hints for a particular challenge
is the community chat on Gitter.im at
https://gitter.im/bkimminich/juice-shop. You can simply log in to Gitter
with your GitHub account.

If you prefer, you can also use the project's Slack channel at
https://owasp.slack.com/messages/project-juiceshop. You just need to
self-invite you to OWASP's Slack first at http://owasp.herokuapp.com. If
you like it a bit more nostalgic, you can also join and post to the
project mailing list at
https://lists.owasp.org/mailman/listinfo/owasp_juice_shop_project.

## :x: Thing considered cheating

### Reading a solution ( :godmode: ) before trying

[Appendix A - Challenge solutions](../_book/appendix/solutions.md) is
there to help you in case you are stuck or have absolutely no idea how a
specific challenge is solved. Simply going through the entire appendix
back to back and follow the step-by-step instructions given there for
each challenge, would deprive you of most of the fun and learning effect
of the Juice Shop. You have been warned.

### Source code

Juice Shop is supposed to be attacked in a "black box" manner. That
means you cannot look into the source code to search for
vulnerabilities. As the application tracks your successful attacks on
its challenges, the code must contain checks to verify if you succeeded.
These checks would give many solutions away immediately.

The same goes for several other implementation details, where
vulnerabilities were arbitrarily programmed into the application. These
would be obvious when the source code is reviewed.

Finally the end-to-end test suite of Juice Shop was built hack all
challenges automatically, in order to verify they can all be solved.
These tests deliver all the required attacks on a silver plate when
reviewed.

### Server logfile

The server logs each request and all database queries executed. Many
challenges actually rely on certain additions or changes to the
database, so they are verified via SQL statements as well. These would
show up in the log as well, potentially giving away several challenge
solutions.

### GitHub repository

While stated earlier that "the Internet" is fine as a helpful resource,
consider the GitHub repository https://github.com/bkimminich/juice-shop
as entirely off limits. First and foremost because it contains the
source code (see above).

Additionally it hosts the issue tracker of the project, which is used
for idea management and task planning as well as bug tracking. You can
of course submit an issue if you run into technical problems that are
not covered by the [Troubleshooting section of the README.md](). You
just should not read issues labeled `challenge` as they might contain
spoilers or solutions.

Of course you are explicitly allowed to view
[the repository's README.md page](https://github.com/bkimminich/juice-shop/blob/master/README.md),
which contains no spoilers but merely covers project introduction, setup
and troubleshooting. Just do not "dig deeper" than that into the
repository files and folders.

### Database table `Challenges`

The challenges (and their progress) live in one database together with
the rest of the application data, namely in the `Challenges` table. Of
course you could "cheat" by simply editing the state of each challenge
from _unsolved_ to _solved_ by setting the corresponding `solved` column
to `1`. You then just have to keep your fingers crossed, that nobody
ever asks you to _demonstrate how_ you actually solved all the 4- and
5-star challenges so quickly.

### Score Board HTML/CSS

The Score Board and its features were covered in the
[Challenge tracking](challenges.md) chapter. In the current context of
"things you should not use" suffice it to say, that you could manipulate
the score board in the web browser to make challenges _appear as
solved_. Please be aware that this "cheat" is even easier (and more
embarrassing) to uncover in a classroom training than the previously
mentioned database manipulation: A simple reload of the score board URL
will let all your local CSS changes vanish in a blink and reveal your
_real_ hacking progress.

[^1]: https://github.com/zaproxy/zap-core-help/wiki
[^2]: http://docs.kali.org/introduction/what-is-kali-linux
[^3]: http://docs.kali.org/introduction/should-i-use-kali-linux
