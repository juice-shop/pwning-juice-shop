# Appendix B - Trainer's Guide
## Instances
Make sure every participant should have his/her own running Juice Shop instance. While challenges like "XSS Tier 0" do not change the state, solving challenges like "RCE Tier 1" will completly take down the shop and do effect other participants when sharing an instance.
There are multiple [Run Options](https://bkimminich.gitbooks.io/pwning-owasp-juice-shop/content/part1/running.html#run-options) which you can choose from.
It is perfectly fine to run multiple docker containers on one host. They do not effect each other.

## Customization
Specially in an awareness trainings for management you might want to create an optical connection of the Juice Shop to the business of the participants. 
Juice Shop offers easy [customizing](https://bkimminich.gitbooks.io/pwning-owasp-juice-shop/content/part1/customization.html) options. 
The most relevant is that you can make the shop look like a website in the corporate design of the participants company (with [7MS](https://github.com/bkimminich/juice-shop/blob/master/config/7ms.yml) and [Mozilla](https://github.com/bkimminich/juice-shop/blob/master/config/mozilla.yml) as the most sophisticated examples). 
In addition, you might want to disable all challenge-notifications.

## Classrooom Hints
In class room setup you have to find a way to distribute the URL of each instance to the participants. For less than 15 participants, it might be fine to just spin up 15 containers and tell each participant which URL he/she has to use. An example to spin up 10 containers on a UNIX based system is to run `for i in {10..19}; do docker run -d -p 40$i:3000 bkimminich/juice-shop; done`.

If you want to track progress centrally during the training, you might want to host a central CTF server, following the Hosting a [CTF event guide](https://bkimminich.gitbooks.io/pwning-owasp-juice-shop/content/part1/ctf.html).

## Existing Trainings
One existing training which uses the Juice Shop for example is a [Timo Pagels Univerity Module](https://drive.google.com/open?id=1ITkTAALjZJnGV-hhAZ-zQfNx1sVTzlA2UlWD0s270ig). The structure mostly is as following:
 - Introduce a topic (e.g. SQL Injection)
 - Let the participants try it out in the Juice Shop
 - Show mitigation/counter measures

Specially the [harlem shake/phishing showcase](https://github.com/wurstbrot/shake-logger) can be used for awareness trainings.

## Challenges for Demos
Usefull for demonstations are the the following challenges: 
* XSS Tier 0
* Forged Coupon
* CSRF
* User Credentials
* Admin Section
* Confidential Document
