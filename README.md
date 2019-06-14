# archimate-py
A collection of python scripts that help to create Enterprise Architecture modelss from public data and write to archimate exchange formats and others.architecture


## Getting Started
### Generic
* fork the repo
* clone to local machine
* download data listed in ./data/input/resources.csv to ./data/input
* decompress data collections to ./data/input/COLLECTION-NAME

### linux
This section covers some initial steps specific to Linux
#### Required
Install some required packages
* libxml
* xsltproc
*
#### Suggested
* qXmlEdit
* XMLCopy
* Atom Text Editor with XML and XSLT plugins

### Windows
* looking for contributors here

### Mac
* Looking for contributors here



## Running Transformations
* Run the XSLT transformations from either:
  * your XSLT IDE tool
  * your XSLT compliant browser (eg Firefox)
  * Command line

### Linux
* CD to repository
* CD to ./xslt directory
* xsltproc FILENAME.xslt ./data/input/INPUT.xml ./data/output/OUTPUT.EXTENSION
* Example: xsltproc lookup.xsl ./data/input/acts-and-regs/lookup.xml ./data/output/acts-and-regs/lookup.html
