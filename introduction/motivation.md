# Why OWASP Juice Shop exists

To the unsuspecting user the OWASP Juice Shop just looks like a small online shop which sells - _surprise!_ - fruit & vegetable juice and associated products. Except for the entirely overrated payment and delivery aspect of the ecommerce business, the Juice Shop is fully functional. But this is just the tip of the iceberg. The Juice Shop contains over 30 challenges of varying difficulty where the user is supposed to exploit underlying security vulnerabilities. These vulnerabilities were intentionally planted in the application for exactly that purpose, but in a way that actually happens in "real-life" web development as well!

The user's hacking progress is tracked by the application using immediate push notifications for successful exploits as well as a score board for progress overview. Finding this score board is actually one of the (easy) challenges! The idea behind this is to utilize ["gamification"]() techniques to motivate users to get as many challenges solved - similar to unlocking ["achievements"]() in a video game - as possible.

Development of the OWASP Juice Shop started in September 2014 when the author was looking for a more modern exercise environment for inhouse security trainings at his employer. The application was developed as open-source software without any corporate branding right from the beginning. Until end of 2014 most of the current ecommerce functionality was up and running - along with an initial number of planted vulnerabilities. Over the years more variants of vulnerabilities were added. In parallel the application was kept up-to-date with latest web technology trends. Some additional features then brought the chance to add corresponding vulnerabilities again - and so the list of challenges kept growing.

Apart from the hacker and awareness training use case, penetration testing tools and automated security scanners are invited to use Juice Shop as a "guinea pig"-application to check how well their products cope with Javascript-heavy application frontends and REST APIs.

Two years after its inception, in September 2016, the Juice Shop was submitted and accepted as an _OWASP Tool Project_ by the [Open Web Application Security Project](https://owasp.org). This increased the overall visibility and outreach of the project significantly.

### Why the name "Juice Shop"?

In German there is a dedicated word for "dump", i.e. a store that sells lousy wares and does not value customer satisfaction much: "Saftladen". Reverse-translating this separately as "Saft" and "Laden" yields "juice" and "shop" in English. That is where the project name comes from. The fact that the initials "JS" match with those commonly used for "Javascript" was purely coincidental and not related to the choice of implementation technology.

![OWASP Juice Shop logo](img/juice-shop-logo.png)

### Why yet another vulnerable web application?

There was a considerable number of vulnerable web applications out there before the Juice Shop was created. The [OWASP Vulnerable Web Applications Directory (VWAD)]() maintains a list of these, divided by online and offline usage as well as programming language used. When Juice Shop came to live there were only _server-side rendered_ applications in the VWAD. But _Rich Internet Application (RIA)_- or _Single Page Application (SPA)_-style applications were already a commodity at that time.
