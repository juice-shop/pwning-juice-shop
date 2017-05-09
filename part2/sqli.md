# SQL Injection

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

| Challenge                                                 | Difficulty |
|:----------------------------------------------------------|:-----------|
| Log in with the administrator's user account.             | 2 of 5     |
| Order the Christmas special offer of 2014.                | 2 of 5     |
| Retrieve a list of all user credentials via SQL Injection | 3 of 5     |
| Log in with Jim's user account.                           | 3 of 5     |
| Log in with Bender's user account.                        | 3 of 5     |

#### Reconnaissance advice

Instead of trying random attacks or go through an attack pattern list,
it is a good idea to find out if and where a vulnerability exists,
first. By injecting a payload that should typically _break_ an
underlying SQL query (e.g. `'` or `';`) you can analyze how the behavior
differs from regular use. Maybe you can even provoke an error where the
application leaks details about the query structure and schema details
like table or column names. Do not miss this opportunity.

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
  [Log in with the administrator's user credentials without previously changing them or applying SQL Injection](weak-security.md#log-in-with-the-administrators-user-credentials-without-previously-changing-them-or-applying-sql-injection)
  challenge.

### Order the Christmas special offer of 2014

To solve this challenge you need _to order_ a product that is not
supposed to be available any more.

#### Hints

* Find out how the application _hides_ deleted products from its
  customers.
* Try to craft an attack string that makes deleted products visible
  again.
* You need to get the deleted product into your shopping cart and
  trigger the _Checkout_.

### Retrieve a list of all user credentials via SQL Injection

This challenge explains how a considerable number of companies were
affected by _data breaches_ without anyone breaking into the server room
or sneaking out with a USB stick full of sensitive information. Given
your application is vulnerable to a certain type of SQL Injection
attacks, hackers can have the same effect while comfortably sitting in a
café with free WiFi.

#### Hints

* Try to find a page where you can influence a list of data being displayed.
* Craft a `UNION SELECT` attack string to join data from another table
  into the original result.
* You might have to tackle some query syntax issues step-by-step,
  basically hopping from one error to the next

### Log in with Jim's user account

Jim is a regular customer. He prefers juice from fruits that no man has
ever tasted before.

#### Hints

* The challenge description probably gave away what form you should
  attack.
* You need to know (or smart-guess) Jim's email address so you can
  launch a targeted attack.
* If you harvested Jim's password hash, you can of course try to attack
  that instead of SQL Injection.

### Log in with Bender's user account

Bender is a regular customer, but mostly hangs out in the Juice Shop to
troll it for its lack of alcoholic beverages.

#### Hints

* You should try one of the approaches you used on Jim.
* Bender's password hash might not help you very much.

[^1]: https://www.owasp.org/index.php/Injection_Flaws
