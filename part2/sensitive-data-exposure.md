# Sensitive Data Exposure

## Challenges covered in this chapter

| Name                       | Description                                                                                                                                                                             | Difficulty |
|:---------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------|
| Access Log                 | Gain access to any access log file of the server.                                                                                                                                       | ⭐⭐⭐⭐       |
| Confidential Document      | Access a confidential document.                                                                                                                                                         | ⭐          |
| Email Leak                 | Perform an unwanted information disclosure by accessing data cross-domain.                                                                                                              | ⭐⭐⭐⭐⭐      |
| Exposed Metrics            | Find the endpoint that serves usage data to be scraped by a popular monitoring system.                                                                                                  | ⭐          |
| Forgotten Developer Backup | Access a developer's forgotten backup file.                                                                                                                                             | ⭐⭐⭐⭐       |
| Forgotten Sales Backup     | Access a salesman's forgotten backup file.                                                                                                                                              | ⭐⭐⭐⭐       |
| GDPR Data Theft            | Steal someone else's personal data without using Injection.                                                                                                                             | ⭐⭐⭐⭐       |
| Leaked Access Logs         | Dumpster dive the Internet for a leaked password and log in to the original user account it belongs to. (Creating a new account with the same password does not qualify as a solution.) | ⭐⭐⭐⭐⭐      |
| Leaked Unsafe Product      | Identify an unsafe product that was removed from the shop and inform the shop which ingredients are dangerous.                                                                          | ⭐⭐⭐⭐       |
| Login Amy                  | Log in with Amy's original user credentials. (This could take 93.83 billion trillion trillion centuries to brute force, but luckily she did not read the "One Important Final Note")    | ⭐⭐⭐        |
| Login MC SafeSearch        | Log in with MC SafeSearch's original user credentials without applying SQL Injection or any other bypass.                                                                               | ⭐⭐         |
| Misplaced Signature File   | Access a misplaced SIEM signature file.                                                                                                                                                 | ⭐⭐⭐⭐       |
| Reset Uvogin's Password    | Reset Uvogin's password via the Forgot Password mechanism with _his original answer_ to his security question.                                                                          | ⭐⭐⭐⭐       |
| Retrieve Blueprint         | Deprive the shop of earnings by downloading the blueprint for one of its products.                                                                                                      | ⭐⭐⭐⭐⭐      |
| Geo Stalking - Easy         | Determine the answer to someone's security question by looking at the metadata of images on the Photo wall.                                                                                                      | ⭐⭐      |
| Geo Stalking - Hard        | Determine the answer to someone's security question by looking at images on the Photo wall.                                                                                                      | ⭐⭐⭐⭐      |

### Gain access to any access log file of the server

> An access log is a list of all the requests for individual files that
> people have requested from a Web site. These files will include the
> HTML files and their imbedded graphic images and any other associated
> files that get transmitted. The access log (sometimes referred to as
> the "raw data") can be analyzed and summarized by another program.
>
> In general, an access log can be analyzed to tell you:
>
> The number of visitors (unique first-time requests) to a home page The
> origin of the visitors in terms of their associated server's domain
> name (for example, visitors from .edu, .com, and .gov sites and from
> the online services) How many requests for each page at the site,
> which can be presented with the pages with most requests listed first
> Usage patterns in terms of time of day, day of week, and seasonally
> Access log keepers and analyzers can be found as shareware on the Web
> or may come with a Web server.[^1]

The Juice Shop application server is writing access logs, which can
contain interesting information that competitors might also be
interested in.

* Normally, server log files are written to disk on server side and are
  not accessible from the outside.
* Which raises the question: Who would want a server access log to be
  accessible through a web application?
* One particular file found in the folder you might already have found
  during the
  [Access a confidential document](#access-a-confidential-document)
  challenge might give you an idea who is interested in such a public
  exposure.
* Drilling down one level into the file system might not be sufficient.

### Access a confidential document

Somewhere in the application you can find a file that contains sensitive
information about some - potentially hostile - takeovers the Juice Shop
top management has planned.

* Analyze and tamper with links in the application that deliver a file
  directly.
* The file you are looking for is not protected in any way. Once you
  _found it_ you can also _access it_.

### Perform an unwanted information disclosure by accessing data cross-domain

Somewhere in the application there is an API endpoint which will allow
data to be accessed cross domain. Usually the same-origin policy would
prevent this but this endpoint has a special feature enabled which will
allow cross domain access under certain circumstances.

* Try to find and attack an endpoint that responds with user
  information. SQL Injection is not the solution here.
* What ways are there to access data from a web application
  cross-domain?
* This challenge uses an old way which is no longer recommended.

### Find the endpoint that serves usage data to be scraped by a popular monitoring system

The popular monitoring system being referred to in the challenge
description is [Prometheus](https://github.com/prometheus/prometheus):

> Prometheus is an open-source systems monitoring and alerting toolkit
> originally built at SoundCloud. Since its inception in 2012, many
> companies and organizations have adopted Prometheus, and the project
> has a very active developer and user community. It is now a standalone
> open source project and maintained independently of any company. To
> emphasize this, and to clarify the project's governance structure,
> Prometheus joined the Cloud Native Computing Foundation in 2016 as the
> second hosted project, after Kubernetes. [^6]

* The Juice Shop serves its metrics on the default path expected by
  Prometheus
* Guessing the path is probably just as quick as taking the RTFM route
  via <https://prometheus.io/docs/introduction/first_steps>

> RTFM is an initialism for the expression "read the fucking manual".
> [^7]

### Access a developer's forgotten backup file

During an emergency incident and the hotfix that followed, a developer
accidentally pasted an application configuration file into the wrong
place. Downloading this file will not only solve the _Access a
developer's forgotten backup file_ challenge but might also prove
crucial in several other challenges later on.

* Analyze and tamper with links in the application that deliver a file
  directly.
* The file is not directly accessible because a security mechanism
  prevents access to it.
* You need to trick the security mechanism into thinking that the file
  has a valid file type.
* For this challenge there is only _one approach_ to pull this trick.

### Access a salesman's forgotten backup file

A salesperson as accidentally uploaded a list of (by now outdated)
coupon codes to the application. Downloading this file will not only
solve the _Access a salesman's forgotten backup file_ challenge but
might also prove useful in another challenge later on.

* Analyze and tamper with links in the application that deliver a file
  directly.
* The file is not directly accessible because a security mechanism
  prevents access to it.
* You need to trick the security mechanism into thinking that the file
  has a valid file type.

### Steal someone else's personal data without using Injection

In order to comply with GDPR, the Juice Shop offers a _Request Data
Export_ function for its registered customers. It is possible to exploit
a flaw in the feature to retrieve more data than intended. Injection
attacks will not count to solve this one.

* You should not try to steal data from a "vanilla" user who never even
  ordered something at the shop.
* As everything about this data export functionality happens on the
  server-side, it won't be possible to just tamper with some HTTP
  requests to solve this challenge.
* Inspecting various server responses which contain user-specific data
  might give you a clue about the mistake the developers made.

### Dumpster dive the Internet for a leaked password and log in to the original user account it belongs to

The company behind the Juice Shop failed miserably at implementing any
data loss prevention measures for itself. This challenge simulates a
seemingly harmless data leak that - upon closer inspection -
subsequently allows an account takeover.

> **Data loss prevention software** detects potential data breaches/data
> ex-filtration transmissions and prevents them by monitoring, detecting
> and blocking sensitive data while in use (endpoint actions), in motion
> (network traffic), and at rest (data storage).
>
> The terms "data loss" and "data leak" are related and are often used
> interchangeably. Data loss incidents turn into data leak incidents in
> cases where media containing sensitive information is lost and
> subsequently acquired by an unauthorized party. However, a data leak
> is possible without losing the data on the originating side. Other
> terms associated with data leakage prevention are information leak
> detection and prevention (ILDP), information leak prevention (ILP),
> content monitoring and filtering (CMF), information protection and
> control (IPC) and extrusion prevention system (EPS), as opposed to
> intrusion prevention system. [^2]

* As the challenge name implies, your task is to find some leaked access
  logs which happen to have a fairly common format.
* A very popular help platform for developers might contain breadcrumbs
  towards solving this challenge
* The actual log file was copied & paste onto a platform often used to
  share data quickly with externals or even just internal peers.
* Once you found and harvested the important piece of information from
  the log, you could employ a technique called _Password Spraying_ to
  solve this challenge.

> Password spraying refers to the attack method that takes a large
> number of usernames and loops them with a single password. We can use
> multiple iterations using a number of different passwords, but the
> number of passwords attempted is usually low when compared to the
> number of users attempted. This method avoids password lockouts, and
> it is often more effective at uncovering weak passwords than targeting
> specific users.[^5]

### Identify an unsafe product that was removed from the shop and inform the shop which ingredients are dangerous

Similar to
[Dumpster dive the Internet for a leaked password and log in to the original user account it belongs to](#dumpster-dive-the-internet-for-a-leaked-password-and-log-in-to-the-original-user-account-it-belongs-to)
this challenge further highlights the risks from a lack of data loss
prevention.

* You must first identify the "unsafe product" which ist not available
  any more in the shop.
* Solving the
  [Order the Christmas special offer of 2014](injection.md#order-the-christmas-special-offer-of-2014)
  challenge might give it to you as by-catch.
* The actual data you need to solve this challenge was leaked on the
  same platform that was involved in
  [Dumpster dive the Internet for a leaked password and log in to the original user account it belongs to](#dumpster-dive-the-internet-for-a-leaked-password-and-log-in-to-the-original-user-account-it-belongs-to)
* Google is a particularly good accomplice in this challenge.

### Log in with Amy's original user credentials

This challenge is similar to
[Log in with the administrators user credentials without previously changing them or applying SQL Injection](broken-authentication.md#log-in-with-the-administrators-user-credentials-without-previously-changing-them-or-applying-sql-injection)
in the sense that only using her original credentials will work as a
challenge solutions.

![Amy and Kif Kroker](img/amy_and_kif.jpg)

* As with so many other characters from
  [Futurama](http://www.imdb.com/title/tt0149460/) this challenge is of
  course about logging in as Amy from that show. In the picture above
  you see her together with her alien husband Kif.
* The challenge description contains a few sentences which give away
  some information how Amy decided to strengthen her password.
* Obviously, Amy - being a little dimwitted - did not put nearly enough
  effort and creativity into the password selection process.

### Log in with MC SafeSearch's original user credentials

Another user login challenge where only the original password is
accepted as a solution. Employing SQL Injection or other attacks does
not count.

* MC SafeSearch is a rapper who produced the song
  ["Protect Ya' Passwordz"](https://www.youtube.com/watch?v=v59CX2DiX0Y)
  which explains password & sensitive data protection very nicely.
* After watching
  [the music video of this song](https://www.youtube.com/watch?v=v59CX2DiX0Y),
  you should agree that even ⭐⭐ is a slightly exaggerated difficulty
  rating for this challenge.

  [!["Protect Ya Passwordz"](img/protect-ya-passwordz.jpg)](https://www.youtube.com/watch?v=v59CX2DiX0Y)

### Access a misplaced SIEM signature file.

> Security information and event management (SIEM) technology supports
> threat detection and security incident response through the real-time
> collection and historical analysis of security events from a wide
> variety of event and contextual data sources. It also supports
> compliance reporting and incident investigation through analysis of
> historical data from these sources. The core capabilities of SIEM
> technology are a broad scope of event collection and the ability to
> correlate and analyze events across disparate sources.[^3]

The misplaced signature file is actually a rule file for
[Sigma](https://github.com/Neo23x0/sigma), a generic signature format
for SIEM systems:

> Sigma is a generic and open signature format that allows you to
> describe relevant log events in a straight forward manner. The rule
> format is very flexible, easy to write and applicable to any type of
> log file. The main purpose of this project is to provide a structured
> form in which researchers or analysts can describe their once
> developed detection methods and make them shareable with others.
>
> Sigma is for log files what Snort is for network traffic and YARA is
> for files.[^4]

* If you solved one of the other four file access challenges, you
  already know where the SIEM signature file is located
* Simply reuse the trick that already worked for the files above

### Reset Uvogin's password via the Forgot Password mechanism

With the amount of personal information that people tend to reveal online,
security questions are hardly reliable anymore.

* People often reuse aliases online. You might be able to find something by
  looking online for Uvogin's name or slight variations of it based on his
  unique writing habits
 
* You might be able to find some existing OSINT tools to help you in this
  investigation

### Deprive the shop of earnings by downloading the blueprint for one of its products

Why waste money for a product when you can just as well get your hands
on its blueprint in order to make it yourself?

* The product you might want to give a closer look is the _OWASP Juice
  Shop Logo (3D-printed)_
* For your inconvenience the blueprint was _not_ misplaced into the same
  place like so many others forgotten files covered in this chapter

ℹ️ _If you are running the Juice Shop with a custom theme and product
inventory, the product to inspect will be a different one. The tooltip
on the Score Board will tell you which one to look into._

### Determine the answer to someone's security question by looking at the metadata of images on the Photo wall

Who would have guessed that a simple walk in the park could lead to an account compromise. 
People these days are not careful with what they post online and are not aware of the
possible consequences it can have when people exploit that.

* Make use of tools that can inspect the metadata of images.
* Use this information to answer the security question of the person who enjoys hiking in the park.

### Determine the answer to someone's security question by looking at images on the Photo wall.



[^1]: https://searchsecurity.techtarget.com/definition/access-log
[^2]: https://en.wikipedia.org/wiki/Data_loss_prevention_software
[^3]: https://www.gartner.com/it-glossary/security-information-and-event-management-siem/
[^4]: https://github.com/Neo23x0/sigma#what-is-sigma
[^5]: https://resources.infosecinstitute.com/password-spraying/
[^6]: https://prometheus.io/docs/introduction/overview/
[^7]: https://en.wikipedia.org/wiki/RTFM

