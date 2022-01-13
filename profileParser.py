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

   
    current_dir = myOutput + "//E78/E78_" + str(0) + "//"
    index_dir = 1
    while os.path.exists(
            current_dir):
        current_dir = myOutput + "//E78/E78_" + str(index_dir) + "//"
        index_dir += 1
    os.makedirs(current_dir)
    file_list = []


    current_do_dir = myOutput + "//D1/D1_" + str(0) + "//"
    index_do_dir = 1
    while os.path.exists(
            current_do_dir):
        current_do_dir = myOutput + "//D1/D1_" + str(index_do_dir) + "//"
        index_do_dir += 1
    os.makedirs(current_do_dir)
    file_do_list = []

    totalFiles = 0
    totalDir = 0
    totalFilesOut = 0
    totalDirOut = 0
    totalFiles_do_Out = 0
    totalDir_do_Out = 0

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
    print("Hey dude, I'm processing, go for a coffee!")  

    for root, dirs, files in os.walk(myFile):
        index = 0
        
        for item in files:
            
            index += 1
            
            if item.endswith(('.xml')):
                
                dom = ET.parse( root + "/" + item)

                xslt = ET.parse(myXslt)
                transform = ET.XSLT(xslt)
                newdom = transform(dom)
                for element in newdom.iter():
                    if element.tag == 'do_system_object_id':
                    
                        do = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))
                        #add new file to file_list and check wether the size of current subdirectory would now exceed 8MB
                        file_do_list.append(do)                        
                       
                        if sum(len(f) for f in file_do_list) > 80000000:
                            
                            current_do_dir = myOutput+ "//D1/D1_"+ str(index_do_dir) + "//"

                            index_do_dir+=1
                            while os.path.exists(current_do_dir):
                                current_do_dir = myOutput+ "//D1/D1_"+ str(index_do_dir) + "//"
                                index_do_dir+=1
                            os.makedirs(current_do_dir)
                            file_do_list=[]
                            file_do_list.append(do)
                    
                        outfile = open(current_do_dir + item, 'wb')
                        outfile.write(do)
                       
                    elif element.tag == 'ao_system_object_id':
                        infile = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))
                        #add new file to file_list and check wether the size of current subdirectory would now exceed 8MB
                        
                        file_list.append(infile)
                         
                        if sum(len(f) for f in file_list) > 80000000:
                            
                            current_dir = myOutput+ "//E78/E78_"+ str(index_dir) + "//"
                            index_dir+=1
                            while os.path.exists(current_dir):
                                current_dir = myOutput+ "//E78/E78_"+ str(index_dir) + "//"
                                index_dir+=1
                            os.makedirs(current_dir)
                            file_list=[]
                            file_list.append(infile)
                
                        outfile = open(current_dir + item, 'wb')
                        outfile.write(infile)
                    
                
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

    for base, dirs, files in os.walk(myOutput + "/D1", topdown=True):
        for directories in dirs:
            totalDir_do_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_do_Out += 1
    print('Total number of D1 files processed', totalFiles_do_Out)
    print('Total Number of D1 directories created', totalDir_do_Out)
    print('Total D1:', (totalDir_do_Out + totalFiles_do_Out))