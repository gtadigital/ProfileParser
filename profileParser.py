# author: ETH Zurich, gta digital, Matteo Lorenzini, Zoé Reinke
# license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/ProfileParser)
from importlib.resources import path
from itertools import count
import os
from re import sub
import lxml.etree as ET
import argparse
from tabulate import tabulate
from emoji import emojize
from colored import fore, back, style
import subprocess



if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='XMLProfiles Parser')
    parser.add_argument('--sourcePath', dest="myFile",help='path of the source files')
    #parser.add_argument('--targetPath', dest="myOutput", help='path of the target files' )
    parser.add_argument('--xslt', dest="myXslt", help='path of the XSLT file')

    args = parser.parse_args()
    myFile = args.myFile
    myOutput = "output"
    myXslt = args.myXslt
    
    current_dir = myOutput+ "//Entities/E78"+  "//"    #current_dir stores path of current subdirectory
    os.makedirs(current_dir)
    file_ao_list= []   #in this list we will store the elements of the current subdirectory. This helps us to keep track of its current size

    current_bw_dir = myOutput+ "//Entities/E22"+ "//"    #current_dir stores path of current subdirectory
    os.makedirs(current_bw_dir)
    file_bw_list= []
    
    current_do_dir = myOutput+ "//Entities/D1"+ "//"    #current_dir stores path of current subdirectory
   
    os.makedirs(current_do_dir)
    file_do_list= []
    
    current_pl_dir = myOutput+ "//Entities/E53"+ "//"    #current_dir stores path of current subdirectory
  
    os.makedirs(current_pl_dir)
    file_pl_list= []
    
    current_per_dir = myOutput+ "//Entities/E21"+ "//"    #current_dir stores path of current subdirectory
  
    os.makedirs(current_per_dir)
    file_per_list= []
    
    current_grp_dir = myOutput+ "//Entities/E74"+ "//"    #current_dir stores path of current subdirectory
   
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
  
    print  (fore.LIGHT_BLUE  + "### Summary of files to be processed ### " + style.RESET)
   
    print(tabulate([[fore.LIGHT_GREEN + 'Total number of files'+ style.RESET, totalFiles], [fore.LIGHT_GREEN + 'Total Number of directories'+ style.RESET, totalDir], [fore.LIGHT_GREEN + 'Total:'+ style.RESET, (totalDir + totalFiles)]], headers=[fore.LIGHT_RED+'Summary'+style.RESET, fore.LIGHT_RED+'Value'+style.RESET], tablefmt="fancy_grid"))
    
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
                
                for element in newdom.iter():
                    if element.tag == 'ao_system_object_id':
                        
                       
                        file_ao_list=[]
                        file_ao_list.append(infile)

                        outfile = open(current_dir + item, 'wb')
                        outfile.write(infile)
                                        
                    if element.tag == 'oeu_nc_uuid':
                        
                       
                        file_bw_list=[]
                        file_bw_list.append(infile)

                        outfile = open(current_bw_dir + item, 'wb')
                        outfile.write(infile)
                    
                    if element.tag == 'do_system_object_id':
                        
                       
                        file_do_list=[]
                        file_do_list.append(infile)

                        outfile = open(current_do_dir + item, 'wb')
                        outfile.write(infile)
                    
                    if element.tag == 'plIdentifier_uuid':
                        
                        
                        file_pl_list=[]
                        file_pl_list.append(infile)

                        outfile = open(current_pl_dir + item, 'wb')
                        outfile.write(infile)
                    
                    if element.tag == 'grp_system_object_id':
                        
                        
                        file_grp_list=[]
                        file_grp_list.append(infile)

                        outfile = open(current_grp_dir + item, 'wb')
                        outfile.write(infile)
                        
                    if element.tag == 'per_uuid':
                        
                        
                        file_per_list=[]
                        file_per_list.append(infile)

                        outfile = open(current_per_dir + item, 'wb')
                        outfile.write(infile)
                        
                    
                print(("id:"),item,emojize("has been processed:thumbs_up:"),end="\r")
                    
            else: 
                        
                print(("id:"),item,emojize("has not been processed:thumbs_down:"),end="\r")
    print()
            
    print(emojize("Process ended:check_mark_button:"))
    
   
    
    # Count D1 pasrsed files
    for base, dirs, files in os.walk(myOutput + "//Entities/D1", topdown=True):
        for directories in dirs:
            totalDir_do_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_do_Out += 1
   
    # Count E78 pasrsed files
    for base, dirs, files in os.walk(myOutput + "//Entities/E78", topdown=True):
        for directories in dirs:
            totalDir_ao_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_ao_Out += 1
    
    # Count E53 pasrsed files
    for base, dirs, files in os.walk(myOutput + "//Entities/E53", topdown=True):
        for directories in dirs:
            totalDir_pl_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_pl_Out += 1

    # Count E21 pasrsed files
    for base, dirs, files in os.walk(myOutput + "//Entities/E21", topdown=True):
        for directories in dirs:
            totalDir_act_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_act_Out += 1

    # Count E22 pasrsed files
    for base, dirs, files in os.walk(myOutput + "//Entities/E22", topdown=True):
        for directories in dirs:
            totalDir_bw_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_bw_Out += 1
   
    # Count E74 pasrsed files
    for base, dirs, files in os.walk(myOutput + "//Entities/E74", topdown=True):
        for directories in dirs:
            totalDir_grp_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_grp_Out += 1
   
    for base, dirs, files in os.walk(myOutput, topdown=True):
        for directories in dirs:
            totalDirOut += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFilesOut += 1
    
    
    print  (fore.LIGHT_BLUE  + "### Summary of processed files ### " + style.RESET)
    
    print(tabulate([[fore.LIGHT_GREEN+'Total'+style.RESET, totalFilesOut, totalDirOut], [fore.LIGHT_GREEN+'D1'+style.RESET, totalFiles_do_Out, totalDir_do_Out], [fore.LIGHT_GREEN+'E78'+style.RESET, totalFiles_ao_Out,totalDir_ao_Out], [fore.LIGHT_GREEN+'E53'+style.RESET, totalFiles_pl_Out, totalDir_pl_Out], [fore.LIGHT_GREEN+'E21'+style.RESET, totalFiles_act_Out, totalDir_act_Out], [fore.LIGHT_GREEN+'E22'+style.RESET, totalFiles_bw_Out, totalDir_bw_Out], [fore.LIGHT_GREEN+'E74'+style.RESET, totalFiles_grp_Out, totalDir_grp_Out]], headers=[fore.LIGHT_RED+'Type'+style.RESET, fore.LIGHT_RED+'Number of files'+style.RESET,fore.LIGHT_RED+'Number of directories'+style.RESET], tablefmt="fancy_grid"))

    for root, dirnames, filenames in os.walk("output/Entities/E53", topdown=True):
        for filename in filenames:
            #if the size of a file is greater than 8MB then print the name of the file and its path and size
            if os.path.getsize(os.path.join(root, filename)) > 8000000:
                #print(os.path.join(root, filename), os.path.getsize(os.path.join(root, filename)))
                
                url = os.path.join(root, filename)
                size = os.path.getsize(os.path.join(root, filename))
             
                print  (fore.LIGHT_RED  + "### DANGER! The following file is larger than 8MB ### " + style.RESET)
                
                print(tabulate([[fore.LIGHT_GREEN+'File'+style.RESET, url, size]], headers=[fore.LIGHT_RED+' '+style.RESET, fore.LIGHT_RED+'Path'+style.RESET,fore.LIGHT_RED+'Size(MB)'+style.RESET], tablefmt="fancy_grid"))
                
                cmd = "awk -f chunk/chunk.awk " + url
                rename = "./rename_E53.sh"
                mv = "mv *.xml output/Entities/E53"
                subprocess.call(cmd, shell=True)
                subprocess.call(rename, shell=True)
                subprocess.call(mv, shell=True)
                
    for root, dirnames, filenames in os.walk("output/Entities/D1", topdown=True):
        for filename in filenames:
            #if the size of a file is greater than 8MB then print the name of the file and its path and size
            if os.path.getsize(os.path.join(root, filename)) > 8000000:
                #print(os.path.join(root, filename), os.path.getsize(os.path.join(root, filename)))
                
                url = os.path.join(root, filename)
                size = os.path.getsize(os.path.join(root, filename))
             
                print  (fore.LIGHT_RED  + "### DANGER! The following file is larger than 8MB ### " + style.RESET)
                
                print(tabulate([[fore.LIGHT_GREEN+'File'+style.RESET, url, size]], headers=[fore.LIGHT_RED+' '+style.RESET, fore.LIGHT_RED+'Path'+style.RESET,fore.LIGHT_RED+'Size(MB)'+style.RESET], tablefmt="fancy_grid"))
                
                cmd = "awk -f chunk/chunk.awk " + url
                rename = "./rename_D1.sh"
                mv = "mv *.xml output/Entities/D1"
                subprocess.call(cmd, shell=True)
                subprocess.call(rename, shell=True)
                subprocess.call(mv, shell=True)
                
    for root, dirnames, filenames in os.walk("output/Entities/E21", topdown=True):
        for filename in filenames:
            #if the size of a file is greater than 8MB then print the name of the file and its path and size
            if os.path.getsize(os.path.join(root, filename)) > 8000000:
                #print(os.path.join(root, filename), os.path.getsize(os.path.join(root, filename)))
                
                url = os.path.join(root, filename)
                size = os.path.getsize(os.path.join(root, filename))
             
                print  (fore.LIGHT_RED  + "### DANGER! The following file is larger than 8MB ### " + style.RESET)
                
                print(tabulate([[fore.LIGHT_GREEN+'File'+style.RESET, url, size]], headers=[fore.LIGHT_RED+' '+style.RESET, fore.LIGHT_RED+'Path'+style.RESET,fore.LIGHT_RED+'Size(MB)'+style.RESET], tablefmt="fancy_grid"))
                
                cmd = "awk -f chunk/chunk.awk " + url
                rename = "./rename_E21.sh"
                mv = "mv *.xml output/Entities/E21"
                subprocess.call(cmd, shell=True)
                subprocess.call(rename, shell=True)
                subprocess.call(mv, shell=True)
    
    for root, dirnames, filenames in os.walk("output/Entities/E22", topdown=True):
        for filename in filenames:
            #if the size of a file is greater than 8MB then print the name of the file and its path and size
            if os.path.getsize(os.path.join(root, filename)) > 8000000:
                #print(os.path.join(root, filename), os.path.getsize(os.path.join(root, filename)))
                
                url = os.path.join(root, filename)
                size = os.path.getsize(os.path.join(root, filename))
             
                print  (fore.LIGHT_RED  + "### DANGER! The following file is larger than 8MB ### " + style.RESET)
                
                print(tabulate([[fore.LIGHT_GREEN+'File'+style.RESET, url, size]], headers=[fore.LIGHT_RED+' '+style.RESET, fore.LIGHT_RED+'Path'+style.RESET,fore.LIGHT_RED+'Size(MB)'+style.RESET], tablefmt="fancy_grid"))
                
                cmd = "awk -f chunk/chunk.awk " + url
                rename = "./rename_E22.sh"
                mv = "mv *.xml output/Entities/E22"
                subprocess.call(cmd, shell=True)
                subprocess.call(rename, shell=True)
                subprocess.call(mv, shell=True)
    
    for root, dirnames, filenames in os.walk("output/Entities/E74", topdown=True):
        for filename in filenames:
            #if the size of a file is greater than 8MB then print the name of the file and its path and size
            if os.path.getsize(os.path.join(root, filename)) > 8000000:
                #print(os.path.join(root, filename), os.path.getsize(os.path.join(root, filename)))
                
                url = os.path.join(root, filename)
                size = os.path.getsize(os.path.join(root, filename))
             
                print  (fore.LIGHT_RED  + "### DANGER! The following file is larger than 8MB ### " + style.RESET)
                
                print(tabulate([[fore.LIGHT_GREEN+'File'+style.RESET, url, size]], headers=[fore.LIGHT_RED+' '+style.RESET, fore.LIGHT_RED+'Path'+style.RESET,fore.LIGHT_RED+'Size(MB)'+style.RESET], tablefmt="fancy_grid"))
                
                cmd = "awk -f chunk/chunk.awk " + url
                rename = "./rename_E74.sh"
                mv = "mv *.xml output/Entities/E74"
                subprocess.call(cmd, shell=True)
                subprocess.call(rename, shell=True)
                subprocess.call(mv, shell=True)
                
    for root, dirnames, filenames in os.walk("output/Entities/E78", topdown=True):
        for filename in filenames:
            #if the size of a file is greater than 8MB then print the name of the file and its path and size
            if os.path.getsize(os.path.join(root, filename)) > 8000000:
                #print(os.path.join(root, filename), os.path.getsize(os.path.join(root, filename)))
                
                url = os.path.join(root, filename)
                size = os.path.getsize(os.path.join(root, filename))
             
                print  (fore.LIGHT_RED  + "### DANGER! The following file is larger than 8MB ### " + style.RESET)
                
                print(tabulate([[fore.LIGHT_GREEN+'File'+style.RESET, url, size]], headers=[fore.LIGHT_RED+' '+style.RESET, fore.LIGHT_RED+'Path'+style.RESET,fore.LIGHT_RED+'Size(MB)'+style.RESET], tablefmt="fancy_grid"))
                
                cmd = "awk -f chunk/chunk.awk " + url
                rename = "./rename_E78.sh"
                mv = "mv *.xml output/Entities/E78"
                subprocess.call(cmd, shell=True)
                subprocess.call(rename, shell=True)
                subprocess.call(mv, shell=True)
                
    print  (fore.LIGHT_GREEN  + "### Files are ready to be batched run the file batcher.py ### " + style.RESET)