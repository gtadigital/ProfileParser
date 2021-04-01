# author: ETH Zurich, gta digital, Matteo Lorenzini
# license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/ProfileParser)
import os
import lxml.etree as ET
import argparse
#from emoji import emojize


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
        index = 0
        for item in files:
            #print(index, item)
            index += 1
            #print("Start process")
            if item.endswith(('.xml')):
                dom = ET.parse( root + "/" + item)
                xslt = ET.parse(myXslt)
                transform = ET.XSLT(xslt)
                newdom = transform(dom)
                infile = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))
                outfile = open(myOutput + item, 'wb')
                outfile.write(infile)
                print(index, item)
                #print(emojize("Process done:thumbs_up:"))
            else: 
                print("Something went wrong")
                #print(emojize("Process done:thumbs_down:"))
