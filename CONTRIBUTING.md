# Development guide

There are 3 kinds of files which could be generated using this repository:

## 1. Antora Website
Follow the antora installation guide over [here](https://docs.antora.org/antora/latest/install-and-run-quickstart/).
After you have followed and implemented the installation guide in your system, verify antora command:
```
antora -v
```

If it runs successfully then download the dependency using the following command
```
npm i @antora/lunr-extension
```

Run the following command to generate the website
```
npx antora antora-playbook.yml
```

Check out the build folder for newly generated antora.

## 2. PDF

Follow the installation guide for asciidoctor-pdf over [here](https://docs.asciidoctor.org/pdf-converter/latest/install/)

After you have followed and implemented the installation guide in your system, verify using the following command:
```
asciidoctor-pdf -v
```

If it runs successfully then, Run the following command to generate the pdf
```
asciidoctor-pdf -a pdf-theme=basic -a pdf-themesdir=resources/themes -a pdf-fontsdir=resources/fonts -D output docs/modules/ROOT/book.adoc
```

After this command runs successfully, the pdf will we availible at `output/book.pdf`.

## 3. EPUB

Follow the installation guide for asciidoctor-pdf over [here](https://docs.asciidoctor.org/epub3-converter/latest/#prerequisites)

After you have followed and implemented the installation guide in your system, verify using the following command:
```
asciidoctor-epub3 -v
```

If it runs successfully then, Run the following command to generate the epub file
```
asciidoctor-epub3 -D output docs/modules/ROOT/book.adoc
```

After this command runs successfully, the epub file will be availible at output/book.epub.

# Project structure

- `docs/` contains all the content for the Pwning Juice Shop. Any changes to the content should be made over here.

- `docs/antora.yml` contains everything related to a particular version.

- `docs/modules/ROOT/nav.adoc` contains the structuring of all the pages antora website.

- `docs/modules/ROOT/book.adoc` contains the structuring of pdf and epub versoining.

- `antora-playbook.yml` is the backbone of antora. Antora looks for everything written over there and follows the commands. Different versioning is mentioned in content.sources.branch. UI is being rendered as default UI with some overwriting through supplement-ui.

- `supplement-ui/` is where any changes for the antora-ui should be made. It will overwrite the default antora-ui.

- `output/` is the output directory for the epub version.

- `resources/` & `fonts/` contains the theme and fonts for asciidoctor-pdf.
