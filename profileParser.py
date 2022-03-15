# author: ETH Zurich, gta digital, Matteo Lorenzini, Zoé Reinke
# license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/ProfileParser)
from importlib.resources import path
from itertools import count
import os
import lxml.etree as ET
import argparse
import shutil
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

   
    current_dir = myOutput+ "//E78/E78_"+  "//"    #current_dir stores path of current subdirectory
    index_dir=0
    while os.path.exists(current_dir): #check if subdirectory already exists, if yes we presume it is already full and create new one
        current_dir = myOutput+ "//E78/E78_"+  "//"
        index_dir+=1
    os.makedirs(current_dir)
    file_ao_list= []   #in this list we will store the elements of the current subdirectory. This helps us to keep track of its current size

    current_bw_dir = myOutput+ "//E22/E22_"+ "//"    #current_dir stores path of current subdirectory
    index_bw_dir=0
    while os.path.exists(current_bw_dir): #check if subdirectory already exists, if yes we presume it is already full and create new one
        current_bw_dir = myOutput+ "//E22/E22_"+ "//"
        index_bw_dir+=1
    os.makedirs(current_bw_dir)
    file_bw_list= []
    
    current_do_dir = myOutput+ "//D1/D1_"+ "//"    #current_dir stores path of current subdirectory
    index_do_dir=0
    while os.path.exists(current_do_dir): #check if subdirectory already exists, if yes we presume it is already full and create new one
        current_do_dir = myOutput+ "//D1/D1_"+ "//"
        index_do_dir+=1
    os.makedirs(current_do_dir)
    file_do_list= []
    
    current_pl_dir = myOutput+ "//E53/E53_"+ "//"    #current_dir stores path of current subdirectory
    index_pl_dir=0
    while os.path.exists(current_pl_dir): #check if subdirectory already exists, if yes we presume it is already full and create new one
        current_pl_dir = myOutput+ "//E53/E53_"+ "//"
        index_pl_dir+=1
    os.makedirs(current_pl_dir)
    file_pl_list= []
    
    current_per_dir = myOutput+ "//E21/E21_"+ "//"    #current_dir stores path of current subdirectory
    index_per_dir=0
    while os.path.exists(current_per_dir): #check if subdirectory already exists, if yes we presume it is already full and create new one
        current_per_dir = myOutput+ "//E21/E21_"+ "//"
        index_per_dir+=1
    os.makedirs(current_per_dir)
    file_per_list= []
    
    current_grp_dir = myOutput+ "//E74/E74_"+ "//"    #current_dir stores path of current subdirectory
    index_grp_dir=0
    while os.path.exists(current_grp_dir): #check if subdirectory already exists, if yes we presume it is already full and create new one
        current_grp_dir = myOutput+ "//E74/E74_"+ "//"
        index_grp_dir+=1
    os.makedirs(current_grp_dir)
    file_grp_list= []
    
    totalFiles = 0
    totalDir = 0
    totalFilesOut = 0
    totalDirOut = 0
    totalFiles_do_Out = 0
    totalDir_do_Out = 0
    totalFiles_ao_Out = 0
    totalDir_ao_Out = 0
    totalFiles_pl_Out = 0
    totalDir_pl_Out = 0
    totalFiles_bw_Out = 0
    totalDir_bw_Out = 0
    totalFiles_grp_Out = 0
    totalDir_grp_Out = 0
    totalFiles_act_Out = 0
    totalDir_act_Out = 0

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
    
        for item in files:
              
            if item.endswith(('.xml')):
                dom = ET.parse( root + "/" + item)
                xslt = ET.parse(myXslt)
                transform = ET.XSLT(xslt)
                newdom = transform(dom)
                infile = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))
                file_ao_list.append(infile)
                file_bw_list.append(infile)
                file_do_list.append(infile)
                file_pl_list.append(infile)
                file_per_list.append(infile)
                file_grp_list.append(infile)
                for element in newdom.iter():
                    if element.tag == 'ao_system_object_id':
                        
                        if sum(len(f) for f in file_ao_list) > 8000000:
                           
                            current_dir = myOutput+ "//E78/E78_"+ str(index_dir) + "//"
                            index_dir+=1
                            while os.path.exists(current_dir):
                                current_dir = myOutput+ "//E78/E78_"+ str(index_dir) + "//"
                                index_dir+=1
                            os.makedirs(current_dir)
                            file_ao_list=[]
                            file_ao_list.append(infile)

                        outfile = open(current_dir + item, 'wb')
                        outfile.write(infile)
                                        
                    if element.tag == 'oeu_nc_uuid':
                        
                        if sum(len(f) for f in file_bw_list) > 8000000:
                            
                            current_bw_dir = myOutput+ "//E22/E22_"+ str(index_bw_dir) + "//"
                            index_bw_dir+=1
                            while os.path.exists(current_bw_dir):
                                current_bw_dir = myOutput+ "//E22/E22_"+ str(index_bw_dir) + "//"
                                index_bw_dir+=1
                            os.makedirs(current_bw_dir)
                            file_bw_list=[]
                            file_bw_list.append(infile)

                        outfile = open(current_bw_dir + item, 'wb')
                        outfile.write(infile)
                    
                    if element.tag == 'do_system_object_id':
                        
                        if sum(len(f) for f in file_do_list) > 8000000:
                            
                            current_do_dir = myOutput+ "//D1/D1_"+ str(index_do_dir) + "//"
                            index_do_dir+=1
                            while os.path.exists(current_do_dir):
                                current_do_dir = myOutput+ "//D1/D1_"+ str(index_do_dir) + "//"
                                index_do_dir+=1
                            os.makedirs(current_do_dir)
                            file_do_list=[]
                            file_do_list.append(infile)

                        outfile = open(current_do_dir + item, 'wb')
                        outfile.write(infile)
                    
                    if element.tag == 'plIdentifier_uuid':
                        
                        if sum(len(f) for f in file_pl_list) > 8000000:
                            
                            current_pl_dir = myOutput+ "//E53/E53_"+ str(index_pl_dir) + "//"
                            index_pl_dir+=1
                            while os.path.exists(current_pl_dir):
                                current_pl_dir = myOutput+ "//E53/E53_"+ str(index_pl_dir) + "//"
                                index_pl_dir+=1
                            os.makedirs(current_pl_dir)
                            file_pl_list=[]
                            file_pl_list.append(infile)

                        outfile = open(current_pl_dir + item, 'wb')
                        outfile.write(infile)
                    
                    if element.tag == 'grp_system_object_id':
                        
                        if sum(len(f) for f in file_grp_list) > 8000000:
                            
                            current_grp_dir = myOutput+ "//E74/E74_"+ str(index_grp_dir) + "//"
                            index_grp_dir+=1
                            while os.path.exists(current_grp_dir):
                                current_grp_dir = myOutput+ "//E74/E74_"+ str(index_grp_dir) + "//"
                                index_grp_dir+=1
                            os.makedirs(current_grp_dir)
                            file_grp_list=[]
                            file_grp_list.append(infile)

                        outfile = open(current_grp_dir + item, 'wb')
                        outfile.write(infile)
                        
                    if element.tag == 'per_uuid':
                        
                        if sum(len(f) for f in file_per_list) > 8000000:
                            
                            current_per_dir = myOutput+ "//E21/E21_"+ str(index_per_dir) + "//"
                            index_per_dir+=1
                            while os.path.exists(current_per_dir):
                                current_per_dir = myOutput+ "//E21/E21_"+ str(index_per_dir) + "//"
                                index_per_dir+=1
                            os.makedirs(current_per_dir)
                            file_per_list=[]
                            file_per_list.append(infile)

                        outfile = open(current_per_dir + item, 'wb')
                        outfile.write(infile)
                        
                    
                print(("id:"),item,emojize("has been processed:thumbs_up:"))
            else: 
                
                print(("id:"),item,emojize("has not been processed:thumbs_down:"))
            
    print(emojize("Process ended:check_mark_button:"))
    
  
    # Count total pasrsed files
    for base, dirs, files in os.walk(myOutput, topdown=True):
        for directories in dirs:
            totalDirOut += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFilesOut += 1
    print('Total number of files processed', totalFilesOut)
    print('Total Number of directories created', totalDirOut)
    print('Total:', (totalDirOut + totalFilesOut))
    # Count D1 pasrsed files
    for base, dirs, files in os.walk(myOutput + "/D1", topdown=True):
        for directories in dirs:
            totalDir_do_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_do_Out += 1
    print('Total number of D1 files processed', totalFiles_do_Out)
    print('Total Number of D1 directories created', totalDir_do_Out)
    print('Total D1:', (totalDir_do_Out + totalFiles_do_Out))
    # Count E78 pasrsed files
    for base, dirs, files in os.walk(myOutput + "/E78", topdown=True):
        for directories in dirs:
            totalDir_ao_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_ao_Out += 1
    print('Total number of E78 files processed', totalFiles_ao_Out)
    print('Total Number of E78 directories created', totalDir_ao_Out)
    print('Total E78:', (totalDir_ao_Out + totalFiles_ao_Out))
    # Count E53 pasrsed files
    for base, dirs, files in os.walk(myOutput + "/E53", topdown=True):
        for directories in dirs:
            totalDir_pl_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_pl_Out += 1
    print('Total number of E53 files processed', totalFiles_pl_Out)
    print('Total Number of E53 directories created', totalDir_pl_Out)
    print('Total E53:', (totalDir_pl_Out + totalFiles_pl_Out))
    # Count E21 pasrsed files
    for base, dirs, files in os.walk(myOutput + "/E21", topdown=True):
        for directories in dirs:
            totalDir_act_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_act_Out += 1
    print('Total number of E21 files processed', totalFiles_act_Out)
    print('Total Number of E21 directories created', totalDir_act_Out)
    print('Total E21:', (totalDir_act_Out + totalFiles_act_Out))
    # Count E22 pasrsed files
    for base, dirs, files in os.walk(myOutput + "/E22", topdown=True):
        for directories in dirs:
            totalDir_bw_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_bw_Out += 1
    print('Total number of E22 files processed', totalFiles_bw_Out)
    print('Total Number of E22 directories created', totalDir_bw_Out)
    print('Total E22:', (totalDir_bw_Out + totalFiles_bw_Out))
    # Count E74 pasrsed files
    for base, dirs, files in os.walk(myOutput + "/E74", topdown=True):
        for directories in dirs:
            totalDir_grp_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_grp_Out += 1
    print('Total number of E74 files processed', totalFiles_grp_Out)
    print('Total Number of E74 directories created', totalDir_grp_Out)
    print('Total E74:', (totalDir_grp_Out + totalFiles_grp_Out))
    for base, dirs, files in os.walk(myOutput, topdown=True):
        for directories in dirs:
            totalDirOut += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFilesOut += 1
    print('Total number of files processed', totalFilesOut)
    print('Total Number of directories created', totalDirOut)
    print('Total:', (totalDirOut + totalFilesOut))
    