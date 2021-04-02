# author: ETH Zurich, gta digital, Matteo Lorenzini
# license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/ProfileParser)
import os
import lxml.etree as ET
import argparse
from emoji import emojize

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='XMLProfiles Parser')
    parser.add_argument('--sourcePath', dest="myFile",help='path of the source files')
    parser.add_argument('--targetPath', dest="myOutput", help='path of the target files' )
    parser.add_argument('--xslt', dest="myXslt", help='path of the XSLT file')

    args = parser.parse_args()
    myFile = args.myFile
    myOutput = args.myOutput
    myXslt = args.myXslt
    print(emojize("Process started:rocket:"))
    for root, dirs, files in os.walk(myFile):
        index = 0
        
        for item in files:
            
            index += 1
            
            if item.endswith(('.xml')):
                dom = ET.parse( root + "/" + item)
                xslt = ET.parse(myXslt)
                transform = ET.XSLT(xslt)
                newdom = transform(dom)
                infile = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))
                outfile = open(myOutput + item, 'wb')
                outfile.write(infile)
                #print(index, item)
                print(("File nr:"),index, ("id:"),item,emojize("has been processed:thumbs_up:"))
            else: 
                #print("Something went wrong")
                print(("File nr:"),index, ("id:"),item,emojize("has not been processed:thumbs_down:"))
    print(emojize("Process ended:check_mark_button:"))