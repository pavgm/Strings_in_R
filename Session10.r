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
headers = str_sub(emails, end = breaks[,1]) #breaks--> no row, col = 1(start intbl) is end of hdr.Need where we are ending
bodies = str_sub(emails, start = breaks[,2]) #breaks-->col =2 i.e end is the start for body


cat(bodies[6])



##########Lab 2

#1
fruit = c("apple","banana","pear","pineapple")


#2 

#detect if pattern is found
str_detect(fruit,"a")

#if starts with a
str_detect(fruit,"^a")

#ends with an 'a'
str_detect(fruit, "a$")

#if any of chars present - a or e or i or o or u
str_detect(fruit, "[aeiou]")

#if any of chars present a or b or c or d
str_detect(fruit, "[a-d]")

#if any numeric ele from 0 to 9 present
str_detect(fruit, "[0-9]")


#3

#pattern that starts with an 'a' and ends with an 'e'


#starts with a -- then any char [a-z] -- * match predceding pattern ---ends with e(e$)
str_detect(fruit, "^a[a-z]*e$")   

#or (. could be any char or number after a)
str_detect(fruit, "^a.*e$")   




#4 parser to detect phone numbers

#RE to detect the below phone number format
phone = "213 740 4826"
str_detect(phone, "[0-9]{3} [0-9]{3} [0-9]{4}")


#RE to detect both the below formats
phone = c("213 740 4826",
          "213-740-4826")

str_detect(phone, "[0-9]{3}[ -][0-9]{3}[ -][0-9]{4}")


phone = c("213 740 4826",
          "213-740-4826",
          "(213) 740 4826")  #bracket is optional - so use [(] and [)]

str_detect(phone, "[(]?[0-9]{3}[)]?[ -][0-9]{3}[ -][0-9]{4}")



#5
str_extract_all(bodies, "[(]?[0-9]{3}[)]?[ -][0-9]{3}[ -][0-9]{4}")




