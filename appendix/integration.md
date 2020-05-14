# Integration

OWASP Juice Shop follows strict conventions for describing challenges.
These allow you to easily integrate Juice Shop tutorials, hints and
solutions into your own security guides, knowledge bases, testing labs
etc.

## Challenges API

The endpoint `/api/Challenges` on your local Juice Shop instance (i.e.
<http://localhost:3000/api/Challenges>) returns information on the
configured challenges along with their current state in an easily
consumable JSON format:

```json
{
   "status":"success",
   "data":[
      {
         "id":1,
         "key":"restfulXssChallenge",
         "name":"API-only XSS",
         "category":"XSS",
         "description":"Perform a <i>persisted</i> XSS attack with <code>&lt;iframe src=\"javascript:alert(`xss`)\"&gt;</code> without using the frontend application at all. <em>(This challenge is <strong>not available</strong> on Heroku!)</em>",
         "difficulty":3,
         "hint":"You need to work with the server-side API directly. Try different HTTP verbs on different entities exposed through the API.",
         "hintUrl":"https://pwning.owasp-juice.shop/part2/xss.html#perform-a-persisted-xss-attack-without-using-the-frontend-application-at-all",
         "solved":false,
         "disabledEnv":"Heroku",
         "createdAt":"2020-03-23T12:00:34.258Z",
         "updatedAt":"2020-03-23T12:00:34.258Z"
      },
      {
         "id":2,
         "key":"accessLogDisclosureChallenge",
         "name":"Access Log",
         "category":"Sensitive Data Exposure",
         "description":"Gain access to any access log file of the server.",
         "difficulty":4,
         "hint":"Who would want a server access log to be accessible through a web application?",
         "hintUrl":"https://pwning.owasp-juice.shop/part2/sensitive-data-exposure.html#gain-access-to-any-access-log-file-of-the-server",
         "solved":false,
         "disabledEnv":null,
         "createdAt":"2020-03-23T12:00:34.259Z",
         "updatedAt":"2020-03-23T12:00:34.259Z"
      },
      {
        "...":"..."
      }
   ]
}
```

Instead of your own local instance you can also use the API of the
publicly available demo instances to pull challenge information:

* <http://demo.owasp-juice.shop/api/Challenges> for the latest released
  version (`master` branch)
* <http://preview.owasp-juice.shop/api/Challenges> for the next version
  to be released (`develop` branch)

🚨 _There is no uptime guarantee for either of these as they are both
only free Heroku dynos. Please refrain from making unnecessary amounts
of requests._

### API integration example

* The
  [Juice Shop CTF Extension](https://www.npmjs.com/package/juice-shop-ctf-cli)
  calls the API of a specified Juice Shop instance
  [to retrieve the challenges to later import into a CTF score server](../part1/ctf.md#generating-challenge-import-files-with-juice-shop-ctf-cli).

## Challenge declaration file

The single source of truth for challenges in OWASP Juice Shop is its
`data/static/challenges.yml` file. It is used during start-up of the
application to populate the `Challenges` table which is then exposed via
the [Challenges API](#challenges-api) endpoint.

Parsing this file directly for integration makes sense when you do not
rely on changed settings (e.g. hints being turned off) from an
individual [Customization](../part1/customization.md#customization)
and/or you do not have a running Juice Shop instance available in the
first place.

```yaml
-
  name: 'Some Name'
  category: 'Category of the challenge'
  description: 'Here the actual task for the attacker is described.'
  difficulty: 1 # a number between 1 and 6
  hint: 'A text hint to display on the Score Board when hovering over the challenge'
  hintUrl: 'https://pwning.owasp-juice.shop/part2/<category>.html#<shortened description>'
  key: someNameChallenge
  disabledEnv: # (optional) to disable challenges dangerous or incompatible in certain environments
    - Docker
    - Heroku
    - Windows
  tutorial: # (optional) present only on challenges with a Hacking Instructor tutorial
    order: 1 # a unique number to specify the recommended order of tutorials
```

The latest versions of the `challenges.yml` file can be found here:

* <https://raw.githubusercontent.com/bkimminich/juice-shop/master/data/static/challenges.yml>
  for the latest released version (`master` branch)
* <https://raw.githubusercontent.com/bkimminich/juice-shop/develop/data/static/challenges.yml>
  for the next version to be released (`develop` branch)

### Generating links to Juice Shop

| Description                                                                                                        | Link composition                                                                 | Condition                                        | Examples                                                                                                                                                                                   |
|:-------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------|:-------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Link to official hints for a specific challenge                                                                    | `<hintUrl>`                                                                      |                                                  | <https://pwning.owasp-juice.shop/part2/score-board.html#find-the-carefully-hidden-score-board-page> or <https://pwning.owasp-juice.shop/part2/xss.html#perform-a-dom-xss-attack>           |
| Link to official step-by-step solution for a specific challenge                                                    | `https://pwning.owasp-juice.shop/appendix/solutions.html#<hash part of hintUrl>` |                                                  | <https://pwning.owasp-juice.shop/appendix/solutions.html#find-the-carefully-hidden-score-board-page> or <https://pwning.owasp-juice.shop/appendix/solutions.html#perform-a-dom-xss-attack> |
| Direct link to a [Hacking Instructor](../part1/challenges.md#hacking-instructor) tutorial for a specific challenge | `/#/hacking-instructor?challenge=<name>`                                         | Only for challenges where `tutorial` is defined. | <http://localhost:3000/#/hacking-instructor?challenge=Score%20Board> or <http://preview.owasp-juice.shop/#/hacking-instructor?challenge=DOM%20XSS>                                         |

🖼️ _As the utilized GitBook version does not set the
`x-frame-options` header, it is possible to display content from
<https://pwning.owasp-juice.shop> in an `<iframe>`._

### YAML integration example

* The official project website <https://owasp-juice.shop> uses (a copy
  of) the `challenges.yml` to render
  [_Challenge Categories_](https://owasp.org/www-project-juice-shop/#div-challenges)
  and [_Hacking
  Instructor Tutorials_](https://owasp.org/www-project-juice-shop/#div-tutorials)
  tables with the help of
  [Liquid Filters](https://jekyllrb.com/docs/liquid/filters/).

## Challenge solution webhook

Any Juice Shop instance can be configured to call a webhook whenever one
of its {{book.juiceShopNumberOfChallenges}} hacking challenges is
solved. To use this feature the following environment variable needs to
be supplied to the Juice Shop server:

| Environment variable | Expected value                                                                    | Recommendations                                                                                                                                                                                                                                                     |
|:---------------------|:----------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `SOLUTIONS_WEBHOOK`  | URL of the webhook Juice Shop is supposed to call whenever a challenge is solved. | The webhook URL should be bound to the user who solved the challenge and allow its provider to verify the Juice Shop origin instance. In most cases **the webhook URL should be treated as sensitive information and not be published or transmitted unencrypted!** |

### Webhook payload

Juice Shop will send a `POST` request to the configured
`SOLUTIONS_WEBHOOK` with the following payload:

```json
{ "solution":
  { "challenge": "<'key' of the solved challenge from challenges.yml>",
    "evidence": null,
    "issuedOn": "<yyyy-MM-ddThh:mm:ssZ>"
  },
  "issuer": "owasp_juiceshop-<version>@<server os hostname>"
}
```

#### Webhook payload example

```json
{ "solution":
  { "challenge": "localXssChallenge",
    "evidence": null,
    "issuedOn": "2020-05-10T21:39:15.916Z"
  },
  "issuer": "owasp_juiceshop-11.0.0@661b2c39-4398-45b4-bfe5-5343096689d3"
}
```

