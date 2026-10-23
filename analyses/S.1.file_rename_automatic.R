#This code identifies the folder that contains your sequences lists and 
# everything that ends in .fastq.gz

old_names <- list.files(pattern = "*filt.fastq.gz",
                        path = "data/sequences/", #change to path where sequences are
                        #full.names  = TRUE
                        )

name_parts <- (strsplit(old_names, "_"))
name_parts

#delete <- c(-2,-3,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-18,-19) #adjust characters that you want deleted in file name
keep <- c(1,2,3) #adjust to characters that we want
#this is a test to check that we are removing the correct segments
name_parts[[151]][keep]

#Execute the first example
paste0("data/sequences_renamed/",
       paste(name_parts[[1]][keep], collapse = "_"),
       "_filt.fastq.gz", 
       sep = ""
)

# Once the test is successful, and path and name files are correct, proceed with all files in folder

new_names <- #iterate over each element of the list of old names the renaming function
  unlist(
    lapply(1:length(old_names), function(x){
      paste0("data/sequences_renamed/",
             paste(name_parts[[x]][keep], collapse = "_"),
             ".filt.fastq.gz", #notice that we're manually pasting the file extension
             sep = ""
      )
    })
  )

old_names <- paste0("data/sequences/",old_names)

##HERE JUMP TO PART 2 if deletion of underscores is needed if not continue


sanity_check <- data.frame(old_names,new_names)

file.rename(from = old_names, 
            to = new_names)


### PART 2: alternative if deleting underscores is needed / if not the last line is the final one

# Function to remove the nth occurrence of an underscore

remove_nth_underscore <- function(string, n) {
  parts <- strsplit(string, "_")[[1]]
  if (n > length(parts) - 1) {
    stop("n is greater than the number of underscores in the string")
  }
  parts[n] <- paste0(parts[n], parts[n + 1])
  parts <- parts[-(n + 1)]
  paste(parts, collapse = "_")
}

result <- #iterate over each element of the list of old names the renaming function
  unlist(lapply(new_names, remove_nth_underscore, n = 3)) #change n to position of "_" to remove


sanity_check <- data.frame(old_names,result)

file.rename(from = old_names, 
            to = result)


