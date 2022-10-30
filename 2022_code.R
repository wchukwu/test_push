library(parallel)

#function to extract the somatic ID's from the filenames
som_id_bed = function(itter, title){
  x <- title[itter]
  id <- unlist(strsplit(x, "[_]"))[1]
  return (id)
}
##Final bedpes that did not get filtered

#find which of the ids in the filtered files didn't get processed in the final bedpe
#this could involve extracting the somatic_id's across the filtered_only folder and comparing it to the ids in 
#the bedpe_only folder
final_bedpe <- list.files("Z:/wolu/testing_svaba/outputs/final_bedpe_only/")#origin_files
print(length(final_bedpe))
fil_files <- list.files("Z:/wolu/testing_svaba/outputs/filtered/")#filtered files
print(length(fil_files))
vect_bed <- mclapply(1:length(final_bedpe),som_id_bed,final_bedpe) #obtain the IDs of the files in the bedpe folder
vect_fil <- mclapply(1:length(fil_files),som_id_bed,fil_files)#obtain the IDs of the files in the filtered folder
#vect_org[which(!vect_org %in% vect_bed)]
vect_bed[which(!vect_bed %in% vect_fil)] #check which bedpe files did not make it to the filtered step
which(!vect_bed %in% vect_fil) #gives the specific task array extensions of the files that didn't make it to access their logs file