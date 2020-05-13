sampleMyDataFrame <- function(dataFrame, totalLines, sampleSize) { 
    # Checks if the underlying platform is unix/Linux/MacOS
    if (.Platform$OS.type != "unix") 
        stop("This function requires unix-based systems")

    # Running Python script to generate a random sample of X length on Y number of lines of data frame
    # Outputs a string of comma-separated numbers
    sampleText <- system(paste0("python -c 'import random; print(\",\".join([str(x) for x in random.sample(range(1,",totalLines+1,"),",sampleSize,")]))'"), intern = TRUE)

    # Splits string and converts each element of split string to numbers
    # Outputs list of numbers
    sampleList <- as.numeric(as.character(unlist(strsplit(sampleText, ","))))

    # Takes list of numbers and extracts relevant rows of dataframe
    # Outputs table of randomly generated lines
    RandomSample <- dataFrame[c(sampleList),]
    RandomSample
}