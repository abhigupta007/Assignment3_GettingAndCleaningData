#1. Understand Features table 

Features<-read.table("features.txt")
head(Features)
colnames(Features)<- c("featureId","featureDesc")

#2. Understand Activity types

ActivityLabel<-read.table("activity_labels.txt")
head(ActivityLabel)
colnames(ActivityLabel)<-c("ActivityId","ActivityName")

#3. Understand Training Labels

TrainingLabel<-read.table("y_train.txt")
head(TrainingLabel)
colnames(TrainingLabel)<-"ActivityId"

#4. Understand Test Labels

TestLabel<-read.table("y_test.txt")
head(TestLabel)
nrow(TestLabel)
colnames(TestLabel)<-"ActivityId"

#5. Understand Test set

TestSet<-read.table("X_test.txt")
head(TestSet)
nrow(TestSet)
colnames(TestSet)<- Features$featureDesc


#6. Understand Training set

TrainingSet<-read.table("X_train.txt")
head(TrainingSet)
nrow(TrainingSet)
colnames(TrainingSet)<- Features$featureDesc

#7. Understand Subject_ Train set
SubjectTrainingSet<-read.table("subject_train.txt")
head(SubjectTrainingSet)
nrow(SubjectTrainingSet)
colnames(SubjectTrainingSet)<- "SubjectId"

#8. Understand Subject_ Test set
SubjectTestSet<-read.table("subject_test.txt")
head(SubjectTestSet)
nrow(SubjectTestSet)
colnames(SubjectTestSet)<- "SubjectId"


#9 Merging Test set, test activity labels and test subject data
TestSetFinal<- cbind(SubjectTestSet,TestLabel,TestSet)
head(TestSetFinal)
nrow(TestSetFinal)

#10 Merging Training set, training activity labels and training subject data
TrainingSetFinal<- cbind(SubjectTrainingSet,TrainingLabel,TrainingSet)
head(TrainingSetFinal)
nrow(TrainingSetFinal)


#11 Combine Training and Test Data
Training_TestData<- rbind(TrainingSetFinal,TestSetFinal)
head(Training_TestData)
nrow(Training_TestData)
names(Training_TestData)


#12 Adding activity names
PreFinalData<-merge(Training_TestData,ActivityLabel)
head(PreFinalData)

#13 Creating Final Data Set (Means & Standard Deviation)

index<-setdiff(grep("mean|std", colnames(PreFinalData)),grep("meanFreq", colnames(PreFinalData)))
FinalData<-PreFinalData[,c(1,2,564,index)] # (included - the subject id, activity id & activity name)

#14 Average by Subject and Activity & create Tidy Dataset
require(reshape)
Molten <- melt(FinalData, id.vars = c("SubjectId","ActivityName"))
Tidydataset <- cast(data= Molten, fun = mean)