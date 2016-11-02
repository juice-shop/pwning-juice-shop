# Running OWASP Juice Shop

## Run options

### One-click cloud instance

The quickest way to get a running instance of Juice Shop is to click the "__Deploy__ to Heroku" button in the ["Setup" section of the README.md on GitHub](https://github.com/bkimminich/juice-shop#deploy-on-heroku-free-0month-dyno). You have to log in with your Heroku account and will then receive a single instance (or "dyno" in Heroku lingo)
hosting the application. If you have forked the Juice Shop repository on GitHub, the "__Deploy__ to Heroku" button will deploy your forked version of the application. To deploy the latest official
version you must use the button of the original repository at https://github.com/bkimminich/juice-shop.

As the Juice Shop is supposed to be hacked and attacked - maybe even with aggressive brute-force scripts or automated scanner software - one might think that Heroku would not allow such activities
on their cloud platform. Quite the opposite! When describing the intended use of Juice Shop to the Heroku support team they analogously answered with: _"Everything except DDoS attacks is fine!"_

This means, as long as you do not use a botnet to attack your Juice Shop instance, you are free to use any tools or scripts you like!

### Local installation

To run the Juice Shop locally you need to have [Node.js](http://nodejs.org/) installed on your computer. Please refer to the [Node.js version compatibility table on GitHub](https://github.com/bkimminich/juice-shop#nodejs-version-compatibility) to find out what versions are currently supported. Juice Shop follows the [Node.js Long-term Support Release Schedule](https://github.com/nodejs/LTS) for this purpose. During development and Continuous Integration (CI) the application is most thoroughly tested with the current _Long-term Support (LTS)_ version of Node.js. At the same time it tries to remain compatible with at least one previous and the upcoming _Current_ version of Node.js.

#### From source

#### From pre-packaged distribution

### Docker image

### Vagrant VM

### Amazon EC2

## "Self-healing" feature
