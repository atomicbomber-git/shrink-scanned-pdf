# shrink-scanned-pdf

Converts each page of a PDF file into images, then lowers the quality of each image and turn them back into a pdf.
This is supposed to shrink the file size of the PDF.

## Setup
Open the ImageMagick policy config file and comment out some lines described below; On Ubuntu derivatives,
it's usually located at `/etc/ImageMagick*/policy.xml`.

```bash
# Comment / remove the lines below in policy.xml

<policy domain="coder" rights="none" pattern="PS" />
<policy domain="coder" rights="none" pattern="PS2" />
<policy domain="coder" rights="none" pattern="PS3" />
<policy domain="coder" rights="none" pattern="EPS" />
<policy domain="coder" rights="none" pattern="PDF" />
<policy domain="coder" rights="none" pattern="XPS" />
```
## Usage

```bash
# Usage, the output file is in the current working directory
# where the script is evoked

./shrink-scanned-pdf.sh <filename>
```


