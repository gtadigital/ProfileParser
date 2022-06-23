import os
import argparse
from colored import fore, back, style
from tabulate import tabulate

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='XMLProfiles Parser')
  
    parser.add_argument('--batchPath', dest="myBatchPath", help='Path where the files that will compose the batch are located' )
    #parser.add_argument('--xslt', dest="myXslt", help='path of the XSLT file')
    args = parser.parse_args()
    myBatchPath = args.myBatchPath
    asps = []
    index_dir=0
    
    
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
    
    
    
    for root, dirs, files in os.walk(myBatchPath):
        for file in files:
            
            asps.append(file)
            
            #if the sum of the size of the files is greater than 8MB 
            if sum(os.path.getsize(os.path.join(root, name)) for name in files) > 8000000:
                #create batches of files with the same size of 8MB
                batch = []
                for name in files:
                    batch.append(name)
                    if sum(os.path.getsize(os.path.join(root, name)) for name in batch) > 8000000:
                        #create a new folder progressively
                        index_dir+=1
                        os.mkdir(os.path.join(root, "batch_A" +  str(index_dir)))
                        #move the files to the new folder
                        for name in batch:
                            os.rename(os.path.join(root, name), os.path.join(root, "batch_A" + str(index_dir), name))
                        #clear the batch
                        batch = []
                        
                #else move all .xml files in directory batch_B
                else:
                    os.mkdir(os.path.join(root, "batch_B"))
                    #move the files to the new folder
                    for name in batch:
                        os.rename(os.path.join(root, name), os.path.join(root, "batch_B", name))
            
                     
            break
            
    
    # Count D1 pasrsed files
    for base, dirs, files in os.walk(myBatchPath + "//Entities/D1", topdown=True):
        for directories in dirs:
            totalDir_do_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_do_Out += 1
   
    # Count E78 pasrsed files
    for base, dirs, files in os.walk(myBatchPath + "//Entities/E78", topdown=True):
        for directories in dirs:
            totalDir_ao_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_ao_Out += 1
    
    # Count E53 pasrsed files
    for base, dirs, files in os.walk(myBatchPath + "//Entities/E53", topdown=True):
        for directories in dirs:
            totalDir_pl_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_pl_Out += 1

    # Count E21 pasrsed files
    for base, dirs, files in os.walk(myBatchPath + "//Entities/E21", topdown=True):
        for directories in dirs:
            totalDir_act_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_act_Out += 1

    # Count E22 pasrsed files
    for base, dirs, files in os.walk(myBatchPath + "//Entities/E22", topdown=True):
        for directories in dirs:
            totalDir_bw_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_bw_Out += 1
   
    # Count E74 pasrsed files
    for base, dirs, files in os.walk(myBatchPath + "//Entities/E74", topdown=True):
        for directories in dirs:
            totalDir_grp_Out += 1
        for Files in files:
            if Files.endswith('.xml'):
                totalFiles_grp_Out += 1
   
   
    
    
    print  (fore.LIGHT_BLUE  + "### Summary of batched files ### " + style.RESET)            
    
    print(tabulate([[fore.LIGHT_GREEN+'D1'+style.RESET, totalFiles_do_Out, totalDir_do_Out], [fore.LIGHT_GREEN+'E78'+style.RESET, totalFiles_ao_Out,totalDir_ao_Out], [fore.LIGHT_GREEN+'E53'+style.RESET, totalFiles_pl_Out, totalDir_pl_Out], [fore.LIGHT_GREEN+'E21'+style.RESET, totalFiles_act_Out, totalDir_act_Out], [fore.LIGHT_GREEN+'E22'+style.RESET, totalFiles_bw_Out, totalDir_bw_Out], [fore.LIGHT_GREEN+'E74'+style.RESET, totalFiles_grp_Out, totalDir_grp_Out]], headers=[fore.LIGHT_RED+'Type'+style.RESET, fore.LIGHT_RED+'Number of files'+style.RESET,fore.LIGHT_RED+'Number of batches'+style.RESET], tablefmt="fancy_grid"))
            
    print  (fore.LIGHT_GREEN  + "### Proceed with rdf file transformation ### " + style.RESET) 


