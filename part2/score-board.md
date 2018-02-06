# Finding the Score Board

In part 1 you were introduced to the Score Board and learned how it
tracks your challenge hacking progress. You also had a "happy path" tour
through the Juice Shop application from the perspective of a regular
customer without malicious intentions. But you never saw the Score
Board, did you?

## Challenges covered in this chapter

| Challenge                                     | Difficulty |
|:----------------------------------------------|:-----------|
| Find the carefully hidden 'Score Board' page. | :star:     |

### Find the carefully hidden 'Score Board' page

Why was the Score Board not visited during the "happy path" tour?
Because there seemed to be no link anywhere in the application that
would lead you there! You know that it must exist, which leaves two
possible explanations:

1. You missed the link during the initial mapping of the application
2. There is a URL that leads to the Score Board but it is not
   hyperlinked to

Most applications contain URLs which are not supposed to be publicly
accessible. A properly implemented authorization model would ensure that
only users _with appropriate permission_ can access such a URL. If an
application instead relies on the fact that the URL is _not visible
anywhere_, this is called "security through obscurity" which is a severe
anti-pattern:

> In security engineering, security through obscurity (or security by
> obscurity) is the reliance on the secrecy of the design or
> implementation as the main method of providing security for a system
> or component of a system. A system or component relying on obscurity
> may have theoretical or actual security vulnerabilities, but its
> owners or designers believe that if the flaws are not known, that will
> be sufficient to prevent a successful attack. Security experts have
> rejected this view as far back as 1851, and advise that obscurity
> should never be the only security mechanism.[^1]

#### Hints

* Knowing it exists, you can simply _guess_ what URL the Score Board
  might have.
* Alternatively, you can try to find a reference or clue within the
  parts of the application that are _not usually visible_ in the browser

[^1]: https://en.wikipedia.org/wiki/Security_through_obscurity
