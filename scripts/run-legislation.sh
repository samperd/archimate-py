#!/usr/bin/env bash

UUID="$(uuidgen)"
Layer="motivation"
Element="Driver"
Message="added/updated $Element Element in $Layer Layer. Updated/added element: $Element'_'$UUID.xml"
OutDir="../data/output/model/$Layer"
#OutDir="../model/$Layer/"
FileName="${Element}_${UUID}.xml"

# Pre-processing clean up
rm ../data/output/model/motivation/*.xml

# read resources file
# git add run-legislation.#!/bin/sh
# git commit -m "Updated run-legislation"
# Pull new changes from the repository
# git pull
# Run XSLT
# saxon-xslt INPUTFILE XSLTFILE parametername=parametervalue > OUTPUTFILE
# saxon-xslt ../data/input/acts-and-regs/Legis.xml ../xslt/acts-and-regs/legis2archimate.xsl uuid=${UUID} outdir=${OutDir} filename=${FileName} > ../model/${Layer}/${FileName}

saxonb-xslt -ext:on ../data/input/acts-and-regs/Legis.xml ../xslt/acts-and-regs/legis2archi.xsl uuid=$UUID outdir=$OutDir layer=$Layer element=$Element

# Add file to git
# git add ../model/$Layer/${Element}_${UUID}.xml
# commit changes to git
# git commit -m "$Message"
# Git push
# git push
# use Archi command line to pull new model changes?
