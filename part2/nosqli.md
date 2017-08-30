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
| Let the server sleep for some time. (It has done more than enough hard work for you) | 3 of 5     |
| Update multiple product reviews at the same time.                                    | 3 of 5     |

### Let the server sleep for some time

:wrench: **TODO**

#### Hints

* This challenge is essentially a stripped-down Denial of Service (DoS) attack.
* :wrench: **TODO**

### Update multiple product reviews at the same time

:wrench: **TODO**

#### Hints

* Take a close look on how the equivalent of UPDATE-statements in MongoDB work.
* :wrench: **TODO**

[^1]: https://www.owasp.org/index.php/Testing_for_NoSQL_injection