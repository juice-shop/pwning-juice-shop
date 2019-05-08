# Injection

> Injection flaws allow attackers to relay malicious code through an
> application to another system. These attacks include calls to the
> operating system via system calls, the use of external programs via
> shell commands, as well as calls to backend databases via SQL (i.e.,
> SQL injection). Whole scripts written in Perl, Python, and other
> languages can be injected into poorly designed applications and
> executed. Any time an application uses an interpreter of any type
> there is a danger of introducing an injection vulnerability.
>
> Many web applications use operating system features and external
> programs to perform their functions. Sendmail is probably the most
> frequently invoked external program, but many other programs are used
> as well. When a web application passes information from an HTTP
> request through as part of an external request, it must be carefully
> scrubbed. Otherwise, the attacker can inject special (meta)
> characters, malicious commands, or command modifiers into the
> information and the web application will blindly pass these on to the
> external system for execution.
>
> SQL injection is a particularly widespread and dangerous form of
> injection. To exploit a SQL injection flaw, the attacker must find a
> parameter that the web application passes through to a database. By
> carefully embedding malicious SQL commands into the content of the
> parameter, the attacker can trick the web application into forwarding
> a malicious query to the database. These attacks are not difficult to
> attempt and more tools are emerging that scan for these flaws. The
> consequences are particularly damaging, as an attacker can obtain,
> corrupt, or destroy database contents.
>
> Injection vulnerabilities can be very easy to discover and exploit,
> but they can also be extremely obscure. The consequences of a
> successful injection attack can also run the entire range of severity,
> from trivial to complete system compromise or destruction. In any
> case, the use of external calls is quite widespread, so the likelihood
> of an application having an injection flaw should be considered
> high.[^1]

## Challenges covered in this chapter

| Challenge                                                                                                                                  | Difficulty                           |
|:-------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------|
| Log in with the administrator's user account.                                                                                              | :star::star:                         |
| Log in with Bender's user account.                                                                                                         | :star::star::star:                   |
| Log in with Jim's user account.                                                                                                            | :star::star::star:                   |
| Order the Christmas special offer of 2014.                                                                                                 | :star::star::star:                   |
| Let the server sleep for some time. (It has done more than enough hard work for you)                                                       | :star::star::star::star:             |
| Update multiple product reviews at the same time.                                                                                          | :star::star::star::star:             |
| Retrieve a list of all user credentials via SQL Injection.                                                                                 | :star::star::star::star:             |
| All your orders are belong to us!                                                                                                          | :star::star::star::star::star:       |
| Infect the server with malware by abusing arbitrary command execution.                                                                     | :star::star::star::star::star::star: |

#### Reconnaissance advice

Instead of trying random attacks or go through an attack pattern list,
it is a good idea to find out if and where a vulnerability exists,
first. By injecting a payload that should typically _break_ an
underlying SQL query (e.g. `'` or `';`) you can analyze how the
behaviour differs from regular use. Maybe you can even provoke an error
where the application leaks details about the query structure and schema
details like table or column names. Do not miss this opportunity.

### Log in with the administrator's user account

What would a vulnerable web application be without an administrator user
account whose (supposedly) privileged access rights a successful hacker
can abuse?

#### Hints

* The challenge description probably gave away what form you should
  attack.
* If you happen to know the email address of the admin already, you can
  launch a targeted attack.
* You might be lucky with a dedicated attack pattern even if you have no
  clue about the admin email address.
* If you harvested the admin's password hash, you can of course try to
  attack that instead of using SQL Injection.
* Alternatively you can solve this challenge as a _combo_ with the
  [Log in with the administrator's user credentials without previously changing them or applying SQL Injection](broken-authentication.md#log-in-with-the-administrators-user-credentials-without-previously-changing-them-or-applying-sql-injection)
  challenge.

### Log in with Bender's user account

Bender is a regular customer, but mostly hangs out in the Juice Shop to
troll it for its lack of alcoholic beverages.

#### Hints

* The challenge description probably gave away what form you should
  attack.
* You need to know (or smart-guess) Bender's email address so you can
  launch a targeted attack.
* In case you try some other approach than SQL Injection, you will
  notice that Bender's password hash is not very useful.

### Log in with Jim's user account

Jim is a regular customer. He prefers juice from fruits that no man has
ever tasted before.

#### Hints

* The challenge description probably gave away what form you should
  attack.
* You need to know (or smart-guess) Jim's email address so you can
  launch a targeted attack.
* If you harvested Jim's password hash, you can try to attack that
  instead of using SQL Injection.

### Order the Christmas special offer of 2014

> Blind SQL (Structured Query Language) injection is a type of SQL
> Injection attack that asks the database true or false questions and
> determines the answer based on the applications response. This attack
> is often used when the web application is configured to show generic
> error messages, but has not mitigated the code that is vulnerable to
> SQL injection.
>
> When an attacker exploits SQL injection, sometimes the web application
> displays error messages from the database complaining that the SQL
> Query's syntax is incorrect. Blind SQL injection is nearly identical
> to normal SQL Injection, the only difference being the way the data is
> retrieved from the database. When the database does not output data to
> the web page, an attacker is forced to steal data by asking the
> database a series of true or false questions. This makes exploiting
> the SQL Injection vulnerability more difficult, but not
> impossible.[^4]

To solve this challenge you need _to order_ a product that is not
supposed to be available any more.

#### Hints

* Find out how the application _hides_ deleted products from its
  customers.
* Try to craft an attack string that makes deleted products visible
  again.
* You need to get the deleted product into your shopping cart and
  trigger the _Checkout_.
* Neither of the above can be achieved through the application frontend
  and it might even require Blind SQL Injection.

### Let the server sleep for some time

> NoSQL databases provide looser consistency restrictions than
> traditional SQL databases. By requiring fewer relational constraints
> and consistency checks, NoSQL databases often offer performance and
> scaling benefits. Yet these databases are still potentially vulnerable
> to injection attacks, even if they aren't using the traditional SQL
> syntax. Because these NoSQL injection attacks may execute within a
> procedural language, rather than in the declarative SQL language, the
> potential impacts are greater than traditional SQL injection.
>
> NoSQL database calls are written in the application's programming
> language, a custom API call, or formatted according to a common
> convention (such as XML, JSON, LINQ, etc). Malicious input targeting
> those specifications may not trigger the primarily application
> sanitization checks. For example, filtering out common HTML special
> characters such as `< > & ;` will not prevent attacks against a JSON
> API, where special characters include `/ { } : `.
>
> There are now over 150 NoSQL databases available for use within an
> application, providing APIs in a variety of languages and relationship
> models. Each offers different features and restrictions. Because there
> is not a common language between them, example injection code will not
> apply across all NoSQL databases. For this reason, anyone testing for
> NoSQL injection attacks will need to familiarize themselves with the
> syntax, data model, and underlying programming language in order to
> craft specific tests.
>
> NoSQL injection attacks may execute in different areas of an
> application than traditional SQL injection. Where SQL injection would
> execute within the database engine, NoSQL variants may execute during
> within the application layer or the database layer, depending on the
> NoSQL API used and data model. Typically NoSQL injection attacks will
> execute where the attack string is parsed, evaluated, or concatenated
> into a NoSQL API call.[^2]

This challenge is about giving the server the chance to catch a breath
by putting it to sleep for a while, making it essentially a
stripped-down _denial-of-service_ attack challenge.

> In a denial-of-service (DoS) attack, an attacker attempts to prevent
> legitimate users from accessing information or services. By targeting
> your computer and its network connection, or the computers and network
> of the sites you are trying to use, an attacker may be able to prevent
> you from accessing email, websites, online accounts (banking, etc.),
> or other services that rely on the affected computer.[^3]

#### Hints

* As stated in the
  [Architecture overview](../introduction/architecture.md), OWASP Juice
  Shop uses a MongoDB derivate as its NoSQL database.
* The categorization into the _NoSQL Injection_ category totally gives
  away the expected attack vector for this challenge. Trying any others
  will not solve the challenge, even if they might yield the same
  result.
* In particular, flooding the application with requests will **not**
  solve this challenge. _That_ would probably just _kill_ your server
  instance.

### Update multiple product reviews at the same time

The UI and API only offer ways to update individual product reviews.
This challenge is about manipulating an update so that it will affect
multiple reviews are the same time.

#### Hints

* This challenge requires a classic Injection attack.
* Take a close look on how the equivalent of UPDATE-statements in
  MongoDB work.
* It is also worth looking into how
  [Query Operators](https://docs.mongodb.com/manual/reference/operator/query/)
  work in MongoDB.

### Retrieve a list of all user credentials via SQL Injection

This challenge explains how a considerable number of companies were
affected by _data breaches_ without anyone breaking into the server room
or sneaking out with a USB stick full of sensitive information. Given
your application is vulnerable to a certain type of SQL Injection
attacks, hackers can have the same effect while comfortably sitting in a
café with free WiFi.

#### Hints

* Try to find an endpoint where you can influence data being retrieved
  from the server.
* Craft a `UNION SELECT` attack string to join data from another table
  into the original result.
* You might have to tackle some query syntax issues step-by-step,
  basically hopping from one error to the next
* As with
  [Order the Christmas special offer of 2014](#order-the-christmas-special-offer-of-2014)
  this cannot be achieved through the application frontend but involves
  some Blind SQL Injection instead.

### All your orders are belong to us

:wrench: **TODO**

#### Hints

:wrench: **TODO**

### Infect the server with malware by abusing arbitrary command execution

:wrench: **TODO**

#### Hints


[^1]: https://www.owasp.org/index.php/Injection_Flaws

[^2]: https://www.owasp.org/index.php/Testing_for_NoSQL_injection

[^3]: https://www.us-cert.gov/ncas/tips/ST04-015

[^4]: https://www.owasp.org/index.php/Blind_SQL_Injection