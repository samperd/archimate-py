# To Do List for archimate-py

## MVP To Do
### General Features
* download file to temp dir
   * Consolidated acts
* XSLT library
    * build XSLT library
    * execute various XSLT's
* Build a CSV linking to acquired resources
* build an internal library format as cross walk with arhimate
* tests
* create man pages https://www.cyberciti.biz/faq/linux-unix-creating-a-manpage/

### Readers
* Validate input against schema and DTD
* one/each of the resources
    * GC Consolidated Acts / Regs
    * TBS Policies / Directives / Standards / Tools
* gitlab issues (using tags and templates)
* github issues (using tags and templates)
* archi CSV

### Writers
* Validate output against schema and DTD
* Archimate exchange format
* Archi CSV
* Git repo (to write Archimate exchange format to)
    * gitlab issues (using tags and templates)
    * github issues (using tags and templates)
    * git standard MD files
        * README
        * LICENSE
        * CONTRIBUTION/CONTRIBUTORS
    * non-Standard GIT MD files from /doc directory

### Transformers (XSLT)
* markdown to archi snippet and archimate
* Legislation list to archi snippet and archimate exchange
* Individual Legislation to archi snippet and archimate exchange
* Archi to CSV
* CSV to Archi
* Archi to archimate
* Archimate to Archimate


## Future enhancements

### General Features
* publish an archimate model for archimate-py using archi tool
* execute script from within architool plugin
* convert from Python lib to Architool plugin (java?)
* user [xQuery](https://www.w3schools.com/xml/xquery_intro.asp) to generate summary stats and details about a model

### Application Interfaces
* Interface with Archi Command Line Interface
  * create a new model from output
  * add to existing models
  * extract from existing models


### Readers
* Archimate Exchange Format
    * simple interface to select which
* GIT Repos
    * import models from other repos
    * import components of models from other repos
        * interface
        * other
* Business Process Modeling Notation (BPMN)
    * http://www.bpmn.org/
* XML Process Definition Language (XPDL)
    * https://en.wikipedia.org/wiki/XPDL
* UMLUnified Modeling Language
    * https://en.wikipedia.org/wiki/Unified_Modeling_Language
    * https://www.omg.org/
### Writers
* Architool CSV export/import format
    * https://www.archimatetool.com/downloads/Archi%20User%20Guide.pdf
* Archimate Exchange Format
    * per entity
    * full archimate output
* CSV
* Other XML formats
    * UML
    * XPDL
    *


##  Source Documents:
* Consolidated Acts:https://laws-lois.justice.gc.ca/eng/acts/
* Consolidated Acts Bulk:
* Consolidated Regulations: https://laws-lois.justice.gc.ca/eng/regulations/
* Annual Statutes: https://laws-lois.justice.gc.ca/eng/AnnualStatutes/index.html
* Statutes Repeal Reports: https://laws-lois.justice.gc.ca/eng/Reports/
* Constitutional Documents: https://laws-lois.justice.gc.ca/eng/Const/Const_index.html
* Public Statutes and Responsible Ministers: https://laws-lois.justice.gc.ca/eng/TablePublicStatutes/index.html
* Private Acts: https://laws-lois.justice.gc.ca/eng/TablePrivateActs/index.html
* index of Statutory Instruments: https://laws-lois.justice.gc.ca/eng/IndexStatutoryInstruments/
