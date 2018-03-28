library(stringr)



#1

print("DSO")
print("\"")


cat("\"")


####new line char \n
cat("DSO\n545")
####tab
cat("DSO\t545")


#2  usually need to escape " and \
cat(":-\\")

#cat("\":","-\"", "\"\")

cat("(C^_^\")")

cat("@_'-'")

cat("\\m/")


#3

?str_locate()
?str_sub()

###4

str_locate(string = "great", pattern = "a")
str_locate_all(string = "fantastic", pattern = "a")
str_locate(string = "super", pattern = "a")
str_locate(c("great","fantastic","super"), pattern = "a")

####5

sub1 = str_sub(string = "testing", start = 1, end = str_length("testing"), value = "tes")

#default end is end of str

#tes
str_sub(string = "testing", start = 1, end = 3)

#ting
str_sub(string = "testing", start = 4, end = 8)  

#test
str_sub(string = "testing", start = 1, end = 4) 
#or
str_sub(string = "testing", end = 4)



#6
#c(2,3) is the start for 2 inputs. start = 2 for abc and start = 3 for defg. No end
input = c("abc","defg")
str_sub(input, c(2,3))   

#7
emails = readRDS("email.rds")

emails[1]
cat(emails[1])
str_locate(emails[1], "\n\n")  #start is where header ends and end is start of body

?str_split


#8 - split the header and body
?str_extract
header = str_sub(emails[1], start = 1, end = 842)
cat(header)

body = str_sub(emails[1], start = 843) #no need of end
cat(body)

#str_split(emails[1],"\n\n", n =1)  ??


#10 header and body of all emails

breaks = str_locate(emails, "\n\n") 
headers = str_sub(emails, end = breaks[,1]) #start from 1. Need where we are ending
bodies = str_sub(emails, start = breaks[,2])

cat(bodies[6])


