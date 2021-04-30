topfolders <- list.dirs(system.file("", package="ImrResourceFiles"), recursive = F)

#' check encoding of file
checkUTF8 <- function(filename){
  lines <- readLines(filename)
  valid <- T
  for (l in lines){
    valid <- valid & validUTF8(l)
  }
  if (!valid){
    message(paste("File", filename, "does not conform to UTF-8 encoding."))
  }
  return(valid)
}

#' check encoding and pairing with readme files for all files
for (f in topfolders){
  fileFolders <- list.dirs(f)
  allValid <- T
  for (ff in fileFolders){
    if (f != ff){
      for (filename in list.files(ff, full.names = T)){
        allValid <- allValid | checkUTF8(filename)

        # check that all readme files have a corresponding resource file
        if (substr(basename(filename),1,7)=="README_"){
          resourcefilename <- gsub("README_", "", filename)
          resourcefilename <- gsub(".md", "", resourcefilename)
          if (!file.exists(resourcefilename)){
            message(paste("Readme-file:", filename, "does not have a corresponding resource file"))
          }
        }
        # check that all resource files have a corresponding readme file
        else{
          readmebasename <- basename(filename)
          readmefilename <- gsub(readmebasename, paste("README_", readmebasename, ".md", sep=""), filename)
          if (!file.exists(readmefilename)){
            message(paste("Resource file:", filename, "does not have a corresponding README file"))
          }
        }
      }
    }
  }
  expect_true(allValid)
}
