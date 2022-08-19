########################################
#                 lec1                 #
########################################

#简单运算
z<-c(1,2,3,4)#向量 
year <- seq(from=1950,to=2010,by=10)  #序列 
seq(from=1950,to=2010,by=10)
2008:2012
#names(#变量)<-  label变量

my.summary<-function(x) {#function takes one input
  s.out<-sum(x)
  l.out<-length(x)
  m.out<-s.out/l.out
  out<-c(s.out,l.out,m.out)
  names(out)<-c("sum","length","mean") #加标签
}
z<-1:10
my.summary(z)




########################################
#                lec2                  #
########################################
#file  针对文件
#dir   针对文件夹

getwd()    #获得路径  
setwd()    #改变工作路径
old.dir<- getwd()    #生成一个变量等于路径
ls()      #查找变量
list.files() #
dir()
#args(#函数名)   #汇报函数逻辑公式

dir.create("testdir") 
file.create("mytest.R")    #在testdir文件夹中生成mytest.R文件
file.exists("mytest.R")    #check 是否存在  汇报TRUE  then存在
file.info("mytest.R")      #检查文件信息  $size  $isdir   $mode   $mtime   $ctime   $atime exe

file.rename("mytest.R","mytest2.R")   #文件重命名
file.copy("mytest2.R","mytest3.R")    #复制文件
file.path("mytest3.R")                #相对路径
file.path("folder1", "folder2")       

dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)   #创建目录
setwd(old.dir)    #回到原来的目录



########################################
#                lec3                  #
########################################

1:20
pi:10
15:1
seq(1,20)
seq(0,10,by=0.5)                #约束步进
my_seq<-seq(5,10,length=30)     #约束长度

#三个等价
1:length(my_seq)
seq(along.with=my_seq)
seq_along(my_seq)

rep(0,times=40)            #40个0组成的向量
rep(c(0,1,2),times=10)     #10个c组成的向量 向量依次排
rep(c(0, 1, 2), each = 10) #10个c组成的向量 元素依次排


########################################
#                lec4                  #
########################################

#atomic vector  :contains exactly one data type
#list           :may contain multiple data types
num_vect<-c(0.5,55,-10,6)        #数值型向量
tf<- num_vect<1    #logi 判断向量里每个元素是否小于1
num_vect>=6

my_char<-c("My","name","is")     #字符型向量
paste(my_char, collapse = " ")   #用空格" "将三个字符连接

my_name<-c(my_char, "UIBEmk")
paste(my_name,collapse=" ")

paste("Hello","world!",sep=" ")
paste(1:3, c("X", "Y", "Z"), sep = "")    #1X  2Y  3Z
paste(LETTERS, 1:4 ,sep="-")     #A-1 B-2 C-3 D-4 E-1 F-2




########################################
#                lec5                  #
########################################
#NA
#NaN: 0/0    Inf-Inf


x<-c(44,NA,5,NA)
x*3         #只有mun会乘以3 

y<-rnorm(1000)      #正态分布
z<- rep(NA,1000)    #1000个int "NA"

my_data<-sample(c(y,z),100)   #在y z组合中随机抽取100个
my_na<-is.na(my_data)
#my_data==NA         #NA is not really a value, but just a placeholder for a quantity that is not available
#在任何时候使用逻辑表达式时都要小心，因为一个 NA 值可能会破坏整个事情。

#现在我们有了一个向量 my_na，
#它的每个 NA 都为 TRUE，
#每个数值都为 FALSE，
#我们可以计算数据中 NA 的总数。
#诀窍是要认识到，在表面之下，
#R 将 TRUE 表示为数字 1，将 FALSE 表示为数字 0。
#因此，如果我们将一堆 TRUE 和 FALSE 相加，
#我们就会得到 TRUE 的总数。

sum(my_na)



########################################
#                lec6                  #
########################################

#提取向量前20个元素？
#提取向量正的元素？

x[1:10]     # 汇报x前十个元素
x[is.na(x)]    #汇报A vector of all NAs
y<- x[!is.na(x)]   #将x中不为NA的元素赋给y
y[y>0]             #A vector of all the positive elements of y

#不直接用 x[x>0]
#因为 NA不是值 ，得到的结果是NA和正数的混合

x[!is.na(x) & x>0]   #汇报x中大于零的元素
x[c(3,5,7)]         #用c()返回向量中特定位置的元素
x[c(-2,-10)]        #返回除了第2、第10个元素之外的其他元素
x[-c(2,10)]         #返回除了第2、第10个元素之外的其他元素

#x[0]               #返回第0个元素       numeric(0)
#x[3000]            #返回第3000个元素    NA

vect <- c(foo = 11, bar = 2, norf = NA)    #创建具有三个命名元素的数值向量
names(vect)         #查看向量label

vect2<- c(11,2,NA)
names(vect2) <- c("foo", "bar", "norf")    #相当于先定义value，再赋予label

identical(vect,vect2)        #比较vect和vect2是否是相同的变量
vect["bar"]                  #返回特定label的元素
vect[c("foo","bar")]



########################################
#                lec7                  #
########################################

my_vector<-1:20       #生成一个1~20的变量
#dim(my_vector)       #查看向量的维度，但由于vector是向量i形式，没有dim属性，所以返回NULL
length(my_vector)     #返回向量的长度

dim(my_vector) <- c(4, 5)    #赋予向量dim属性
dim(my_vector)          #返回向量的dim属性
attributes(my_vector)   #（等价）返回向量的维 4代表行，5代表列
class(my_vector)        #识别 ？？？的类别（是矩阵？还是向量？还是数值？）

my_matrix <- my_vector  

#matrix(data=my_vector,nrow=4,ncol=5)
my_matrix2 <- matrix(data=1:20 ,nrow=4,ncol=5)    #把1:20依次填入4x5的矩阵中
identical(my_matrix,my_matrix2)                   #识别my_matrix和my_matrix2是否一样

#add column
patients<-c("Bill","Gina","Kelly","Sean")         #生成要增加的列向量
cbind(patients, my_matrix)                        #列向量与矩阵合并,矩阵“隐式强制”变为字符串矩阵

my_data <- data.frame(patients, my_matrix)        #data.frame允许将名称的字符向量存储在数字矩阵旁边
class(my_data)                                    #返回my_data的类型

cnames<-c("patient", "age", "weight", "bp", "rating","test")   #创建变量名称
colnames(my_data) <- cnames                                    #将变量名称赋给每一列



########################################
#                lec8                  #
########################################

#逻辑语句

TRUE==TRUE      #检验TRUE是否等于TRUE
(FALSE == TRUE) == FALSE       #(FALSE == TRUE)这个事件是错误(FALSE)的
6==7
!5==7

FALSE&FALSE                     #FALSE
TRUE &  c(TRUE, FALSE, FALSE)   #TRUE FALSE FALSE

TRUE && c(TRUE, FALSE, FALSE)   #TRUE [仅使用右操作数的第一个成员（向量）计算左操作数。 向量中的其余元素在此表达式中根本不求值。


#`|` 版本的 OR 评估整个向量的 OR，而 `||` 版本的 OR 仅评估向量的第一个成员。
TRUE | c(TRUE, FALSE, FALSE)    #TRUE TRUE TRUE
TRUE || c(TRUE, FALSE, FALSE)   #TRUE

5 > 8 || 6 != 8 && 4 > 3.9      #TRUE

isTRUE(6>4)                     #TRUE
!identical(7, 7)                #FALSE

xor(5==6,!FALSE)                #异或 两个不一样，汇报TRUE

ints <- sample(10)              #从 1 到 10 的整数的随机抽样
ints>5                          #对于每一个元素 检验其是否>5

which(ints>7)                   #ints哪个位置的元素大于7
any(ints<0)                     #返回是否有任一元素小于0
all(ints>0)                     #返回是否任一元素大于0




########################################
#                lec9                  #
########################################


Sys.Date()                      #获取今天日期字符串
mean(c(2,4,5))                  #求平均值

#Function_Script   修改后 保存 再submit()

##1.boring_function
boring_function('My first function!')
boring_function   #查看编写的script的代码

##2.my_mean       #平均数

##3.remainder     #余数
args(remainder)   #检验表达式

##4.evaluate
evaluate(sd,c(1.4, 3.6, 7.9, 8.8))

evaluate(function(x){x+1}, 6)     #function(x)相当于方程左侧  {x+1}相当于方程右侧   6相当于x
evaluate(function(x){x[1]},c(8,4,0))                    #取c中第一个元素
evaluate(function(x){x[max(length(x))]},c(8,4,0))       #取c中最后一个元素

##5.paste

##6.telegram

##7.mad_libs




########################################
#                lec10                 #
########################################


head(flags)                          #查看数据表头
dim(flags)                           #查看数据维度
class(flags)                         #查看数据形式

##lapply
cls_list <- lapply(flags, class)     #每一列的数据格式拆分到cls_list中

class(cls_list)                      #list
as.character(cls_list)               #"factor" "integer"...

##sapply
cls_vect<-sapply(falgs,class)
class(cls_vect)                      #character


#example
sum(flags$orange)                    #flags样本中, 橙色国家个数[Given orange是Dummy]
flag_colors <- flags[, 11:17]
head(flag_colors)

lapply(flag_colors,sum)              #of the 194 flags in our dataset, 153 contain the color red, 91 contain green, 99 contain blue
sapply(flag_colors,sum)
sapply(flag_colors,mean)


flag_shapes <- flags[, 19:23]      
lapply(flag_shapes,range)            #看范围[最小值，最大值]
shape_mat <- sapply(flag_shapes,range)


unique(c(3, 4, 5, 5, 5, 6, 6))       #去重
unique_vals <- lapply(flags,unique)  






sapply(flags,unique)



