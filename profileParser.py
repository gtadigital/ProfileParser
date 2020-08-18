import os
import lxml.etree as ET

inputpath = "/Users/lomatteo/REPO/ProfileParser/Profiles/Person/source_files"
xsltfile = "/Users/lomatteo/REPO/ProfileParser/Profiles/Person/Person.xsl"
outpath = "/Users/lomatteo/REPO/ProfileParser/Profiles/Person/target_files/"

for root, dirs, files in os.walk(inputpath):

    for item in files:
        if item.endswith(('.xml')):
            dom = ET.parse( root + "/" + item)
            xslt = ET.parse(xsltfile)
            transform = ET.XSLT(xslt)
            newdom = transform(dom)
            infile = (ET.tostring(newdom, pretty_print=True))
            outfile = open(outpath + item, 'wb')
            outfile.write(infile)
