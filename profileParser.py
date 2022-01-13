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

   # Definition of E78 folder path
    current_dir = myOutput + "//E78/E78_" + str(0) + "//"
    index_dir = 1
    while os.path.exists(
            current_dir):
        current_dir = myOutput + "//E78/E78_" + str(index_dir) + "//"
        index_dir += 1
    os.makedirs(current_dir)
    file_list = []

    # Definition of D1 folder path
    current_do_dir = myOutput + "//D1/D1_" + str(0) + "//"
    index_do_dir = 1
    while os.path.exists(
            current_do_dir):
        current_do_dir = myOutput + "//D1/D1_" + str(index_do_dir) + "//"
        index_do_dir += 1
    os.makedirs(current_do_dir)
    file_do_list = []
    # Definition of E53 folder path
    current_pl_dir = myOutput + "//E53/E53_" + str(0) + "//"
    index_pl_dir = 1
    while os.path.exists(
            current_pl_dir):
        current_pl_dir = myOutput + "//E53/E53_" + str(index_do_dir) + "//"
        index_pl_dir += 1
    os.makedirs(current_pl_dir)
    file_pl_list = []
    # Definition of E21 folder path
    current_act_dir = myOutput + "//E21/E21_" + str(0) + "//"
    index_act_dir = 1
    while os.path.exists(
            current_act_dir):
        current_act_dir = myOutput + "//E21/E21_" + str(index_act_dir) + "//"
        index_act_dir += 1
    os.makedirs(current_act_dir)
    file_act_list = []
    # Definition of E22 folder path
    current_bw_dir = myOutput + "//E22/E22_" + str(0) + "//"
    index_bw_dir = 1
    while os.path.exists(
            current_bw_dir):
        current_bw_dir = myOutput + "//E22/E22_" + str(index_bw_dir) + "//"
        index_bw_dir += 1
    os.makedirs(current_bw_dir)
    file_bw_list = []
    # Definition of E74 folder path
    current_grp_dir = myOutput + "//E74/E74_" + str(0) + "//"
    index_grp_dir = 1
    while os.path.exists(
            current_grp_dir):
        current_grp_dir = myOutput + "//E74/E74_" + str(index_grp_dir) + "//"
        index_grp_dir += 1
    os.makedirs(current_grp_dir)
    file_grp_list = []

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
        index = 0
        
        for item in files:
            
            index += 1
            
            if item.endswith(('.xml')):
                
                dom = ET.parse( root + "/" + item)

                xslt = ET.parse(myXslt)
                transform = ET.XSLT(xslt)
                newdom = transform(dom)
                for element in newdom.iter():
                    #Parsing E78 files
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
                    #Parsing E78 files
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
                    #Parsing E53 files
                    elif element.tag == 'plIdentifier_uuid':
                        pl = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))
                        #add new file to file_list and check wether the size of current subdirectory would now exceed 8MB
                        
                        file_pl_list.append(pl)
                         
                        if sum(len(f) for f in file_pl_list) > 80000000:
                            
                            current_pl_dir = myOutput+ "//E53/E53_"+ str(index_pl_dir) + "//"
                            index_dir+=1
                            while os.path.exists(current_pl_dir):
                                current_pl_dir = myOutput+ "//E53/E53_"+ str(index_pl_dir) + "//"
                                index_pl_dir+=1
                            os.makedirs(current_pl_dir)
                            file_pl_list=[]
                            file_pl_list.append(pl)
                
                        outfile = open(current_pl_dir + item, 'wb')
                        outfile.write(pl)
                    #Parsing E21 files 
                    elif element.tag == 'per_uuid':
                        act = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))
                        #add new file to file_list and check wether the size of current subdirectory would now exceed 8MB
                        
                        file_act_list.append(act)
                         
                        if sum(len(f) for f in file_act_list) > 80000000:
                            
                            current_act_dir = myOutput+ "//E21/E21_"+ str(index_act_dir) + "//"
                            index_dir+=1
                            while os.path.exists(current_act_dir):
                                current_act_dir = myOutput+ "//E21/E21_"+ str(index_act_dir) + "//"
                                index_act_dir+=1
                            os.makedirs(current_act_dir)
                            file_act_list=[]
                            file_act_list.append(act)
                
                        outfile = open(current_act_dir + item, 'wb')
                        outfile.write(act)
                    #Parsing E22 files 
                    elif element.tag == 'oeu_nc_uuid':
                        bw = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))
                        #add new file to file_list and check wether the size of current subdirectory would now exceed 8MB
                        
                        file_bw_list.append(bw)
                         
                        if sum(len(f) for f in file_bw_list) > 80000000:
                            
                            current_bw_dir = myOutput+ "//E22/E22_"+ str(index_bw_dir) + "//"
                            index_dir+=1
                            while os.path.exists(current_act_dir):
                                current_bw_dir = myOutput+ "//E22/E22_"+ str(index_bw_dir) + "//"
                                index_bw_dir+=1
                            os.makedirs(current_bw_dir)
                            file_bw_list=[]
                            file_bw_list.append(bw)
                
                        outfile = open(current_bw_dir + item, 'wb')
                        outfile.write(bw)
                    #Parsing E74 files 
                    elif element.tag == 'grp_system_object_id':
                        grp = (ET.tostring(newdom, pretty_print=True, encoding='utf-8'))
                        #add new file to file_list and check wether the size of current subdirectory would now exceed 8MB
                        
                        file_grp_list.append(grp)
                         
                        if sum(len(f) for f in file_grp_list) > 80000000:
                            
                            current_grp_dir = myOutput+ "//E74/E74_"+ str(index_grp_dir) + "//"
                            index_grp_dir+=1
                            while os.path.exists(current_grp_dir):
                                current_grp_dir = myOutput+ "//E74/E74_"+ str(index_grp_dir) + "//"
                                index_grp_dir+=1
                            os.makedirs(current_grp_dir)
                            file_grp_list=[]
                            file_grp_list.append(grp)
                
                        outfile = open(current_grp_dir + item, 'wb')
                        outfile.write(grp)
                    
                
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