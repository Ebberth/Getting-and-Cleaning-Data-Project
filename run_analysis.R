#cleanup
rm(list=ls(all=TRUE))

#setup working directory
setwd("D:/Users/85767506604/Coursera/Getting-and-Cleaning-Data-Project")

#downloading file
Origem <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
Destino <- "./Dados Brutos/Dataset.zip"
download.file(Origem,Destino)
unzip(Destino,exdir = "./Dados Brutos")

#Reading Files

labels = read.csv('./Dados Brutos/UCI HAR Dataset/activity_labels.txt', sep="",  header = FALSE)
features = read.csv('./Dados Brutos/UCI HAR Dataset/features.txt', sep="",  header = FALSE) # Load: data column names
X_train = read.csv('./Dados Brutos/UCI HAR Dataset/train/X_train.txt', sep="",  header = FALSE)
y_train = read.csv('./Dados Brutos/UCI HAR Dataset/train/y_train.txt', sep="",  header = FALSE)
subject_train = read.csv('./Dados Brutos/UCI HAR Dataset/train/subject_train.txt', sep="",  header = FALSE)
X_test = read.csv('./Dados Brutos/UCI HAR Dataset/test/X_test.txt', sep="",  header = FALSE)
y_test = read.csv('./Dados Brutos/UCI HAR Dataset/test/y_test.txt', sep="",  header = FALSE)
subject_test = read.csv('./Dados Brutos/UCI HAR Dataset/test/subject_test.txt', sep="",  header = FALSE)

#Mounting
treino <- cbind(X_train,y_train,subject_train) #Mounting Treino
teste <- cbind(X_test,y_test,subject_test) #Mounting Treino
allData <- rbind(treino,teste)
rm(list = c("treino", "teste", "X_train","y_train","subject_train","X_test","y_test","subject_test" )) #Cleaning unnecessary data


#set variable names 
names(allData) = c(as.vector(tolower(features$V2)),"activity_label","subject")
rm("features") #Cleaning unnecessary data

#remove the columns from allData without Mean or Std
selData <- allData[,c(grep(".*mean.*|.*std.*", names(allData)),562,563 )]
rm("allData") #Cleaning unnecessary data

#Label The Activities (y) with appropriate description
names(labels) <- c("activity_label","activity_desc")

#Replace the Numbers 1-6 With Description
selData <- merge(selData,labels, by = "activity_label")
rm("labels") #Cleaning unnecessary data


##Create second, independent tidy data set with the average of each variable for each activity and each subject. 
NewtidyData <- tbl_df(selData) %>% group_by(activity_desc,subject) %>% summarise_each(funs(mean))
write.table(NewtidyData, "tidy.txt", sep="\t", row.name=FALSE)
