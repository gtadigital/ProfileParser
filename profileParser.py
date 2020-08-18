# author: ETH Zurich, gta digital, Matteo Lorenzini
# license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/ProfileParser)

import os
import lxml.etree as ET
import argparse


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='XMLProfiles Parser')
    parser.add_argument('--sourcePath', dest="myFile",help='path of the source files')
    parser.add_argument('--targetPath', dest="myOutput", help='path of the target files' )
    parser.add_argument('--xslt', dest="myXslt", help='path of the XSLT file')

    args = parser.parse_args()
    myFile = args.myFile
    myOutput = args.myOutput
    myXslt = args.myXslt

    for root, dirs, files in os.walk(myFile):

        for item in files:
            if item.endswith(('.xml')):
                dom = ET.parse( root + "/" + item)
                xslt = ET.parse(myXslt)
                transform = ET.XSLT(xslt)
                newdom = transform(dom)
                infile = (ET.tostring(newdom, pretty_print=True))
                outfile = open(myOutput + item, 'wb')
                outfile.write(infile)
