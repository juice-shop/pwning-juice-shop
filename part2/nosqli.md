# NoSQL Injection

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
> into a NoSQL API call.[^1]

## Challenges covered in this chapter

| Challenge                                                                            | Difficulty |
|:-------------------------------------------------------------------------------------|:-----------|
| Let the server sleep for some time. (It has done more than enough hard work for you) | :star::star::star::star:     |
| Update multiple product reviews at the same time.                                    | :star::star::star::star:     |

### Let the server sleep for some time

This challenge is about giving the server the chance to catch a breath
by putting it to sleep for a while, making it essentially a
stripped-down _denial-of-service_ attack challenge.

> In a denial-of-service (DoS) attack, an attacker attempts to prevent
> legitimate users from accessing information or services. By targeting
> your computer and its network connection, or the computers and network
> of the sites you are trying to use, an attacker may be able to prevent
> you from accessing email, websites, online accounts (banking, etc.),
> or other services that rely on the affected computer.[^2]

#### Hints

* As stated in the
  [Architecture overview](../introduction/architecture.md), OWASP Juice
  Shop uses a MongoDB derivate as its NoSQL database.
* The categorization into the _NoSQL Injection_ category totally already
  gives away the expected attack vector for this challenge. Trying any
  others will not solve the challenge, even if they might yield the same
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

[^1]: https://www.owasp.org/index.php/Testing_for_NoSQL_injection

[^2]: https://www.us-cert.gov/ncas/tips/ST04-015

