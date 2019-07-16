#!/bin/bash

Layer="motivation"
Element="Driver"
# The next line is a git commit message template
Message="added/updated $Element Element in $Layer Layer. Updated/added element: $Element'_'$UUID.xml"
OutDir="../data/output/model/$Layer"
SourceDir="../data/input/acts-and-regs-bulk/Consolidation_2.0.0/English/Statutes"
# File name and extension of the files (eventually to be automated through a list)
#Name="A-1.3"
#File="${Name}.xml"
#Domain URL to defaine a URL Namespace
DomainURL="canada.ca"



#OutDir="../model/$Layer/"
#Location and name of input file
#InFile="${SourceDir}/${File}"


# Base URL where file resides online
UrlBase="https://laws-lois.justice.gc.ca/eng"
#UrlXml="$UrlBase/XML/$File"
#UrlHtml="$UrlBase/acts/${Name}/FullText.html"

#loop through files with .xml extension only
cycle=0
for File in $( ls $SourceDir | grep .xml); do



  #statements
  # Format of the --name portion of uuidgen
  UuidName="${File}@${DomainURL}"
  # Call external uuidgen command line tool to generate a predictable UUID
  UUID="$(uuidgen --sha1 --namespace @url --name ${UuidName})"
  #Location and name of input file
  InFile="$SourceDir/$File"
  LegisName=${File%.*}
  #location and name of output file
  OutFileName="${Element}_${UUID}.xml"
  UrlXml="$UrlBase/XML/$File"
  UrlHtml="$UrlBase/acts/${LegisName}/FullText.html"
  echo ---------------------
  echo UUID Name: $UuidName
  echo Source File: $InFile
  echo OUtput File: $OutFileName
  echo XML URL: $UrlXml
  echo HTML URL: $UrlHtml
  echo ===========================

# read resources file
# git add run-legislation.#!/bin/sh
# git commit -m "Updated run-legislation"
# Pull new changes from the repository
# git pull
# Run XSLT
# saxon-xslt INPUTFILE XSLTFILE parametername=parametervalue > OUTPUTFILE
# saxon-xslt ../data/input/acts-and-regs/Legis.xml ../xslt/acts-and-regs/legis2archimate.xsl uuid=${UUID} outdir=${OutDir} filename=${FileName} > ../model/${Layer}/${FileName}


saxonb-xslt -dtd:off -ext:on ${InFile} ../xslt/acts-and-regs/legispart2archi-snippet.xsl uuid=$UUID outdir=$OutDir layer=$Layer element=$Element urlbase=$UrlBase urlxml=$UrlXml urlhtml=$UrlHtml

# Add file to git
# git add ../model/$Layer/${Element}_${UUID}.xml
# commit changes to git
# git commit -m "$Message"
# Git push
# git push
# use Archi command line to pull new model changes?

done
