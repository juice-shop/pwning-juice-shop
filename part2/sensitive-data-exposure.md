# Sensitive Data Exposure

## Challenges covered in this chapter

| Name                       | Challenge                                                                                                                                                                               | Difficulty                     |
|:---------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------|
| Access Log                 | Gain access to any access log file of the server.                                                                                                                                       | ⭐⭐⭐⭐       |
| Confidential Document      | Access a confidential document.                                                                                                                                                         | ⭐                         |
| Email Leak                 | Perform an unwanted information disclosure by accessing data cross-domain.                                                                                                              | ⭐⭐⭐⭐⭐ |
| Forgotten Developer Backup | Access a developer's forgotten backup file.                                                                                                                                             | ⭐⭐⭐⭐       |
| Forgotten Sales Backup     | Access a salesman's forgotten backup file.                                                                                                                                              | ⭐⭐⭐⭐       |
| GDPR Data Theft            | Steal someone else's personal data without using Injection.                                                                                                                             | ⭐⭐⭐⭐       |
| Leaked Access Logs         | Dumpster dive the Internet for a leaked password and log in to the original user account it belongs to. (Creating a new account with the same password does not qualify as a solution.) | ⭐⭐⭐⭐⭐ |
| Leaked Unsafe Product      | Identify an unsafe product that was removed from the shop and inform the shop which ingredients are dangerous.                                                                          | ⭐⭐⭐⭐       |
| Login Amy                  | Log in with Amy's original user credentials. (This could take 93.83 billion trillion trillion centuries to brute force, but luckily she did not read the "One Important Final Note")    | ⭐⭐⭐             |
| Login MC SafeSearch        | Log in with MC SafeSearch's original user credentials without applying SQL Injection or any other bypass.                                                                               | ⭐⭐                   |
| Misplaced Signature File   | Access a misplaced SIEM signature file.                                                                                                                                                 | ⭐⭐⭐⭐       |
| Retrieve Blueprint         | Deprive the shop of earnings by downloading the blueprint for one of its products.                                                                                                      | ⭐⭐⭐⭐⭐ |

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

🔧 **TODO**

### Dumpster dive the Internet for a leaked password and log in to the original user account it belongs to

🔧 **TODO**

### Identify an unsafe product that was removed from the shop and inform the shop which ingredients are dangerous

🔧 **TODO**

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
  you should agree that even ⭐⭐ is a slightly exaggerated
  difficulty rating for this challenge.

  [!["Protect Ya Passwordz"](img/protect-ya-passwordz.jpg)](https://www.youtube.com/watch?v=v59CX2DiX0Y)

### Access a misplaced SIEM signature file.

> Security information and event management (SIEM) technology supports
> threat detection and security incident response through the real-time
> collection and historical analysis of security events from a wide
> variety of event and contextual data sources. It also supports
> compliance reporting and incident investigation through analysis of
> historical data from these sources. The core capabilities of SIEM
> technology are a broad scope of event collection and the ability to
> correlate and analyze events across disparate sources.[^2]

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
> for files.[^3]

* If you solved one of the other four file access challenges, you
  already know where the SIEM signature file is located
* Simply reuse the trick that already worked for the files above

### Deprive the shop of earnings by downloading the blueprint for one of its products

Why waste money for a product when you can just as well get your hands
on its blueprint in order to make it yourself?

* The product you might want to give a closer look is the _OWASP Juice
  Shop Logo (3D-printed)_
* For your inconvenience the blueprint was _not_ misplaced into the same
  place like so many others forgotten files covered in this chapter

ℹ️ _If you are running the Juice Shop with a custom
theme and product inventory, the product to inspect will be a different
one. The tooltip on the Score Board will tell you which one to look
into._

[^1]: https://searchsecurity.techtarget.com/definition/access-log
[^2]: https://www.gartner.com/it-glossary/security-information-and-event-management-siem/
[^3]: https://github.com/Neo23x0/sigma#what-is-sigma
