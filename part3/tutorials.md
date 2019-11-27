# Hacking Instructor tutorial scripts

With the [Hacking Instructor](../part1/challenges.md#hacking-instructor)
the OWASP Juice Shop offers very beginner-friendly tutorial scripts that
guide the user through some of the challenges.

Providing such scripts is a special kind of code contribution. It does
not require sophisticated programming, which is why the following
section will provide an overview of how a Hacking Instructor script is
written.

The Hacking Instructor is part of the
[Client Tier](codebase.md#client-tier) but independent of Angular.
Therefore its code lives in a separate folder
`frontend/src/hacking-instructor`:

![Hacking Instructor folder](img/hackingInstructorFolder.png)

## Challenge instruction scripts

Any challenge instruction script must provide an implementation of the
`ChallengeInstruction` interface which is defined as

```typescript
export interface ChallengeInstruction {
  name: string
  hints: ChallengeHint[]
}
```

The `name` property must _exactly_ match the `name` property of the
corresponding challenge in `data/static/challenges.yml`. The actual
tutorial is comprised of a list of hints specified by the
`ChallengeHint` interface:

```typescript
export interface ChallengeHint {
  /**
   * Text in the hint box
   * Can be formatted using markdown
   */
  text: string
  /**
   * Query Selector String of the Element the hint should be displayed next to.
   */
  fixture: string
  /**
   * Set to true if the hint should not be able to be skipped by clicking on it.
   * Defaults to false
   */
  unskippable?: boolean
  /**
  * Function declaring the condition under which the tutorial will continue.
  */
  resolved: () => Promise<void>
}
```

### `text`

The mandatory `text` property is the hint text being displayed to the
user. It must be written in English and in a friendly conversational
tone. If a text gets too long, consider splitting it into two or more
hints that are displayed in sequence instead.

### `fixture`

With the mandatory `fixture` property the speech bubble with the hint is
bound to a location on the screen. It uses the
[CSS selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors)
syntax to find a parent element matching the given `fixture`. The speech
bubble will be dynamically inserted before its parent in the DOM and is
styled as `inline` and `relative` to it. The most commonly used CSS
selectors for `fixture` are:

* [ID selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors)
  for the `id` attribute, e.g. `#password` or `#navbarAccount`
* [Class selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors)
  for `class` attributes, e.g. `.noResult`
* [Type selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Type_selectors)
  for tag names, e.g. `app-navbar`

☝️ Any combination of valid CSS selectors can be used as well, e.g.
`#searchQuery input` to explicitly select the first `<input>` tag within
`<mat-search-bar id="searchQuery">` but _not_ the tag <span
id="searchQuery">.

### `unskippable`

By default you can skip all hints of a script by simply clicking on the
speech bubble. The script will then continue with the next step. For
non-interactive hints that are simply shown for a number of seconds and
then move on, this is mostly fine and intended. For interactive or
otherwise important hints you should set `unskippable: true` to prevent
that behavior.

☝️ For hints which contain some expected input it is recommended to
_always_ set `unskippable: true` to allow the user to select & copy that
part of the text without accidentally triggering the skip feature.

### `resolved`

Lastly, the `resolved` property must declare a function that returns a
`Promise` which - upon resolution - will let the script continue to the
next hint (or finish the script if there are no more hints left).
Instead of worrying about writing your own functions, have a look at the
available [Helper functions](#helper-functions) first. They will make
scripting tutorials a lot easier for you.

## Helper functions

You can import various helper functions from
`frontend/src/hacking-instructor/helpers/helpers.ts` and use them
conveniently as your `resolved` function in any challenge hint:

| Helper function                                                                                     | Usage example                                                                      |
|:----------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------|
| `waitInMs (timeInMs: number)`                                                                       | `resolved: waitInMs(5000)`                                                         |
| `waitForElementToGetClicked (elementSelector: string)`                                              | `resolved: waitForElementToGetClicked('#loginButton')`                             |
| `waitForInputToNotBeEmpty (inputSelector: string)`                                                  | `resolved: waitForInputToNotBeEmpty('#password')`                                  |
| `waitForInputToHaveValue (inputSelector: string, value: string, options = { ignoreCase: true })`    | `resolved: waitForInputToHaveValue('#email', "' OR true--")`                       |
| `waitForInputToNotHaveValue (inputSelector: string, value: string, options = { ignoreCase: true })` | `resolved: waitForInputToNotHaveValue('#comment', "WTF?!", { ignoreCase: false })` |
| `waitForElementsInnerHtmlToBe (elementSelector: string, value: String)`                             | `resolved: waitForInputToHaveValue('#searchQuery input', 'owasp')`                 |
| `waitForAngularRouteToBeVisited (route: String)`                                                    | `resolved: waitForAngularRouteToBeVisited('login')`                                |

ℹ️ The helper functions are supposed to be self-explanatory enough on
their own. Please check out the [Reference example](#reference-example)
for more information on when and how to use each one.

## Registering a new script

To register a new script, it only needs to be imported and included in
the `challengeInstructions: ChallengeInstruction[]` within
`frontend/src/hacking-instructor/index.ts`:

```typescript
import { LoginAdminInstruction } from './challenges/loginAdmin'
import { DomXssInstruction } from './challenges/localXss'
import { ScoreBoardInstruction } from './challenges/scoreBoard'

const challengeInstructions: ChallengeInstruction[] = [
  ScoreBoardInstruction,
  LoginAdminInstruction,
  DomXssInstruction
]
```

As long as the `name`s defined in the script and `challenges.yml` match,
the tutorial will be automatically wired into the _Score Board_.

## Reference example

The following code snippet shows the entire tutorial script for the
[Login Admin](../part2/injection.md#log-in-with-the-administrators-user-account)
challenge. As it uses most available helpers, two custom
`resolved`-functions as well as Markdown to style some hint texts, it is
the perfect reference for your own scripts:


```typescript
import {
  waitForInputToHaveValue,
  waitForInputToNotBeEmpty,
  waitForElementToGetClicked,
  waitInMs,
  sleep, waitForAngularRouteToBeVisited
} from '../helpers/helpers'
import { ChallengeInstruction } from '../'

export const LoginAdminInstruction: ChallengeInstruction = {
  name: 'Login Admin',
  hints: [
    {
      text:
        "To start this challenge, you'll have to log out first.",
      fixture: '#navbarAccount',
      unskippable: true,
      async resolved () {
        while (true) {
          if (localStorage.getItem('token') === null) {
            break
          }
          await sleep(100)
        }
      }
    },
    {
      text:
        "Let's try if we find a way to log in with the administrator's user account. To begin, go to the _Login_ page via the _Account_ menu.",
      fixture: 'app-navbar',
      unskippable: true,
      resolved: waitForAngularRouteToBeVisited('login')
    },
    {
      text: 'To find a way around the normal login process we will try to use a **SQL Injection** (SQLi) attack.',
      fixture: '#email',
      resolved: waitInMs(8000)
    },
    {
      text: "A good starting point for simple SQL Injections is to insert quotation marks (like `\"` or `'`). These mess with the syntax of an insecurely concatenated query and might give you feedback if an endpoint is vulnerable or not.",
      fixture: '#email',
      resolved: waitInMs(15000)
    },
    {
      text: "Start with entering `'` in the **email field**.",
      fixture: '#email',
      unskippable: true,
      resolved: waitForInputToHaveValue('#email', "'")
    },
    {
      text: "Now put anything in the **password field**. It doesn't matter what.",
      fixture: '#password',
      unskippable: true,
      resolved: waitForInputToNotBeEmpty('#password')
    },
    {
      text: 'Press the _Log in_ button.',
      fixture: '#rememberMe',
      unskippable: true,
      resolved: waitForElementToGetClicked('#loginButton')
    },
    {
      text: "Nice! Do you see the red `[object Object]` error at the top? Unfortunately it isn't really telling us much about what went wrong...",
      fixture: '#rememberMe',
      resolved: waitInMs(10000)
    },
    {
      text: 'Maybe you will be able to find out more information about the error in the JavaScript console or the network tab of your browser!',
      fixture: '#rememberMe',
      resolved: waitInMs(10000)
    },
    {
      text: 'Did you spot the error message with the `SQLITE_ERROR` and the entire SQL query in the console output? If not, keep the console open and click _Log in_ again. Then inspect the occuring log message closely.',
      fixture: '#rememberMe',
      resolved: waitInMs(30000)
    },
    {
      text: "Let's try to manipulate the query a bit to make it useful. Try out typing `' OR true` into the **email field**.",
      fixture: '#email',
      unskippable: true,
      resolved: waitForInputToHaveValue('#email', "' OR true")
    },
    {
      text: 'Now click the _Log in_ button again.',
      fixture: '#rememberMe',
      unskippable: true,
      resolved: waitForElementToGetClicked('#loginButton')
    },
    {
      text: 'Mhh... The query is still invalid? Can you see why from the new error in the console?',
      fixture: '#rememberMe',
      resolved: waitInMs(8000)
    },
    {
      text: "We need to make sure that the rest of the query after our injection doesn't get executed. Any Ideas?",
      fixture: '#rememberMe',
      resolved: waitInMs(8000)
    },
    {
      text: 'You can comment out anything after your injection payload from query using comments in SQL. In SQLite databases you can use `--` for that.',
      fixture: '#rememberMe',
      resolved: waitInMs(10000)
    },
    {
      text: "So, type in `' OR true--` into the email field.",
      fixture: '#email',
      unskippable: true,
      resolved: waitForInputToHaveValue('#email', "' OR true--")
    },
    {
      text: 'Press the _Log in_ button again and sit back...',
      fixture: '#rememberMe',
      unskippable: true,
      resolved: waitForElementToGetClicked('#loginButton')
    },
    {
      text:
        'That worked, right?! To see with whose account you just logged in, open the _Account_ menu.',
      fixture: '#navbarAccount',
      unskippable: true,
      resolved: waitForElementToGetClicked('#navbarAccount')
    },
    {
      text:
        '🎉 Congratulations! You have been logged in as the **administrator** of the shop! (If you want to understand why, try to reproduce what your `\' OR true--` did _exactly_ to the query.)',
      fixture: 'app-navbar',
      resolved: waitInMs(20000)
    }
  ]
}
```
