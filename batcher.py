import os
import argparse


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='XMLProfiles Parser')
  
    parser.add_argument('--batchPath', dest="myBatchPath", help='Path where the files that will compose the batch are located' )
    #parser.add_argument('--xslt', dest="myXslt", help='path of the XSLT file')
    args = parser.parse_args()
    myBatchPath = args.myBatchPath
    asps = []
    index_dir=0
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
                        os.mkdir(os.path.join(root, "batch_" +  str(index_dir)))
                        #move the files to the new folder
                        for name in batch:
                            os.rename(os.path.join(root, name), os.path.join(root, "batch_" + str(index_dir), name))
                        #clear the batch
                        batch = []
            else:
                #if the sum of the size of the files is less than 8MB
                #create a new folder
                index_dir+=1
                os.mkdir(os.path.join(root, "batch_" +  str(index_dir)))
                #move the files to the new folder
                for name in files:
                    os.rename(os.path.join(root, name), os.path.join(root, "batch_" + str(index_dir), name))                    
        
            break      
            
                
            
        


