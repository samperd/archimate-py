#!/usr/bin/env bash

URL="file:///home/sampson/development/archimate-py/data/input/acts-and-regs-bulk/Consolidation_2.0.0/English/Statutes/A-1.3.xml"
UUID="eb0dee21-9123-4d0d-b11d-0763fa1fb403"
Layer="motivation"
Element="Driver"
Message="added/updated $Element Element in $Layer Layer. Updated/added element: $Element'_'$UUID.xml"
OutDir="../model/$Layer/"
FileName="${Element}_${UUID}.xml"

# read resources file
# git add run-legislation.#!/bin/sh
# git commit -m "Updated run-legislation"
# Pull new changes from the repository
# git pull
# Run XSLT
# saxon-xslt INPUTFILE XSLTFILE parametername=parametervalue > OUTPUTFILE
# saxon-xslt ../data/input/acts-and-regs/Legis.xml ../xslt/acts-and-regs/legis2archimate.xsl uuid=${UUID} outdir=${OutDir} filename=${FileName} > ../model/${Layer}/${FileName}
saxonb-xslt -ext:on $URL ../xslt/acts-and-regs/legisfull2archimate-snippet.xsl

# Add file to git
# git add ../model/$Layer/${Element}_${UUID}.xml
# commit changes to git
# git commit -m "$Message"
# Git puish
# git push
# use Archi command line to pull new model changes?