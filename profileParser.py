# author: ETH Zurich, gta digital, Matteo Lorenzini, Zoé Reinke
# license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/ProfileParser)
import argparse
import os

import lxml.etree as ET
from emoji import emojize

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='XMLProfiles Parser')
    parser.add_argument('--sourcePath', dest="myFile", help='path of the source files')
    parser.add_argument('--targetPath', dest="myOutput", help='path of the target files')
    parser.add_argument('--xslt', dest="myXslt", help='path of the XSLT file')

    args = parser.parse_args()
    myFile = args.myFile
    myOutput = args.myOutput
    myXslt = args.myXslt

    import time, sys


    def update_progress(job_title, progress):
        length = 20
        block = int(round(length * progress))
        msg = "\r{0}: [{1}] {2}%".format(job_title, "#" * block + "-" * (length - block), round(progress * 100, 2))
        if progress >= 1: msg += " DONE\r\n"
        sys.stdout.write(msg)
        sys.stdout.flush()


    current_dir = myOutput + "//Folder" + str(0) + "//"
    index_dir = 1
    while os.path.exists(
            current_dir):
        current_dir = myOutput + "//Folder" + str(index_dir) + "//"
        index_dir += 1
    os.makedirs(current_dir)
    file_list = []

    totalFiles = 0
    totalDir = 0
    totalFilesOut = 0
    totalDirOut = 0

    for base, dirs, files in os.walk(myFile):
        # print('Searching in : ',base)

        for directories in dirs:
            totalDir += 1
        for Files in files:
            totalFiles += 1

    print('Total number of files', totalFiles)
    print('Total Number of directories', totalDir)
    print('Total:', (totalDir + totalFiles))
    print(emojize("Process started:rocket:"))

    for i in range(totalFiles):
        time.sleep(0.1)
        update_progress("Processing", i / 100.0)

    for root, dirs, files in os.walk(myFile):

        for item in files:

            # index += 1

            if item.endswith('.xml'):
                dom = ET.parse(root + "/" + item)
                xslt = ET.parse(myXslt)
                transform = ET.XSLT(xslt)
                newdom = transform(dom)
                result = len(newdom.xpath(".//entry"))
                #print(newdom)
                infile = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))

                file_list.append(infile)
                if sum(len(f) for f in file_list) > 8000000:
                    current_dir = myOutput + "//Folder" + str(index_dir) + "//"
                    index_dir += 1
                    while os.path.exists(current_dir):
                        current_dir = myOutput + "//Folder" + str(index_dir) + "//"
                        index_dir += 1
                    os.makedirs(current_dir)
                    file_list = [infile]

                outfile = open(current_dir + item, 'wb')
                outfile.write(infile)
    update_progress("Processing", 1)
    print(emojize("Process ended:check_mark_button:"))
    for base, dirs, files in os.walk(myOutput, topdown=True):
        for directories in dirs:
            totalDirOut += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFilesOut += 1

    print('Total number of files processed', totalFilesOut)
    print('Total Number of directories created', totalDirOut)
    print('Total:', (totalDirOut + totalFilesOut))
