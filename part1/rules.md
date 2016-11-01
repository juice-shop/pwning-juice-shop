# Hacking exercise rules

## Tools you can use

### Browser

#### Integrated development tools

#### PostMan plugin

#### TamperData plugin

### Penetration Testing Tools

#### OWASP ZAP

#### BurpSuite

#### Kali Linux

### Internet

## Things you should not use

### Source code

Juice Shop is supposed to be attacked in a "black box" manner. That means you cannot look into the source code to search for vulnerabilities. As the application tracks your successful attacks on its challenges, the code must contain checks to verify if you succeeded. These checks would give many solutions away immediately.

The same goes for several other implementation details, where vulnerabilities were arbitrarily programmed into the application. These would be obvious when the source code is reviewed.

Finally the end-to-end test suite of Juice Shop was built hack all challenges automatically, in order to verify they can all be solved. These tests deliver then required attacks on a silver plate when reviewed.


### Server logfile

The server logs each request and all database queries executed. Many challenges actually rely on certain additions or changes to the database, so they are verified via SQL statements as well. These would show up in the log as well, potentially giving away several challenge solutions.

### GitHub repository

The GitHub repository https://github.com/bkimminich/juice-shop is entirely off limits for hackers - except for the [README.md]() of course. First and foremost because it contains the source code (see above).

Additionally it hosts the issue tracker of the project, which is used for idea management and task planning as well as bug tracking. You can of course submit an issue if you run into technical problems that are not covered by the [Troubleshooting section of the README.md](). You just should not read issues labeled `challenge` as they might contain spoilers or solutions.

## Getting hints

### This book

### Community chat

### Slack channel

### Mailing list
