# This function loads data extracted data for the getting and cleaning data course from  
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#It adds columnes for the participant and the activity and them parses the datset into just the means and
# and standard deviations of the features.  Then this function takes the mean of these features for each activity 
# each participant and returns a data.table


run_analysis<-function()
{

  library(data.table)
  
  
  testdata<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
  testactivity<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
  testsubject<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

  traindata<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
  trainactivity<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
  trainsubject<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
  
  features<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
  activitylabels<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
  
  colnames(testdata)<-as.character(features[,2])
  colnames(traindata)<-as.character(features[,2])
    
  mystd<-grep("std()",features[,2],fixed = TRUE,value=TRUE)
  mymean<-grep("mean()",features[,2],fixed = TRUE,value=TRUE)
  myfeatures<-c(mystd,mymean)
  
  mytest<-subset(testdata,select = myfeatures)
  mytrain<-subset(traindata,select = myfeatures)
  
  mytest<-as.data.table(mytest)
  mytrain<-as.data.table(mytrain)
  
  mytest[,testsubject:=as.data.table(testsubject)]
  mytrain[,testsubject:=as.data.table(trainsubject)]
  
  mytestactivity<-testactivity[,1]
  mytestactivity<-gsub("1","walking",mytestactivity)
  mytestactivity<-gsub("2","walkingupstairs",mytestactivity)
  mytestactivity<-gsub("3","walkingdownstairs",mytestactivity)
  mytestactivity<-gsub("4","sitting",mytestactivity)
  mytestactivity<-gsub("5","standing",mytestactivity)
  mytestactivity<-gsub("6","laying",mytestactivity)

  mytest[,activity:= as.data.table(mytestactivity)]
  
  mytrainactivity<-trainactivity[,1]
  mytrainactivity<-gsub("1","walking",mytrainactivity)
  mytrainactivity<-gsub("2","walkingupstairs",mytrainactivity)
  mytrainactivity<-gsub("3","walkingdownstairs",mytrainactivity)
  mytrainactivity<-gsub("4","sitting",mytrainactivity)
  mytrainactivity<-gsub("5","standing",mytrainactivity)
  mytrainactivity<-gsub("6","laying",mytrainactivity)
 
  mytrain[,activity:= as.data.table(mytrainactivity)]
  
  totaldata<-rbind(mytest,mytrain)
  
  cleanfeatures<-gsub("-",".",myfeatures,fixed = TRUE)
  cleanfeatures<-sub("()","",cleanfeatures,fixed = TRUE)
  cleanfeatures<-tolower(cleanfeatures)
  totalfeatures<-c(cleanfeatures,"testsubject","activity")
  newnames<-cleanfeatures
  setnames(totaldata,colnames(totaldata),totalfeatures)
 
  setkey(totaldata,testsubject,activity)
  
  output<-totaldata[,lapply(.SD,mean) , by = "testsubject,activity", .SDcols = cleanfeatures]
  
  for(i in seq_along(cleanfeatures))
  {
    newnames[i]<-as.character(paste(cleanfeatures[i],".mean",sep = ""))
  }
  newnames<-c("testsubject","activity",newnames)
  setnames(output,colnames(output),newnames)
  
  output

  
}