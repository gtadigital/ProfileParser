# author: ETH Zurich, gta digital, Matteo Lorenzini, Zoé Reinke
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

    #we want to store the output files in subdirectories of maximal 8MB
    #we create the first subdirectory
    current_dir = myOutput+ "//Folder"+ str(0) + "//"    #current_dir stores path of current subdirectory
    index_dir=1
    while os.path.exists(current_dir): #check if subdirectory already exists, if yes we presume it is already full and create new one
        current_dir = myOutput+ "//Folder"+ str(index_dir) + "//"
        index_dir+=1
    os.makedirs(current_dir)
    file_list= []   #in this list we will store the elements of the current subdirectory. This helps us to keep track of its current size

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

                #add new file to file_list and check wether the size of current subdirectory would now exceed 8MB
                #if yes: create new subdirectory, update current_dir variable (s.t. the new file will be added to the new subdirectory), reset file_list
                file_list.append(infile)
                if sum(len(f) for f in file_list) > 8000000:
                    current_dir = myOutput+ "//Folder"+ str(index_dir) + "//"
                    index_dir+=1
                    while os.path.exists(current_dir):
                        current_dir = myOutput+ "//Folder"+ str(index_dir) + "//"
                        index_dir+=1
                    os.makedirs(current_dir)
                    file_list=[]
                    file_list.append(infile)

                outfile = open(current_dir + item, 'wb')
                outfile.write(infile)

                
                print(("File nr:"),index, ("id:"),item,emojize("has been processed:thumbs_up:"))
            else: 
                
                print(("File nr:"),index, ("id:"),item,emojize("has not been processed:thumbs_down:"))
    print(emojize("Process ended:check_mark_button:"))
