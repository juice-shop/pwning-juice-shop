# Appendix B - Trainer's guide

## Instances

Make sure all participants have their own running Juice Shop instance to
work with. While attempting challenges like
[RCE](../part2/insecure-deserialization.md) or [XXE](../part2/xxe.md)
students might occasionally take down their server and would severely
impact other participants if they shared an instance.

There are multiple [Run Options](../part1/running.md#run-options) which
you can choose from. It is perfectly fine to run multiple docker
containers on one host. They do not effect each other.

## Customization

Especially in awareness trainings for management you might want to
create a higher immersion by making the Juice Shop look like an
application in the corporate design of the participants' own company.
Juice Shop offers
[various customization options](../part1/customization.md) to achieve
this.

Several themes come with the Juice Shop source code, the two most
sophisticated ones being
[7 Minute Security](https://github.com/bkimminich/juice-shop/blob/master/config/7ms.yml)
and
[Mozilla](https://github.com/bkimminich/juice-shop/blob/master/config/mozilla.yml).

In addition, you might want to disable all challenge notifications
during awareness trainings to avoid distraction. The
[Quiet](https://github.com/bkimminich/juice-shop/blob/master/config/quiet.yml)
theme demonstrates the necessary options to achieve this.

For a really sophisticated demo with consider performing some
[Additional Browser tweaks](../part1/customization.md#additional-browser-tweaks)
which will let you use OAuth2 login via Google and cast the illusion
that coupon code tweet actually came from your customer's company.

## Classroom hints

In a class room setup you have to find a way to distribute the URL of
each instance to the participants. For small groups, it is probably fine
to just spin up a number of containers and tell all participants which
URL they have to use. An example to spin up 10 Docker containers on a
UNIX based system is to run

```
for i in {10..19}; do docker run -d -p 40$i:3000 bkimminich/juice-shop; done
```

If you want to track progress centrally during the training, you might
want to [host a central CTF server](../part1/ctf.md) where participants
can post the challenges they already solved. You might consider turning
off public visibility of the leader board on the CTF server unless you
want to encourage the students to hack very competitively.

## Existing trainings

One existing training which uses the Juice Shop for example is a
[Timo Pagel's University Module](https://drive.google.com/open?id=1ITkTAALjZJnGV-hhAZ-zQfNx1sVTzlA2UlWD0s270ig).
The structure mostly is as following:

1. Introduce a topic (e.g. SQL Injection)
2. Let the participants try it out in the Juice Shop
3. Show mitigation/counter measures

Björn Kimminich's
[Web Application Security Training](https://www.slideshare.net/BjrnKimminich/web-application-security-training-v410)
slides as well as the web attack chapters of his
[IT Security Lecture](https://github.com/bkimminich/it-security-lecture)
follow a similar pattern of

1. Introduction
2. Timeboxed exercise
3. Demonstration of the hack (for all who did not finish the exercise in
   time)
4. Explaining mitigation and prevention

You can find more links to existing material in the
[Lectures and Trainings section](https://github.com/bkimminich/juice-shop/blob/master/REFERENCES.md#lectures-and-trainings)
of the project references on on GitHub.

## Challenges for demos

Well suited for live demonstrations in trainings or talks are the the
following challenges:

* [XSS Tier 0](../part2/xss.md#perform-a-reflected-xss-attack) and
  [XSS Tier 1](../part2/xss.md#perform-a-dom-xss-attack)
* [Forged Coupon](../part2/sensitive-data-exposure.md#forge-a-coupon-code-that-gives-you-a-discount-of-at-least-80)
* [CSRF](../part2/broken-authentication.md#change-benders-password-into-slurmcl4ssic-without-using-sql-injection)
* [User Credentials](../part2/injection.md#retrieve-a-list-of-all-user-credentials-via-sql-injection)
* [Admin Section](../part2/broken-access-control.md#access-the-administration-section-of-the-store)
* [Confidential Document](../part2/sensitive-data-exposure.md#access-a-confidential-document)
* [Forgotten Sales Backup](../part2/security-misconfiguration.md#access-a-salesmans-forgotten-backup-file)
  and
  [Forgotten Developer Backup](../part2/roll-your-own-security.md#access-a-developers-forgotten-backup-file)

Especially made for awareness trainings is the
[harlem shake/phishing showcase](https://github.com/wurstbrot/shake-logger)
can be used for awareness trainings.
