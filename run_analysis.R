testid<-read.table("./UCI HAR Dataset/test/subject_test.txt")
testact<-read.table("./UCI HAR Dataset/test/y_test.txt")
testdata<-read.table("./UCI HAR Dataset/test/X_test.txt")
feat <- read.table("./UCI HAR Dataset/features.txt")

## Convert activity labels to names read from recipe
act_names <- read.table("./UCI HAR Dataset/activity_labels.txt")
named_test_act <- character()
for (k in 1:length(testact[,1])) {
  named_test_act[k]<-as.character(act_names[testact[k,1],2])
}

## search indexes of variables containing values for mean or std
ind <- sort(c(grep("mean",feat[,2]),grep("std",feat[,2])))

##create data table of id, activity and values. Set names for columns
test_table <- data.frame(testid,named_test_act,testdata[,ind])
names(test_table)<- c("id","activity",as.character(feat[ind,2]))

## Same process for training data
trainid<-read.table("./UCI HAR Dataset/train/subject_train.txt")
trainact<-read.table("./UCI HAR Dataset/train/y_train.txt")
traindata<-read.table("./UCI HAR Dataset/train/X_train.txt")

named_train_act <- character()
for (k in 1:length(trainact[,1])) {
  named_train_act[k]<-as.character(act_names[trainact[k,1],2])
}

train_table <- data.frame(trainid,named_train_act,traindata[,ind])
names(train_table)<- c("id","activity",as.character(feat[ind,2]))

## We now have two tables with same columns. Merge with rbind

whole_table <- rbind(test_table,train_table)

## Write tidy table to file

write.table(whole_table, file="tidy_exercise.txt")