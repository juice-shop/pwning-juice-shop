# Race Condition

> A race condition or race hazard is the behavior of an electronics,
> software, or other system where the output is dependent on the
> sequence or timing of other uncontrollable events. It becomes a bug
> when events do not happen in the order the programmer intended.[^1]

<!-- -->

> Many software race conditions have associated computer security
> implications. A race condition allows an attacker with access to a
> shared resource to cause other actors that utilize that resource to
> malfunction, resulting in effects including denial of service and
> privilege escalation.
>
> A specific kind of race condition involves checking for a predicate
> (e.g. for authentication), then acting on the predicate, while the
> state can change between the time of check and the time of use. When
> this kind of bug exists in security-sensitive code, a security
> vulnerability called a time-of-check-to-time-of-use (TOCTTOU) bug is
> created.[^2]

## Challenges covered in this chapter

| Challenge                                             | Difficulty                           |
|:------------------------------------------------------|:-------------------------------------|
| Like any review at least three times as the same user. | :star::star::star::star::star::star: |

### Like any review at least three times as the same user

Any online shop with a review or rating functionality for its products
should be very keen on keeping fake or inappropriate reviews out. The
Juice Shop decided to give its customers the ability to give a "like" to
their favorite reviews. Of course, each user should be able to do so
only once for each review.

#### Hints

* Every user is (almost) immediately associated with the review they
  "liked" to prevent abuse of that functionality
* Did you really think clicking the "like" button three times in a row
  _really fast_ would be enough to solve a
  :star::star::star::star::star::star: challenge?

[^1]: https://en.wikipedia.org/wiki/Race_condition
[^2]: https://en.wikipedia.org/wiki/Race_condition#Computer_security