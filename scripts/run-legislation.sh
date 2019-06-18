#!/usr/bin/env bash

UUID="eb0dee21-9123-4d0d-b11d-0763fa1fb403"
Layer="motivation"
Element="Driver"
Message="added/updated $Element Element in $Layer Layer. Updated/added element: $Element"_"$UUID.xml"

# read resources file
# Run XSLT
saxon-xslt ../data/input/acts-and-regs/Legis.xml ../xslt/acts-and-regs/legis2archimate.xsl > ../model/$Layer/$Element"_"$UUID".xml"
# commit changes to git
git commit -m $Message
