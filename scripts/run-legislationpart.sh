#!/bin/bash

#=================================================
# Name:
#   run-legislationpart.sh
#
# Purpose:
#  This script initiatiates an XSLT transformation. This transformation
#   accepts some paramaters and outputs an archi snippet
#
# Transformers:
#   legispart2archi-snippet.xsl
#
# Execution:
# ./run-legislationpart.sh
#=================================================

#=================
#    Constants
#=================
Layer="motivation"
Element="Driver"
Type="Legislation"
TypeShort="Legis"
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
rm ../data/output/model/motivation/Driver-Legis*.xml

# read resources file
# git add run-legislation.#!/bin/sh
# git commit -m "Updated run-legislation"
# Pull new changes from the repository
# git pull

#loop through files with .xml extension only
cycle=0
for File in $( ls $LegisDir | grep .xml); do
  #statements
  # Format of the --name portion of uuidgen
  UuidName="${File}@${DomainURL}"
  # Call external uuidgen command line tool to generate a predictable UUID
  UUID="$(uuidgen --sha1 --namespace @url --name ${UuidName})"
  #Location and name of input file
  LegisFile="$LegisDir/$File"
  LegisName=${File%.*}
  #location and name of output file
  OutFileName="${Element}_${TypeShort}_${UUID}.xml"
  UrlXml="$UrlBase/XML/$File"
  UrlHtml="$UrlBase/acts/${LegisName}/FullText.html"
  echo ---------------------
  echo UUID Name: $UuidName
  echo Source File: $LegisFile
  echo Ootput File: $OutFileName
  echo XML URL: $UrlXml
  echo HTML URL: $UrlHtml
  echo ===========================


# Run XSLT
# saxon-xslt INPUTFILE XSLTFILE parametername=parametervalue > OUTPUTFILE
# saxon-xslt ../data/input/acts-and-regs/Legis.xml ../xslt/acts-and-regs/legis2archimate.xsl uuid=${UUID} outdir=${OutDir} filename=${FileName} > ../model/${Layer}/${FileName}

# run the standard transformation
saxonb-xslt -dtd:off -ext:on ${LegisFile} ../xslt/acts-and-regs/legispart2archi-snippet.xsl uuid=$UUID outdir=$OutDir layer=$Layer element=$Element urlbase=$UrlBase urlxml=$UrlXml urlhtml=$UrlHtml

# Get source filename, path and UUID to add as ref in regulation element
# $OutFileName
# $UUID

# grab the unique ID of the legislation by getting the base of the FileName
# already captured in variable ${LegisName}
# Open up Legis.xml file (see acts-and-regs directory)
  # find section for
  # grab list of regulations
  # then, cut the quoted text from the rest of the string
  # then, cut the qhuoted text to remove the quotes
RegList="$(xmllint --xpath "/ActsRegsList/Acts/Act/Language[text() = 'eng']/../UniqueId[text() = '${LegisName}']/../RegsMadeUnderAct/Reg/@idRef" ../data/input/acts-and-regs/Legis.xml | cut -d "=" -f 2 - | cut -d '"' -f 2)"
for RegRef in ${RegList} ; do
  #if [ $reg == "XPath set is empty" ]; then
  if [ $? -ne 0 ]; then
    RegRef="NONE"
    echo "RegulationRef: ${RegRef}"

  else
  # for each regulation look up its UniqueId
  RegId="$(xmllint --xpath "/ActsRegsList/Regulations/Regulation[@id = ${RegRef}]/UniqueId/text()" ../data/input/acts-and-regs/Legis.xml)"
  echo "RegulationRef: ${RegRef}"
  echo "RegulationID: ${RegId// /_}"
  echo "Reg File: ${RegsDir}/${RegId// /_}.xml"
fi
done
  # for each regulation look up its UniqueId
# xmllint --xpath "/ActsRegsList/Regulations/Regulation[@id = '638933E']/UniqueId/text()" ../data/input/acts-and-regs/Legis.xml
  # transform each appropriate regulation


# xmllint ${LegisFile}
# pull out details of regulations for each act


done

# Add file to git
# git add ../model/$Layer/${Element}_${UUID}.xml
# commit changes to git
# git commit -m "$Message"
# Git push
# git push
# use Archi command line to pull new model changes?
