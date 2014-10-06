# Author Information ----------------------------------------------------------
#
# AUTHOR:	David Geeraerts
# EMAIL:	geeraerd@evergreen.edu
# LOCATION:	Olympia, Washington U.S.A. 
# TITLE:	Learning R
# Version:	42


# Purpose: Using The Evergreen State College, Computer Applications Lab (CAL)
#	HeadCount to learn R. Single file to keep it simple,
#	even though using Project Template is a good idea
#	Project Template is an R package which defines the folder structure
#	for a project.
#
# Copyleft --------------------------------------------------------------------
# Copyright License, Creative Commons:
# Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0)  
# http://creativecommons.org/licenses/by-nc-sa/3.0/


# Data Types ------------------------------------------------------------------
# Types of structures
# 
# vector		--one dimension
# factor		--used for qualitative variables
# matrix		--two dimensions
# array			--three or more dimensions | is.array()
# list			--different classes
# data frame	--multiple vectors with possible different classes
# NA			--missing values


# Types of Data or modes ------------------------------------------------------
#
# vector	is.atomic()
# vector	is.vector()
# Numeric 	{is.integer() is.double()}
# Text 		is.character()
# Factor	is.factor()
# Function	is.function()
# List		is.list()
# Complex	is.complex() #imaginary value i.
# NA		is.na()


# Vector Chart ----------------------------------------------------------------
#	(or class)
#	typeof		Mode		storage.mode
#
#	logical		logical		logical
#	integer		numeric		integer
#	double		numeric		double
#	complex		complex		complex
#	character	character	character
#	list		list		list
#	raw			raw			raw


# Notes -----------------------------------------------------------------------
# 
# !! R IS CASE SENSITIVE !!
#
# R is case sensitive. Can use tolower() or toupper() for munging data.
# \\ to escape special characters
# variables should only use alpha numeric characters, . (period),
#	and _ (underscore); recommend to only use underscore "_"
#	for variable objects.
#	Periods are used with functions, such as "data.frame".
# Using ' (single quote) or the " (double quote) treats as string;
# 	to get at a character function such as + - / ? < > etc.,
#	the ` (tick) needs to be used: `+`


# Packages of note ------------------------------------------------------------
#
# 'random'			uses random.org to generate non-deterministic random numbers
# 'plyr'			Tools for splitting, applying and combining data
# 'reshape2'		modern data wrangling package
# 'stringr'			string manipulation
# 'sig' 			Print function signatures
# 'XML' 			scraping tool for html & XML pages
# 'XML2R'			XML parse
# 'httr' 			working with HTTP connections
# 'RMySQL' 			for MySQL connections
# 'bigmemory' 		for handling large datasets too big for RAM
# 'knitr' 			enables R Markdown files --> .rmd file
# 'futile.logger' 	logging package


# Packages for advanced graphing ----------------------------------------------
#
# ggplot2		based on grammer graphics
# igraph		creating undirected and directed graphs


# Packages for Spatial analysis -----------------------------------------------
#
# 'ggmap'			Use Google maps API, OpenStreet map API.
# 'OpenStreetMap'	use OpenStreetMap raster images
# 'maps'			provides some basic world maps
# library(maps)
# map("state", boundary = FALSE, col="gray", add = TRUE)
# 'UScensus2010'	US Census 2010 shape files and additional demographic data


# Tips&Tricks ---------------------------------------------------
#
# TAB for command completion
# Esc interrupt current command (i.e. when console is waiting for input by showing +
# Ctrl+up command history
# Ctrl+L clear console


# Conditional checks
# (contain text in quotes, i.e. "text" == "text") #will return TRUE
# == 	equals condition
# != 	not equal condition
# <		less than
# >		greater than
# >=	greater than or equal
# <=	less than or equal
# ! 	not
# &		and (use single inside index [] for subsetting)
# |		or	(use single inside index [] for subsetting)
# &&	and (can also be written as single character "&")
# ||	or	(can also be written as single character "|")
# all	logical test that all values are true
# any	logical test that some values are true


# Subsetting data basics ------------------------------------------------------
# Working with R index/indices
# []	single bracket used to extract an object of the same class, and more than one element. 
# [[]]	double bracket used to extract from a list or data frame, and only a single element.
#		use double bracket when using computed indices within an index:
#		z <- matrix(c("zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"), nrow = 10, ncol = 10)
#		f <- z[,10]
#		i <- f[[1]]
# $		used to extract elements from a list or data frame.


# CRANberries -----------------------------------------------------------------
# is a website that keeps track of all CRAN package updates
# http://dirk.eddelbuettel.com/cranberries/


# Help ------------------------------------------------------------------------
# Great help resource
# http://en.wikibooks.org/wiki/R_Programming
# see the latest R version changes
View(news())

# help on functions
help(c)
help(install.packages)
# getting help on a package
help(package=stringr)

# Example code
example(help)
# open help page as a document
library(help="psych")
# vignette, for examples of functions
vignette()


# R Version Information
# simple
getRversion()
# Returns variable values
R.Version()
# more session information
sessionInfo()
# Type of OS
.Platform$OS.type
#
# get list of options
options()


# Package Management ---------------------------------------------------
# http://cran.r-project.org/
#
#
# Package Packrat() can package up all dependent packages for a project with specific versions in a sandbox area that will not affect the local package installation.   
#
# list or search installed packages
search()
#
# where are packages stored
.libPaths()
# can also be used to set the directory location of packages
# .libPaths("C:/ProgramData/R/library")
#
installed.packages()
# load a package
# library('packageName')
# require('packageName')
# Install
install.packages('psych')
library(psych)
# Install a package with any dependencies --depend on/link to/import/suggest
install.packages('ggplot2', dependencies = TRUE)
library(ggplot2)
# uninstall a package
# remove.packages("psych")
#
# http://cran.r-project.org/web/views/
# CRAN Task Views
# have to install and load ctv first
install.packages("ctv")
library("ctv")
available.views()
# install all of the packages associated with a Task View
install.views("TimeSeries")
# update any packages associated with a Task View
update.views("TimeSeries")


# System Utilities ---------------------------------------------------
#
# additional functions
library("R.utils")
# very powerful feature of R is to leverage Windows command-shell or GNU/Linux BASH
system("hostname")
system("whoami")
#OR
shell("hostname")
# shell.exec() can be used to open a file
# shell.exec("D:/Workspace/file.txt)
# shell.exec("D:\\Workspace\\file.txt)
#
# To time the execution of any script
# uses proc.time()
startTimer <- proc.time()
proc.time() - startTimer


# System variables ------------------------------------------------------------
Sys.getenv()
Sys.getenv("R_HOME")
Sys.getenv("R_LIBS_USER")
memory.limit()
memory.size()
memory.limit() - memory.size()	#available memory
memory.profile()
# garbage collection
# should happen automatically, but can be called manually. Good for getting memory usage.
gc()
#
# System Memory and Objects ----------------------------------------------------------
# get memory usage for an object
object.size(date)                   

#dump to file
# not the best
cat(paste(Sys.getenv()), sep = "\r", fill = TRUE, label = paste(names(Sys.getenv())), append = FALSE, file="System.variables.txt")
# best way and formated
cat(paste(names(Sys.getenv()), "=", Sys.getenv()), sep = "\r", fill = TRUE, label = NULL, append = FALSE, file="System.variables.txt")


# System Date & Time -----------------------------------------------------------------
Sys.Date()
Sys.time()
Sys.timezone()
# expressions can be grouped together with the use of {exp();exp()...}
{Sys.Date();Sys.time()}
#
# build in function returns date & time as character string
date()
# conditional checking
is.vector(date()) && is.character(date()) && is.numeric.POSIXt(date())	#returns false, not a POSIXt, just a vector character string.
# POSIX format
as.POSIXlt(Sys.time(), tz = "GMT")
as.POSIXct(Sys.time())
format(Sys.time(), "%a %b %d %X %Y %Z")
# long format
format(Sys.time(), "%A %B %d %X %Y %Z")
#time with miliseconds
format(Sys.time(), "%H:%M:%OS3")
#
# Get the current day of the week
format(Sys.time(), "%A")
#
# see that Sys.Date() is class date
# {numeric, logical, character, list, matrix, array, factor, data.frame}
class(Sys.Date())
# see what storage mode Sys.Date() is
# {logical, numeric, complex, character, list (only for object list), or raw}
mode(Sys.Date())
storage.mode(Sys.Date())
#
# Find out how long execution takes
system.time(pie(rep(1, 12), col = rainbow(12)))
# Pause for specified time (in seconds)
Sys.sleep(10)


# Time Series -----------------------------------------------------------------
# Packages: ts, lubridate, chron, 
if(require('chron')==FALSE) install.packages('chron')
if(require('lubridate')==FALSE) install.packages('lubridate')
if(require('ts')==FALSE) install.packages('ts')


# Output Controls -------------------------------------------------------------
#
# Console Message
message("text")
# warning message
warning()
#
# Output to a log file using sink()
# see if there are any open connections
sink.number()
# start a sink connection to a file
sink("R-Output.log.txt", append = TRUE, split = FALSE)
# close the connection
sink()
# Check connection is closed
sink.number()
#
# Output to... {pdf, png, svg, jpg, etc.}
# display list of graphical devices
?Devices
# example: svg(file="myImageFile.svg", height=4,width=8)
# ...followed by creating a plot/graph.
# close device connection(s)
dev.off()
#
# Setting values (best practice is the use of <-
# x <- 1
# assign("x", C(x,y,z)
#
#getting user input
om <- "Your Selection:"	#output message
x <- readline(prompt = "User Input (Y or N) : ")
if (x == 'Y' || x == 'y') cat(c(om,"Yes")) else cat (c(om,"No"))


# Working with directories ----------------------------------------------------
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


# Objects ---------------------------------------------------------------------
# Return all objects that have been instantiated
objects()
character() #any objects that are character
numeric()	#any objects that are numeric
#
# list all instantiated objects
ls()
# quickly remove all instantiated objects
rm(list=ls())
#
# Example, Connection
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


# Built in R data sets --------------------------------------------------------
data()


# Manual data frame -----------------------------------------------------------
# an example of creating a data frame manually
# uses CAL-Usage-Audit data
# https://docs.google.com/spreadsheet/ccc?key=0AjQL08YDc6cUdGsxMzJodUpYYXJ3bFdGcXFTbkFuVVE&usp=sharing
# Google URL shortner (http://goo.gl/)
# http://goo.gl/kH0PfD
#
# Column variables, populate data
year <- as.ts(c("2012", "2012", "2013", "2013", "2013"))	#without as.ts, it's loaded as a factor.
quarter <- c("Spring", "Fall", "Winter", "Spring", "Fall")
total_reservations <- as.numeric(c("128", "152", "125", "153", "127"))	#without as.numeric, it's loaded as a factor.
total_hours_scheduled <- as.ts(c("306:15:00", "505:00:00", "411:00:00", "545:30:00", "395:00:00"))	#without as.ts, it's loaded as a factor.
total_hours_used <- as.ts(c("231:15:00", "386:15:00", "308:30:00", "374:45:00", "241:05:00"))	#without as.ts, it's loaded as a factor.
no_show_count <- as.numeric(c("34", "28", "26", "37", "33"))	#without as.numeric, it's loaded as a factor.
# create the data frame
faculty_usage <- data.frame(year, quarter, total_reservations, total_hours_scheduled, total_hours_used, no_show_count)
faculty_usage
View(faculty_usage)	#view in table format
#structure of the data frame
str(faculty_usage)	 #note that without using "as.", all columns would be factors.
faculty_usage
# adding additional columns
faculty_usage$percent_no_show <- (no_show_count / total_reservations) * 100
round(faculty_usage$percent_no_show, digits = 1)
faculty_usage$percent_no_show <- round(faculty_usage$percent_no_show, digits = 1)




# CAL HEAD-COUNT DATA, Working with -------------------------------------------
#
# Get the data from Google docs
# Source File
# https://docs.google.com/spreadsheet/ccc?key=0AjQL08YDc6cUdDNxbWJTLU5RZUt6ZVlRN1Y0c3hVTlE#gid=0
# 
# "Log" worksheet as a csv file.
# URI for csv file
# https://docs.google.com/spreadsheet/pub?key=0AjQL08YDc6cUdDNxbWJTLU5RZUt6ZVlRN1Y0c3hVTlE&single=true&gid=0&output=csv
#
#
# Load the CSV file into a variable; read.table() is common for text files {.txt}; scan() is the most primitive form of reading data from a file into a variable.
# Create a Timestamp for laoding the data
LastLoadTimestamp_CalData <- as.POSIXct(Sys.time())
# Get the difference between last load and current time
as.POSIXlt(Sys.time()) - LastLoadTimestamp_CalData
# assumes a project template layout
setwd("D:/Workspace/R/CAL-HeadCount")
CalData <- read.csv('./data/CAL-HeadCount.csv', sep = ',', header = TRUE)	#if tab use sep='/t'
# or to automate the process
URI <- "https://docs.google.com/spreadsheet/pub?key=0AjQL08YDc6cUdDNxbWJTLU5RZUt6ZVlRN1Y0c3hVTlE&single=true&gid=0&output=csv"
download.file(URI,"CAL-HeadCount.csv","internal")
CalData <- read.csv('CAL-HeadCount.csv', sep = ',', header = TRUE)	#if tab use sep='/t'
#
# Check the last few records of the dataset
tail(CalData, 10)
# To remove the total column --since its a calculated field
rmtCalData <- CalData[,-6] #remove column #6 (which is the total column)
#or
CalData <- CalData[,-6]
#
# How was the data loaded? The data was loaded as a list.
typeof(CalData)
is.matrix(CalData)
is.list(CalData)
# better to load CalData as a data frame
CalData <- as.data.frame(CalData)
is.date.frame(CalData)
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
# look at the data in table format
View(CalData)
#
# view headers in source order
names(CalData)
# Double check that columns are the expected default data type
is.numeric(CalData$East)	#should be TRUE
is.numeric(CalData$West)	#should be TRUE
is.numeric(CalData$Total)	#should be TRUE
is.character(CalData$Counter) # false since its a factor
#
# List the headers (in alpha-Numeric order)
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
# Class object?
class(CalData)
# Mode of object --the storage mode of object
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
# remove "Total" from the list
iCalData[["Total"]] <- NULL
#
# Create a unique list for the counters
# see the list first
levels(CalData$Counter)
list(CalData$Counter)
# 
Counters <- levels(CalData$Counter)
#
# make all the initials in Counter uppercase
toupper(CalData$Counter)
#
# Can rename variables such as column names
names(CalData)[1] <- "Initials"
names(CalData)[1] <- "Counters"
#
# Working with CalData Data Frame
# specify to use a data frame
dfCalData = data.frame(CalData)
# view the structure
str(dfCalData)
str(CalData)
#
# Working with Dates
class(CalData$Date)	# shows that its a factor
dCalData_Date <- as.Date(CalData$Date, format = "%m/%d/%Y")
class(dCalData_Date)	#date class
dCalData_Date[1]	#will return the first date
as.integer(dCalData_Date)
# OR
iCalData_Date <- as.integer(as.Date(CalData$Date, format = "%m/%d/%Y"))
# POSIXlt creates parts to the date; human readable vs POSIXct
dCalData_Date = as.POSIXlt(CalData$Date, format = "%m/%d/%Y")
dCalData_Date$mday	#day of the month
dCalData_Date$mon	#Month
dCalData_Date$year + 1900	#year (since 1900)
dCalData_Date$wday	#day of the week
dCalData_Date$yday	#day of the year
# Getting the difference between two dates
# in this case the first count to the last count
difftime(dCalData_Date[1], dCalData_Date[length(dCalData_Date)])
difftime(dCalData_Date[1], tail(dCalData_Date,1))


# CAL Working with Time -----------------------------------------------------------
#
# Packages to work with time series
# chron,
#
#
if(require('chron')==FALSE) install.packages('chron')
library('chron')
#
# check columns Date & Time
is.ts(CalData$Date)
is.ts(CalData$Time)
is.chron(CalData$Date)
is.chron(CalData$Time)
#
class(CalData$Date)	#is a factor that needs to be changed
class(CalData$Time)	#is a factor that needs to be changed
#
CalData$Date <- as.ts(CalData$Date)
CalData$Time <- as.ts(CalData$Time)


dCalData_Time <- chron(times = CalData$Time)
class(dCalData_Time)	#is now a times class
# Create a single timestamp string
dCalData_TimeStamp <- paste(dCalData_Date, dCalData_Time)
difftime(dCalData_TimeStamp[1], dCalData_TimeStamp[2])
difftime(tail(dCalData_TimeStamp, 2)[1], tail(dCalData_TimeStamp, 2)[2])
#
# ??????????????????????????????????????
# !NEEDS RESEARCH!
# using timeDate package#
if(require('timeDate')==FALSE) install.packages('timeDate')
library('timeDate')
# dCalData_Time <- as.timeDate(dCalData_Time)
# class(dCalData_Time)	#is now a timeDate
# ??????????????????????????????????????
#
# show the first record with all columns
CalData[1,1:6]
# Show the first 10 records, all
CalData[1:10,1:6]
# Show all the data for a cloumn
CalData[,6]
# Using operators within the index
# get a record set without 0's
CalData$East[CalData$East > 0]
CalData$West[CalData$West > 0]
# create an adjusted variable excluding 0's
adjCalData_East <- CalData$East[CalData$East > 0]
adjCalData_West <- CalData$West[CalData$West > 0]
adjCalData_Total <- CalData$Total[CalData$Total > 0]


# CAL Subsetting data -------------------------------------------------------------
#
# show the first 6 records or n records; last 6 records
head(CalData)
head(CalData, n = 10)
tail(CalData)
#Sort/Order/Rank the Data Frame
Counters[order(Counters, na.last = TRUE, decreasing = FALSE)]
sort(CalData[,6])
order(CalData[,6])
rank(CalData[,6])
#
subset(CalData, CalData$East > 25)
subset(CalData, CalData$Counter == "DG")
subset(CalData, CalData$Counter == "DG" & CalData$East > 25)
#or
counterDG <- CalData[CalData$Counter == "DG",]
#
# Find the number of times a counter made an observation
nrow(subset(CalData, CalData$Counter == "DG"))
# multiple conditions
## subset to when no one was present
CalData[CalData$East == 0 & CalData$West == 0,]
nrow(CalData[CalData$East == 0 & CalData$West == 0,])
# subset when no one was present on one side using OR operator "|"
CalData[CalData$East == 0 | CalData$West == 0,]
nrow(CalData[CalData$East == 0 | CalData$West == 0,])
#
# Get sums of columns
with(CalData, sum(Total))
with(CalData, sum(East))
with(CalData, sum(West))


# CAL statisitical summary ----------------------------------------------------
#
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
# min
min(CalData$East, na.rm = TRUE)
min(CalData$West, na.rm = TRUE)
min(CalData$Total, na.rm = TRUE)
# max
max(CalData$East, na.rm = TRUE)
max(CalData$West, na.rm = TRUE)
max(CalData$Total, na.rm = TRUE)
# range
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
# na.fail returns only if there are no NA's
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
any(CalData$Counter == "DG")
any(CalData$Counter == "na")
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
# Tukey Five-Number Summaries
# (minimum, lower-hinge, median, upper-hinge, maximum)
fivenum(CalData$East, na.rm = TRUE)
fivenum(CalData$West, na.rm = TRUE)
fivenum(CalData$Total, na.rm = TRUE)
# cumulative statistics
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
# Apply summary to a list
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

# Transpose the data: X(row) becomes Y(column), Y(Column) becomes X(row)
CalData_t = t(CalData)

# Create contingency tables
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
# Test is.table
is.table(CalData)
is.table(iCalData)
is.table(maxCalData)
is.table(minCalData)
is.table(meanCalData)
is.table(tblCalData_total)
is.table(tblCalData_East)
is.table(tblCalData_West)
# also
is(tblCalData_East, 'table')
is(tblCalData_West, 'table')
is(tblCalData_Total, 'table')

# will return false because its a list
is.table(lsCalData)
# IF condition
if(class(lsCalData) == 'list') TRUE else FALSE
if(class(lsCalData) == 'table') TRUE else FALSE
# get proportions from table
prop.table(tblCalData_East)
prop.table(tblCalData_West)
prop.table(tblCalData_Total)


# K-Means clustering
# define the number of desired clustered groups
kmeans(CalData$East, 3)
kmeans(CalData$West, 3)


# Visualization (Plots and Graphs) --------------------------------------------
#
# Cairo high quality PNG,JPEG,TIFF,SVG,PDF
# Advanced graphing with ggplot2 install.packages('ggplote2')
# Documentaion for ggplot2
# http://docs.ggplot2.org/current/index.html
#
# Advanced dynamic graphing with rggobi install.packages('rggobi')
# par() can modify default graphics parameters
# type par() to see current settings and available elements
#
# For a given plot to find a point
# clicks on the plot will be recorded and the points displayed once locator() is escaped.
# locator()
#
#
# PLAYWITH
# Playwith package provides a GUI interface to manipulate graphs in R
if(require('playwith')==FALSE) install.packages('playwith')
library('playwith')
#
# Example
# playwith(hist(CalData$Total))
#
#GrapheR
# GUI package to help with graphing in R
if(require('GrapheR')==FALSE) install.packages('GrapheR')
library('GrapheR')
#
# Example
# run.GrapheR()
#
#
# Titles, Legends, and Text
#
# Title
# title(main = "main title", sub = "sub title")
#
# Legend
# position can be "bottomleft", "bottomright", "topleft", "topright" 
# legend(x = 'topright', y = NULL, legend = c("CAL East","CAL West"), fill = NULL, col = 'sienna1', bty = 'n')
#
# Text in margins
# mtext() puts some texts in the margin. The margin can be at the bottom (1), the left (2), the top (3) or the right (4).
# ; mtext("some text", side = 1) # the bottom
# Example
# hist(CalData$Total) ; mtext("bottom text", side = 1)
#
# use colors() to get possible color values.
colors()
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
	 
# Density plotting
density(tblCalData_East, bw = 'nrd0', kernal = 'gaussian', na.rm = TRUE)
density(tblCalData_West, bw = 'sf', kernal = 'gaussian', na.rm = TRUE)
density(tblCalData_Total, bw = 'UCV', kernal = 'gaussian', na.rm = TRUE)

plot(density(tblCalData_East, bw = 'nrd0', kernal = 'gaussian', na.rm = TRUE))
plot(density(tblCalData_West, bw = 'nrd0', kernal = 'gaussian', na.rm = TRUE))
plot(density(tblCalData_Total, bw = 'nrd0', kernal = 'gaussian', na.rm = TRUE), main = "")

# lines added to an existing graph/plot
lines(density(tblCalData_Total, bw = 'UCV', kernal = 'gaussian', na.rm = TRUE), lty = 3)


# Boxplot
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

# Pie Chart
pie(iCalData_Total, clockwise = TRUE)
#
# !NEEDS RESEARCH!
# Quantile-Quantile Plot
# use qq()
#
#
# When performing sampling/resampling
# use the set.seed() to make the analysis reproducible.
# set.seed() will allow the same results each time.
#
# Sampling & Re-Sampling
#
# Sampling
sample(iCalData_East, size = 100, replace = TRUE)
sample(iCalData_West, size = 100, replace = TRUE)
sample(iCalData_Total, size = 100, replace = FALSE)

# create a resample function
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
# Hypothesis Testing
#
# Testing for Normal Distribution using Shapiro Test
shapiro.test(iCalData_East)
shapiro.test(iCalData_East)
# Other Normal Distribution Tests
# require('nortest')
# ad.test		Anderson-Darling test for normality
# cvm.test		Cramer-von Mises test for normality
# lillie.test	Lilliefors (Kolmogorov-Smirnov) test for normality
# pearson.test	Pearson chi-square test for normality
# sf.test		Shapiro-Francia test for normality
#
# Simple F Test to compare two variances
var.test(CalData$East, CalData$West)

# T Test (Student's T Test)
t.test(iCalData_East, iCalData_West, var.equal = FALSE, mu = 0, alternative = 'two.sided', conf.level = 0.95, paired = FALSE)
t.test(iCalData_East, iCalData_West, var.equal = FALSE, mu = 0, alternative = 'greater', conf.level = 0.95, paired = FALSE)
t.test(iCalData_East, iCalData_West, var.equal = TRUE, mu = 0, alternative = 'two.sided', conf.level = 0.95, paired = FALSE)
# One-Sample T Test
t.test(iCalData_Total, mu = 10) 
t.test(iCalData_Total, mu = 15, alternative = 'greater') 
# compare two means
t.test(iCalData_East, iCalData_West, paired=TRUE, conf.level = 0.98)

# Wilcoxon U-Test (Mann-Whitney)
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

# Chi-Square Test
chisq.test(iCalData_East, iCalData_West)
chisq.test(iCalData_East, iCalData_West, simulate.p.value = TRUE, B = 100)

# Kolmogorov?Smirnov test (Testing two samples for same distribution)
ks.test(iCalData_East, iCalData_West)

# ANOVA
# Fit an Analysis of Variance Model
# used to compare models for simple or multiple regression.
# Using scale() uses the standardized coefficients rather than the unstandardized coefficients.
# Stack EAST and WEST
sCalData <- stack(list(East = iCalData_East, West = iCalData_West))
# can check the names for the columns
names(sCalData)
aov(values ~ ind, data = sCalData)
#
# Distributions
# Basic random number generator
runif(1)
runif(100, min=1, max=100)
# sampling
sample(CalData$Total, 1)
sample(c(0,1), 8, replace=TRUE) #random byte
sample(c(0,1), 8, replace=TRUE, prob=c(0.45,0.55))	#biased towards 1
# another way 
rbinom(8, 1, .5)	#random byte
dbinom(1, size=8, prob=.5)	#probability discrete distribution
pbinom(1, size=8, prob=.5)	#cumulative probability
pnorm(25, mean(CalData$Total, na.rm = TRUE), sd(CalData$Total, na.rm = TRUE)) #normal distribution
#
#
# End Of File (EOF) -----------------------------------------------------------
# common end of file tasks
#
#
# save the R session
save.image(file="D:/Workspace/R/CAL-HeadCount/CAL-HeadCount.rda")
# Quite without saving session.
q("no")
# The End