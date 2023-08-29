
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
Follow the antora installation guide over here[https://docs.antora.org/antora/latest/install-and-run-quickstart/]
After you have followed and implimented the installation guide in your system, verify antora command:
> antora -v
If it runs succesfully then download the dependency using the following command
> $ npm i @antora/lunr-extension

Run the following command to generate the website
> npx antora antora-playbook.yml

Check out the build folder for newly generated antora

## 2. PDF
Follow the installation guide for asciidoctor-pdf over here[https://docs.asciidoctor.org/pdf-converter/latest/install/]

After you have followed and implimented the installation guide in your system, verify using the following command:
> asciidoctor-pdf -v

If it runs succesfully then, Run the following command to generate the pdf
> asciidoctor-pdf -a pdf-theme=basic -a pdf-themesdir=resources/themes -a pdf-fontsdir=resources/fonts docs/modules/ROOT/pages/book.adoc

After this command runs successfully, the pdf would we availible at output/book.pdf

## 3. EPUB
Follow the installation guide for asciidoctor-pdf over here[https://docs.asciidoctor.org/epub3-converter/latest/#prerequisites]

After you have followed and implimented the installation guide in your system, verify using the following command:
> asciidoctor-epub3 -v

If it runs succesfully then, Run the following command to generate the epub file
> asciidoctor-epub3 -D output docs/modules/ROOT/pages/book.adoc

After this command runs successfully, the epub file would we availible at output/book.epub
