
# Pwning Juice Shop

Pwning Juice Shop is the official companion guide to the OWASP Juice Shop application. Being a web application with a vast number of intended security vulnerabilities, the OWASP Juice Shop is supposed to be the opposite of a best practice or template application for web developers: It is an awareness, training, demonstration and exercise tool for security risks in modern web applications. The OWASP Juice Shop is an open-source project hosted by the non-profit Open Web Application Security Project® (OWASP) and is developed and maintained by volunteers.

---

Download a .pdf, .epub, or .mobi file from:

https://leanpub.com/juice-shop (official release)
Read the book online at:

https://pwning.owasp-juice.shop
Contribute content, suggestions, and fixes on GitHub:

https://github.com/juice-shop/pwning-juice-shop
Official OWASP Juice Shop project homepage:

https://owasp-juice.shop

---
# Development guide

There are 3 kinds of file which could be generated using this repository:

## 1. Antora Website


> npx antora antora-playbook.yml
> npx antora antora-playbook-local.yml command should be used for local testing
> npx antora antora-playbook.yml command should be used for production version.
The difference between the above 2 commands is in the source files which are taken from the github in the latter version
- If you face any problem look over here: https://docs.antora.org/antora/latest/install-and-run-quickstart/

## 2. PDF
> asciidoctor-pdf -a pdf-theme=basic -a pdf-themesdir=resources/themes -a pdf-fontsdir=resources/fonts modules/ROOT/pages/book.adoc

- If you face any problem look over here: https://docs.asciidoctor.org/pdf-converter/latest/install/
## 3. EPUB
> asciidoctor-epub3 -D output modules/ROOT/pages/book.adoc
- If you face any problem look over here: https://docs.asciidoctor.org/epub3-converter/latest/#prerequisites



