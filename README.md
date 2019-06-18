# archimate-py
A collection of scripts that help to create Enterprise Architecture models from public data and write to archimate exchange formats and others.

The archimate-py project name was derived by combining the [ArchiMate](https://en.wikipedia.org/wiki/ArchiMate) modeling language with the [Python](https://www.python.org/) scripting language. Real original, we know.

The purpose of this project is to automate the creation of reusable [Enterprise Architecture](https://en.wikipedia.org/wiki/Enterprise_architecture) components from source documents. These source documents evolve and are updated over time. Currently, these updates lead to outdated architecture models and require manaual intervention to update. Through automation techniques, architects will be able to create, access and leverage up to date EA components. The desired outcome is that architects will spend less time re-modeling source documents and duplicating efforts of others, and more time building and communicating architectures.

The initial use case for this project is to consume various source of [Government of Canada Open Datasets](https://open.canada.ca) and produce archimate objects for consumption into the [canada-ca enterprise architecture public repository on github](https://github.com/canada-ca/architecture). Although this project can easily scale to other governments or other organizations, the project was started to solve a problem for architects within the [Government of Canada](http://canada.ca/).

Some python scripts are used for handling the processing and control of some automated processes. The majority of the heavy lifting is controlled through XSLT version 2.0 scripts.

Python was chosen as a control language due to its portability between Linux, Mac and Windows. [Download Python here](https://www.python.org/downloads/)

On linux and Mac systems you will require [saxon-xslt](http://manpages.ubuntu.com/manpages/bionic/man1/saxonb-xslt.1.html) command line tool or other means to execute XSLT scripts, or similar tools within your IDE. At the time of this writing the apt repositories for ubuntu 18.04 had the following versions:
* libsaxon-java (saxon 6.5)
* libsaxonb-java (saxon 9.x)

On windows you will require the equivalent tools or IDE to execute XSLT's



## Features
* [XSLT 2.0](https://www.w3.org/TR/xslt20/) style sheets
* compatible with Saxon-B processor
* convert source docs to archimate Docs


## Read the Docs
* To check out the upcoming feature roadmap please read [Archimate-py To Do list](./todo.md)
* Learn how to [load data](./data/README.md) to process
* learn how to execute the various XSLT scripts (below)

## Supported Datasets


## Request data
If there is a dataset you think will be useful for


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
* [saxonb-xslt]()

#### Suggested
* qXmlEdit
* XMLCopy
* Atom Text Editor with XML and XSLT plugins

#### Depricated
* [xsltproc](http://xmlsoft.org/XSLT/xsltproc.html) only runs XSLT version 1.1 and not version 2.0
* [saxon-xslt](http://manpages.ubuntu.com/manpages/bionic/man1/saxon-xslt.1.html) was compatable with saxon version 6.5.5

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
CD to where you cloned this repository:
~~~~
localhost:$ cd ./archimate-py
~~~~
CD to ./xslt directory:
~~~~
localhost:$ cd xslt
~~~~
Process XML input through XSLT using saxonb-xslt:
~~~~
localhost:$ saxon-xslt -o ../../data/output/acts-and-regs/archi-legis.xml ../../data/input/acts-and-regs/Legis.xml legis2archimate.xsl
~~~~
Preview results:
~~~~
localhost:$ less/data/output/acts-and-regs/archi-legis.xml
~~~~
