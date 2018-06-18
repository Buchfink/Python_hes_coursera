getwd()
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")
dir()
setwd("diet_data")
dir() # or list.files() or setwd("..") list.files("diet_data")
setwd("..")
list.files("diet_data") # ����������� ����� � �����, ������
class(list.files("diet_data")) # character
length(list.files("diet_data")) # 5 ������� ������

andy <- read.csv ("diet_data/andy.csv")
head(andy) #������ ����� ����� ������ � �������� ��������, ��� data.frame
class(head(andy)) # "data.frame"
dim(head(andy)) # 6 4

length(andy$Day) #30 ���������� ����������
dim(andy) # 30 4 ���������� ����� � ���-�� ��������
str(andy) # �������� ������� 30 ���������� 4 ����������, ��������, ���, ������ 10
summary(andy) #���, ����, �������, �������, 1 � 3 ��������
names(andy) #�������� �������� � �������� - ��� ���������, ������
class(names(andy)) #��� ���������� character
length(names(andy)) #����� ������� (���-�� ��������) 4

files_full <- list.files("diet_data", full=T)
andy_david <- rbind(read.csv(files_full[1]), read.csv(files_full[2]))
head(andy_david)
tail(andy_david)

day_25 <- andy_david[which(andy_david$Day == 25),]
print day_25

dat<- data.frame()
for (i in 1:5) {dat<-rbind(dat,read.csv(files_full[i]))}
str(dat)

for (i in 1:5) {
  dat<-rbind(dat,read.csv(files_full[i]))}

weightmedian <- function(directory, day) {
      files_list <- list.files(directory, full.names = TRUE)
      dat <- data.frame()
      for (i in 1:5) {
        rbind(dat, read.csv(files_list[i]))
      }
      median(dat[dat["Day"] ==day, "Weight"], na.rm =TRUE)
}
