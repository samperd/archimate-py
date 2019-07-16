#!/bin/bash

#=================================================
# Name:
#   run-regspart.sh
#
# Purpose:
#  This script initiatiates an XSLT transformation. This transformation
#   accepts som paramaters and outputs an archi snippet
#
# Transformers:
#   regspart2archi-snippet
#
# Execution:
# ./run-regspart.sh
#=================================================

Layer="motivation"
Element="Driver"
Type="Regulation"
TypeShort="Reg"
# The next line is a git commit message template
Message="added/updated $Element Element in $Layer Layer. Updated/added element: $Element'_'$UUID.xml"
OutDir="../data/output/model/$Layer"
LegisDir="../data/input/acts-and-regs-bulk/Consolidation_2.0.0/English/Statutes"
RegsDir="../data/input/acts-and-regs-bulk/Consolidation_Regs_1.2.0/EN"
LegisListFile="../data/input/acts-and-regs/Legis.xml"
# File name and extension of the files (eventually to be automated through a list)
#Name="A-1.3"
#File="${Name}.xml"
#Domain URL to defaine a URL Namespace
DomainURL="canada.ca"

#OutDir="../model/$Layer/"
#Location and name of input file
#LegisFile="${LegisDir}/${File}"

# Base URL where file resides online
UrlBase="https://laws-lois.justice.gc.ca/eng"
#UrlXml="$UrlBase/XML/$File"
#UrlHtml="$UrlBase/acts/${Name}/FullText.html"

# Pre-processing clean up
rm ../data/output/model/motivation/Driver-Reg*.xml

# read resources file
# git add run-legislation.#!/bin/sh
# git commit -m "Updated run-legislation"
# Pull new changes from the repository
# git pull

#loop through files with .xml extension only
cycle=0
for File in $( ls $RegsDir | grep .xml); do
  #statements
  # Format of the --name portion of uuidgen
  UuidName="${File}@${DomainURL}"
  # Call external uuidgen command line tool to generate a predictable UUID
  UUID="$(uuidgen --sha1 --namespace @url --name ${UuidName})"
  #Location and name of input file
  RegFile="$RegsDir/$File"
  RegName=${File%.*}
  #location and name of output file
  OutFileName="${Element}_${TypeShort}_${UUID}.xml"
  UrlXml="$UrlBase/XML/$File"
  UrlHtml="$UrlBase/regulations/${RegName}/FullText.html"
  echo ---------------------
  echo UUID Name: $UuidName
  echo Source File: $RegFile
  echo Output File: $OutFileName
  echo Output Directory: $OutDir
  echo XML URL: $UrlXml
  echo HTML URL: $UrlHtml
  echo ===========================


# Run XSLT
# saxon-xslt INPUTFILE XSLTFILE parametername=parametervalue > OUTPUTFILE
# saxon-xslt ../data/input/acts-and-regs/Legis.xml ../xslt/acts-and-regs/legis2archimate.xsl uuid=${UUID} outdir=${OutDir} filename=${FileName} > ../model/${Layer}/${FileName}

# get name of source legislation

# run the standard transformation
saxonb-xslt -dtd:off -ext:on ${RegFile} ../xslt/acts-and-regs/regspart2archi-snippet.xsl uuid=$UUID outdir=$OutDir layer=$Layer element=$Element urlbase=$UrlBase urlxml=$UrlXml urlhtml=$UrlHtml type=$Type typeshort=$TypeShort

done

# Add file to git
# git add ../model/$Layer/${Element}_${UUID}.xml
# commit changes to git
# git commit -m "$Message"
# Git push
# git push
# use Archi command line to pull new model changes?
