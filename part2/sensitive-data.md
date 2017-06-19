# Sensitive data exposure

> Many website registrations use security questions for both password
> retrieval/reset and sign-in verification. Some also ask the same
> security questions when users call on the phone. Security questions
> are one method to verify the user and stop unauthorized access. But
> there are problems with security questions. Websites may use poor
> security questions that may have negative results:
>
> The user can’t accurately remember the answer or the answer changed,
> The question doesn’t work for the user, The question is not safe and
> could be discovered or guessed by others. It is essential that we use
> good questions. Good security questions meet five criteria. The answer
> to a good security question is:
>
> * **Safe**: cannot be guessed or researched
> * **Stable**: does not change over time
> * **Memorable**: can remember
> * **Simple**: is precise, easy, consistent
> * **Many**: has many possible answers
>
> It is difficult to find questions that meet all five criteria which
> means that some questions are good, some fair, and most are poor. **In
> reality, there are few if any GOOD security questions.** People share
> so much personal information on social media, blogs, and websites,
> that it is hard to find questions that meet the criteria above. In
> addition, many questions are not applicable to some people; for
> example, what is your oldest child’s nickname – but you don’t have a
> child.[^1]

## Challenges covered in this chapter

| Challenge                                                                                                    | Difficulty |
|:-------------------------------------------------------------------------------------------------------------|:-----------|
| Reset Jim's password via the Forgot Password mechanism with the original answer to his security question.    | 2 of 5     |
| Reset Bender's password via the Forgot Password mechanism with the original answer to his security question. | 3 of 5     |
| Reset Bjoern's password via the Forgot Password mechanism with the original answer to his security question. | 4 of 5     |

### Reset Jim's password via the Forgot Password mechanism

This challenge is not about any technical vulnerability. Instead it is
about finding out the answer to user Jim's chosen security question and
use it to reset his password.

#### Hints

* The hardest part of this challenge is actually to find out who Jim
  actually is
* Jim picked one of the worst security questions and chose to answer it
  truthfully
* As Jim is a celebrity, the answer to his question is quite easy to
  find in publicly available information on the internet
* Brute forcing the answer should be possible with the right kind of
  word list

### Reset Bender's password via the Forgot Password mechanism

Simliar to
[the challenge of finding Jim's security answer](#reset-jims-password-via-the-forgot-password-mechanism)
this challenge is about finding the answer to user Bender's security
question. It is slightly harder to find out than Jim's answer.

#### Hints

* If you have no idea who Bender is, please put down this book _right
  now_ and watch the first episodes of
  [Futurama](http://www.imdb.com/title/tt0149460/) before you come back.
* Unexpectedly, Bender also chose to answer his chosen question
  truthfully
* Hints to the answer to Bender's question can be found in publicly
  available information on the internet
* Brute forcing the answer should be next to impossible

### Reset Bjoern's password via the Forgot Password mechanism

The final security question challenge is the one to find user Bjoern's
anwswer. As the OWASP Juice Shop Project Leader and author of this book
is not remotely as polular and publicly exposed as
[Jim](#reset-jims-password-via-the-forgot-password-mechanism) or
[Bender](#reset-benders-password-via-the-forgot-password-mechanism),
this challenge should be significantly harder.

#### Hints

:wrench:[TODO](https://github.com/bkimminich/pwning-juice-shop/issues/7)

[^1]: http://goodsecurityquestions.com