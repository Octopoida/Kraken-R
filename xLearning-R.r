##########################################################################
# AUTHOR:	David Geeraerts
# EMAIL:	geeraerd@evergreen.edu
# LOCATION:	Olympia, Washington U.S.A. 
# TITLE:	Learning R
# Version:	29
# Purpose: Using CAL HeadCount as learning data
# Copyright License: Creative Commons: Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0)  
# http://creativecommons.org/licenses/by-nc-sa/3.0/
#-------------------------------------------------------------------------
# Get the data from Google docs #
# https://docs.google.com/spreadsheet/ccc?key=0AjQL08YDc6cUdDNxbWJTLU5RZUt6ZVlRN1Y0c3hVTlE#gid=0
# Take the "Log" worksheet and save it as a csv file.
##########################################################################
# Types of structures
# -------------------------------------
# vector	--one dimension
# matrix	--two dimensions
# array		--three or more dimensions | is.array()
#
# Types of Data or modes
# -------------------------------------
# Numeric 	{is.integer() is.double()}
# Text 		is.character()
# Factor	is.factor()
# Function	is.function()
# List		is.list()
#
# Vector Chart
#	typeof		Mode		storage.mode
#	------------------------------------
#	logical		logical		logical
#	integer		numeric		integer
#	double		numeric		double
#	complex		complex		complex
#	character	character	character
#	raw			raw			raw
##########################################################################
# NOTES
#-------------------------------------------------------------------------
#- R is case sensitive. Can use tolower() or toupper() for munging data.
#- \\ to escape special characters
#- variables should only use alpha numeric characters, period ".", and underscore "_"
#
##########################################################################
# PACKAGES of note:
# ------------------------------------------------------------------------
# XML scraping tool for html & XML pages
# httr working with HTTP connections
# RMySQL for MySQL connections
# bigmemory for handling large datasets too big for RAM
# knitr enables R Markdown files --> .rmd file
#
#
#
##########################################################################
#Packages for Spatial analysis
#-------------------------------------------------------------------------
# maps -provides some basic world maps
#
#
#
##########################################################################
#
# see the latest R version changes
View(news())
#
#help on functions
help(c)
help(install.packages)
#getting help on a package
help(package=stringr)
#
# Example code
example(help)
#R Version Information
#simple
getRversion()
#Returns variable values
R.Version()
#more session information
sessionInfo()
#Type of OS
.Platform$OS.type
#
# http://cran.r-project.org/
#Package Management
installed.packages()
#load a package
#library('packageName')
#require('packageName')
# Install
install.packages('psych')
library(psych)
#
# uninstall a package
# remove.packages("psych")
#
# http://cran.r-project.org/web/views/
#CRAN Task Views
available.views()
install.packages("ctv")
install.views("Survival")
install.views("SocialSciences")
install.views("TimeSeries")

#Some common system variables
Sys.getenv()
Sys.getenv("R_HOME")
Sys.getenv("R_LIBS_USER")
#dump to file
# not the best
cat(paste(Sys.getenv()), sep = "\r", fill = TRUE, label = paste(names(Sys.getenv())), append = FALSE, file="System.variables.txt")
# best way and formated
cat(paste(names(Sys.getenv()), "=", Sys.getenv()), sep = "\r", fill = TRUE, label = NULL, append = FALSE, file="System.variables.txt")
#
# Date Time simple
Sys.Date()
Sys.time()
Sys.timezone()
# expressions can be grouped together with the use of {exp();exp()...}
{Sys.Date();Sys.time()}
#
# POSIX format
as.POSIXlt(Sys.time(), tz = "GMT")
as.POSIXct(Sys.time())
format(Sys.time(), "%a %b %d %X %Y %Z")
format(Sys.time(), "%H:%M:%OS3")
#
# see that Sys.Date() is class date
# {numeric, logical, character, list, matrix, array, factor, data.frame}
class(Sys.Date())
# see what storage mode Sys.Date() is
# {logical, numeric, complex, character, list (only for object list), or raw}
mode(Sys.Date())
storage.mode(Sys.Date())
#
# Pause for specified time (in seconds)
Sys.sleep(10)
#
# Output to a log file using sink()
# see if there are any open connections
sink.number()
#start a sink connection to a file
sink("R-Output.log.txt", append = TRUE, split = FALSE)
#close the connection
sink()
#Check connection is closed
sink.number()
#
# Output to... {pdf, png, svg, jpg, etc.}
#display list of graphical devices
?Devices
# example: svg(file="myImageFile.svg", height=4,width=8)
# ...followed by creating a plot/graph.
# close device connection(s)
dev.off()
#
# Setting values 
# =
# <-
# assign("x", C(x,y,z)
#
#getting user input
om <- "Your Selection:"	#output message
x <- readline(prompt = "User Input (Y or N) : ")
if (x == 'Y' || x == 'y') cat(c(om,"Yes")) else cat (c(om,"No"))
#
#Working with directories
# get working directory
getwd()
# Set the working directory (Windows OS syntax)
setwd("D:\\Workspace\\R")
#
# Executing an R script from file
source("Week_Days.r")
source("Months.r", local = FALSE, echo = TRUE, verbose = FALSE)
# Can be a URL
# source("http://www.awebsite.info")
#
# Return all objects that have been instantiated
objects()
character() #any objects that are character
numeric()	#any objects that are numeric
#
# quickly remove all instantiated objects
rm(list=ls())
#
# Working with Connections, such as [geo]JSON feed
# uses RJSONIO package
# Sample data from USGS Earthquake feed
install.packages('RJSONIO')
library(RJSONIO)
URI <- "http://earthquake.usgs.gov/earthquakes/feed/geojson/significant/month"
download.file(URI,"USGS_Quakes.json","internal")
con = file("USGS_Quakes.json")
USGS_Quakes = fromJSON(con) #makes it like a list
close(con)
head(USGS_Quakes)
tail(USGS_Quakes)
#
##########################################################################
#
#
# WORKING WITH CAL HEAD-COUNT DATA
#
#
##########################################################################
#
#Load the CSV file into a variable; read.table() is common for text files {.txt}; scan() is the most primitive form of reading data from a file into a variable.
# Create a Timestamp for laoding the data
LastLoadTimestamp_CalData = as.POSIXct(Sys.time())
# Get the difference between last load and current time
as.POSIXlt(Sys.time()) - LastLoadTimestamp_CalData
#
CalData <- read.csv('CAL-HeadCount-Log.csv', sep = ',', header = TRUE)	#if tab use sep='/t'
# To remove the total column --since its a calculated field
rmtCalData <- CalData[,-6] #remove column #6 (which is the total column)
#
# First things to do when looking at a new dataset
# Look at the dimensions of the data
# number of records, number of columns
dim(CalData)
# any missing values?
# is.na(CalData)
sum(is.na(CalData))	#better way of getting the info
table(is.na(CalData))
#
#view headers in source order
names(CalData)
# Double check that columns are the expected default data type
is.numeric(CalData$East)	#should be TRUE
is.numeric(CalData$West)	#should be TRUE
is.numeric(CalData$Total)	#should be TRUE
is.character(CalData$Counter) # false since its a factor
#
#List the headers (in alpha-Numeric order)
ls(CalData)
# Search for an item in the list
ls(CalData, pattern = 'E')
# Print as an ordinary list rather than a matrix
unclass(CalData) 
# Examine the structure of CalData
str(CalData)
# Examine the structure of CalData with pattern searches
ls.str(CalData)
ls.str(CalData, pattern = 'Total')
# to get both row and col names use
dimnames(CalData)
# also row/col names
rownames(CalData)
colnames(CalData)
#Class object?
class(CalData)
#Mode of object --the storage mode of object
mode(CalData)
storage.mode(CalData)
# test the class object, two ways of checking
if(class(CalData)=='data.frame') TRUE else FALSE
if(any(class(CalData)=='data.frame')) TRUE else FALSE
#
# Create a list for all interger elements
iCalData = list(CalData$East, CalData$West, CalData$Total)
# Reference a list by position
iCalData[[1]]
names(iCalData) #will be null; no names defined
iCalData = list(East=CalData$East, West=CalData$West, Total=CalData$Total)
names(iCalData) #now the list has names
#remove "Total" from the list
iCalData[["Total"]] <- NULL
#
#Create a unique list for the counters
# see the list first
levels(CalData$Counter)
list(CalData$Counter)
# 
Counters <- levels(CalData$Counter)
#
#
#Working with CalData Data Frame
#specify to use a data frame
dfCalData = data.frame(CalData)
# view the structure
str(dfCalData)
str(CalData)
#
# Working with Dates
class(CalData$Date)	# shows that its a factor
dCalData_Date = as.Date(CalData$Date, format = "%m/%d/%Y")
class(dCalData_Date)	#date class
dCalData_Date[1]	#will return the first date
as.integer(dCalData_Date)
# OR
iCalData_Date = as.integer(as.Date(CalData$Date, format = "%m/%d/%Y"))
#POSIXlt creates parts to the date; human readable vs POSIXct
dCalData_Date = as.POSIXlt(CalData$Date, format = "%m/%d/%Y")
dCalData_Date$mday	#day of the month
dCalData_Date$mon	#Month
dCalData_Date$year + 1900	#year (since 1900)
dCalData_Date$wday	#day of the week
dCalData_Date$yday	#day of the year
# Getting the difference between two dates
# in this case the first count to the last count
difftime(dCalData_Date[1], dCalData_Date[length(dCalData_Date)])
#
# Working with Time
class(CalData$Time)	#is a factor that needs to be changed
dCalData_Time = chron(times = CalData$Time)
class(dCalData_Time)	#is now a times class
# Create a single timestamp string
dCalData_TimeStamp = paste(dCalData_Date, dCalData_Time)
difftime(dCalData_TimeStamp[1], dCalData_TimeStamp[2])

#################################################
#!NEEDS RESEARCH!
#using timeDate package#
#require('timeDate')
#dCalData_Time = as.timeDate(dCalData_Time)
#class(dCalData_Time)	#is now a timeDate
#################################################

#show the first record with all columns
CalData[1,1:6]
#Show the first 10 records, all
CalData[1:10,1:6]
#Show all the data for a cloumn
CalData[,6]
# Using operators within the index
# get a record set without 0's
CalData$East[CalData$East > 0]
CalData$West[CalData$West > 0]
#create an adjusted variable excluding 0's
adjCalData_East <- CalData$East[CalData$East > 0]
adjCalData_West <- CalData$West[CalData$West > 0]
adjCalData_Total <- CalData$Total[CalData$Total > 0]
#show the first 6 records or n records; last 6 records
head(CalData)
head(CalData, n = 10)
tail(CalData)
#Sort/Order/Rank the Data Frame
sort(CalData[,6])
order(CalData[,6])
rank(CalData[,6])
#Get sums of columns
with(CalData, sum(Total))
with(CalData, sum(East))
with(CalData, sum(West))
#Get statisitical summary data
summary(CalData)
# Get individual summary
summary(CalData$Counter)
summary(CalData$East)
summary(CalData$West)
summary(CalData$Total)
summary(CalData$Time)
#
# Tukey's five number: {min, lower-hinge, median, upper-hinge, maximum}
fivenum(CalData$East)
fivenum(CalData$West)
fivenum(CalData$Total)
# Summary Statistics
# Mean (Average)
mean(CalData$East, na.rm = TRUE)
mean(CalData$West, na.rm = TRUE)
mean(CalData$Total, na.rm = TRUE)
# median (middle)
median(CalData$East, na.rm = TRUE)
median(CalData$West, na.rm = TRUE)
median(CalData$Total, na.rm = TRUE)
#standard deviation
sd(CalData$East, na.rm = TRUE)
sd(CalData$West, na.rm = TRUE)
sd(CalData$Total, na.rm = TRUE)
#variance
var(CalData$East, na.rm = TRUE)
var(CalData$West, na.rm = TRUE)
var(CalData$Total, na.rm = TRUE)
# mdian absolute deviation
mad(CalData$East, na.rm = TRUE)
mad(CalData$West, na.rm = TRUE)
mad(CalData$Total, na.rm = TRUE)
#
# examples of using [] or $
min(CalData[,6])
max(CalData[,6])
min(CalData$Counter)
max(CalData$Totals)
#min
min(CalData$East, na.rm = TRUE)
min(CalData$West, na.rm = TRUE)
min(CalData$Total, na.rm = TRUE)
#max
max(CalData$East, na.rm = TRUE)
max(CalData$West, na.rm = TRUE)
max(CalData$Total, na.rm = TRUE)
#range
range(CalData$East, na.rm = TRUE)
range(CalData$West, na.rm = TRUE)
range(CalData$Total, na.rm = TRUE)
# sum (Totals)
sum(CalData$East, na.rm = TRUE)
sum(CalData$West, na.rm = TRUE)
sum(CalData$Total, na.rm = TRUE)
# returns header/column count
length(CalData)
# number of records
length(na.omit(CalData$Counter))
#na.fail returns only if there are no NA's
length(na.fail(CalData$Time))
length(na.omit(CalData$East))
length(na.omit(CalData$West))
length(na.omit(CalData$Total))
# get the character length
nchar(CalData$Total)
#
# Conditional search
any(CalData$East > 50) #will return TRUE or FALSE
any(CalData$East == 50)
any(CalData$East >= 50)
#
# Probabilty Statistics
quantile(CalData$East)
quantile(CalData$West)
quantile(CalData$Total)
# adjust the scale
quantile(CalData$East, prob = seq(0,.1,.2,.3), na.rm = TRUE, names = TRUE)
quantile(CalData$West)
quantile(CalData$Total)
# 
quantile(CalData$East, na.rm = TRUE, names = TRUE)
quantile(CalData$West, na.rm = TRUE, names = TRUE)
quantile(CalData$Total, na.rm = TRUE, names = TRUE)
#Tukey Five-Number Summaries
#(minimum, lower-hinge, median, upper-hinge, maximum)
fivenum(CalData$East, na.rm = TRUE)
fivenum(CalData$West, na.rm = TRUE)
fivenum(CalData$Total, na.rm = TRUE)
#cumulative statistics
cumsum(CalData$East)
cumsum(head(CalData$West))
cumsum(tail(CalData$Total))
cummax(head(CalData$East, n = 10L))
cummax(CalData$West)
cummax(CalData$Total)
cummin(CalData$East)
cummin(CalData$West)
cummin(CalData$Total)
# unique values
unique(CalData$East)
unique(CalData$West)
unique(CalData$Total)
sort(unique(CalData$Total), decreasing = TRUE)
#Apply summary to a list
lapply(iCalData, mean, USE.NAMES = TRUE)
	# User friendly
sapply(iCalData, mean, na.rm = TRUE, USE.NAMES = TRUE)
sapply(iCalData, min, na.rm = TRUE, USE.NAMES = TRUE)
sapply(iCalData, max, na.rm = TRUE, USE.NAMES = TRUE)
# create new vector
maxCalData = sapply(iCalData, max, na.rm = TRUE, USE.NAMES = TRUE)
minCalData = sapply(iCalData, min, na.rm = TRUE, USE.NAMES = TRUE)
meanCalData = sapply(iCalData, mean, na.rm = TRUE, USE.NAMES = TRUE)
# create seperate interger vectora
iCalData_East = CalData$East
iCalData_West = CalData$West
iCalData_Total = CalData$Total
#
# Requires psych package
if(require('psych')==FALSE) install.packages('psych')
library('psych')
describe(CalData)

#Transpose the data: X(row) becomes Y(column), Y(Column) becomes X(row)
CalData_t = t(CalData)

#Create contingency tables
# $ doesn't work, use []
table(CalData$Counter)
table(sort(CalData$Counter, decreasing = TRUE))
table(CalData$East)
table(CalData$West)
table(CalData$Total)
tblCalData_Total = table(CalData$Total)
tblCalData_East = table(CalData$East)
tblCalData_West = table(CalData$West)
lsCalData = list(tblCalData_East, tblCalData_West, tblCalData_total)
#Test is.table
is.table(CalData)
is.table(iCalData)
is.table(maxCalData)
is.table(minCalData)
is.table(meanCalData)
is.table(tblCalData_total)
is.table(tblCalData_East)
is.table(tblCalData_West)
#also
is(tblCalData_East, 'table')
is(tblCalData_West, 'table')
is(tblCalData_Total, 'table')

# will return false becasue its a list
is.table(lsCalData)
# IF condition
if(class(lsCalData) == 'list') TRUE else FALSE
if(class(lsCalData) == 'table') TRUE else FALSE
# get proportions from table
prop.table(tblCalData_East)
prop.table(tblCalData_West)
prop.table(tblCalData_Total)
#
# K-Means clustering
# define the number of desired clustered groups
kmeans(CalData$East, 3)
kmeans(CalData$West, 3)
#
##########################################################################
# Visualization (Plots and Graphs)
#
# Cairo high quality PNG,JPEG,TIFF,SVG,PDF
# Advanced graphing with ggplot2 install.packages('ggplote2')
# Advanced dynamic graphing with rggobi install.packages('rggobi')
# par() can modify default graphics parameters
# type par() to see current settings and available elements
#
# For a given plot to find a point
# clicks on the plot will be recorded and the points displayed once locator() is escaped.
# locator()
#
# stemplot
stem(tblCalData_East)
stem(tblCalData_West, scale = 3, width = 80)
stem(tblCalData_Total)
if(class(tblCalData_East) == 'table') stem(tblCalData_East) else print("Not in table format")

# Histograms
# Simple
hist(tblCalData_East)
hist(tblCalData_West)
hist(tblCalData_Total)
# Get two or more graphs side by side. Rule of thumb is no more than 2x2.
par(mfrow=c(1,2))
hist(tblCalData_East)
hist(tblCalData_West)
#
# hist breaks
# determines the number of histo bars 
# breaks = n
# breaks = c(n,n,n,n)
# use colors() to get possible color values.
# mostly complete
hist(tblCalData_East,
	main = "East CAl Head Count",
	xlab = "Count",
	ylab = "Number",
	breaks = 'Sturges',
	xlim = ,
	ylim = ,
	freq = TRUE,
	include.lowest = TRUE,
	right = TRUE,
	col = 'gray',
	border = 'black',
	density = NULL,
	labels = TRUE,
	axes = TRUE,
	warn.unused = TRUE)
	
	
hist(tblCalData_West,
	main = "West CAl Head Count",
	xlab = "Count",
	ylab = "Number",
	breaks = 'Scott',
	xlim = ,
	ylim = ,
	freq = TRUE,
	include.lowest = TRUE,
	right = TRUE,
	col = 'gray',
	border = 'black',
	density = NULL,
	labels = TRUE,
	axes = TRUE,
	warn.unused = TRUE)
	
hist(tblCalData_Total,
     main = "Total CAl Head Count",
     xlab = "Count",
     ylab = "Number",
     breaks = 5,
     xlim = c(0,85),
     ylim = c(0,45),
     freq = TRUE,
     include.lowest = TRUE,
     right = TRUE,
     col = 'gray',
     border = 'black',
     density = NULL,
     labels = TRUE,
     axes = TRUE,
     warn.unused = TRUE)
	 
#Density plotting
density(tblCalData_East, bw = 'nrd0', kernal = 'gaussian', na.rm = TRUE)
density(tblCalData_West, bw = 'sf', kernal = 'gaussian', na.rm = TRUE)
density(tblCalData_Total, bw = 'UCV', kernal = 'gaussian', na.rm = TRUE)

plot(density(tblCalData_East, bw = 'nrd0', kernal = 'gaussian', na.rm = TRUE))
plot(density(tblCalData_West, bw = 'nrd0', kernal = 'gaussian', na.rm = TRUE))
plot(density(tblCalData_Total, bw = 'nrd0', kernal = 'gaussian', na.rm = TRUE), main = "")

#lines added to an existing graph/plot
lines(density(tblCalData_Total, bw = 'UCV', kernal = 'gaussian', na.rm = TRUE), lty = 3)


#Boxplot
boxplot(iCalData_East)
boxplot(iCalData_West, names = c('Count'), xlab = 'HeadCount', ylab = 'Value', range = 0, col = 'sienna1')
boxplot(iCalData_East, iCalData_West, names = c('East', 'West'), xlab = 'HeadCount', ylab = 'Value', range = 0, horizontal = FALSE, col = 'sienna1')
title("CAL HEAD COUNT")
# this is better
boxplot(iCalData_East, iCalData_West, names = c('East', 'West'), xlab = 'Value', ylab = 'CAL Side', range = 0, horizontal = TRUE, col = 'sienna1')
title(expression(bold("CAL HEAD COUNT")))
boxplot(iCalData_East,iCalData_West, iCalData_Total)
# Addming a legend
legend(x = 'topright', y = NULL, legend = c("CAL East","CAL West"), fill = NULL, col = 'sienna1', bty = 'n')

# Scatter Plots
plot(iCalData_East, xlim = c(0, 1500), ylim = c(0, 40), pch = 21, col = 'blue')
#adding a legend
legend(x = 'topright', y = NULL, legend = "Scatter Plot", fill = NULL, col = 'sienna1', bty = 'n')

#Pie Chart
pie(iCalData_Total, clockwise = TRUE)
#################################################
# !NEEDS RESEARCH!
# Quantile-Quantile Plot
# use qq()
#################################################
#
# When performing sampling/resampling
# use the set.seed() to make the analysis reproducible.
# set.seed() will allow the same results each time.
#
#Sampling & Re-Sampling
#################################################
# Sampling
sample(iCalData_East, size = 100, replace = TRUE)
sample(iCalData_West, size = 100, replace = TRUE)
sample(iCalData_Total, size = 100, replace = FALSE)

#create a resample function
resample <- function(x, ...) x[sample(length(x), ...)]
# examples
resample(iCalData_East[iCalData_East > 25], size = 10, replace = FALSE)
resample(iCalData_West[iCalData_West > 25], size = 10, replace = FALSE)
resample(iCalData_Total[iCalData_Total > 50], size = 10, replace = FALSE)
#
# Types of sampling functions
# rbinom, pbinom, qbinom, dbinom 
rbinom(iCalData_Total, 10, .05)
#
#Hypothesis Testing
#################################################
#Testing for Normal Distribution using Shapiro Test
shapiro.test(iCalData_East)
shapiro.test(iCalData_East)
#Other Normal Distribution Tests
#require('nortest')
#ad.test		Anderson-Darling test for normality
#cvm.test		Cramer-von Mises test for normality
#lillie.test	Lilliefors (Kolmogorov-Smirnov) test for normality
#pearson.test	Pearson chi-square test for normality
#sf.test		Shapiro-Francia test for normality
#
# Simple F Test to compare two variances
var.test(CalData$East, CalData$West)
#
# T Test (Student's T Test)
t.test(iCalData_East, iCalData_West, var.equal = FALSE, mu = 0, alternative = 'two.sided', conf.level = 0.95, paired = FALSE)
t.test(iCalData_East, iCalData_West, var.equal = FALSE, mu = 0, alternative = 'greater', conf.level = 0.95, paired = FALSE)
t.test(iCalData_East, iCalData_West, var.equal = TRUE, mu = 0, alternative = 'two.sided', conf.level = 0.95, paired = FALSE)
# One-Sample T Test
t.test(iCalData_Total, mu = 10) 
t.test(iCalData_Total, mu = 15, alternative = 'greater') 
#compare two means
t.test(iCalData_East, iCalData_West, paired=TRUE, conf.level = 0.98)

#Wilcoxon U-Test (Mann-Whitney)
wilcox.test(iCalData_East, iCalData_West)
wilcox.test(iCalData_East, iCalData_West, mu = 0, alternative = 'two.sided', conf.int = TRUE, conf.level = 0.95, correct = TRUE, paired = FALSE, exact = NULL)
wilcox.test(iCalData_East, iCalData_West, Exact = FALSE, paired = TRUE)
# one sided
wilcox.test(iCalData_Total, mu = 15, exact = FALSE, conf.int = TRUE, alternative = 'less')
# two samples nonparametrically --doesn't have to be a normal distribution, only same shapes 
wilcox.test(iCalData_East, iCalData_West, paired = TRUE)

#Correlation & Covariance
cor(iCalData_East, iCalData_West)
cov(iCalData_East, iCalData_West)
round(cov(iCalData_East, iCalData_West), digits = 2)

cor.test(iCalData_East, iCalData_West)
cor.test(iCalData_East, iCalData_West, method = 'spearman')
cor.test(iCalData_East, iCalData_West, method = 'kendall')
# Significance Testing in Correlation Tests
cor.test(iCalData_East, iCalData_West)

#Chi-Square Test
chisq.test(iCalData_East, iCalData_West)
chisq.test(iCalData_East, iCalData_West, simulate.p.value = TRUE, B = 100)

#Kolmogorov­Smirnov test (Testing two samples for same distribution)
ks.test(iCalData_East, iCalData_West)
#

#ANOVA
#Fit an Analysis of Variance Model
# used to compare models for simple or multiple regression.
# Using scale() uses the standardized coefficients rather than the unstandardized coefficients.
# Stack EAST and WEST
sCalData <- stack(list(East = iCalData_East, West = iCalData_West))
#can check the names for the columns
names(sCalData)
aov(values ~ ind, data = sCalData)
#################################################
#Distributions
#Basic random number generator
runif(1)
runif(100, min=1, max=100)
#sampling
sample(CalData$Total, 1)
sample(c(0,1), 8, replace=TRUE) #random byte
sample(c(0,1), 8, replace=TRUE, prob=c(0.45,0.55))	#biased towards 1
#another way 
rbinom(8, 1, .5)	#random byte
dbinom(1, size=8, prob=.5)	#probability discrete distribution
pbinom(1, size=8, prob=.5)	#cumulative probability
pnorm(25, mean(CalData$Total, na.rm = TRUE), sd(CalData$Total, na.rm = TRUE)) #normal distribution

