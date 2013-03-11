# Information-subAuthor ---------------------------------------------------
##########################################################################
# AUTHOR:	David Geeraerts
# EMAIL:	geeraerd@evergreen.edu
# LOCATION:	Olympia, Washington U.S.A. 
# TITLE:	Learning R
# Version:	29
# Purpose: Using CAL HeadCount as learning data
# Copyright License: Creative Commons: Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0)  
# http://creativecommons.org/licenses/by-nc-sa/3.0/
#
# Getting an ideal sample size
library('gtools')
SampleSize = function(a,d) { -log(d/2)/(2*a^2) }
sig = function(a,n) { pbinom(floor(n*0.5)-floor(n*a),size=floor(n),prob=0.5) }
binomsize = function(a,d) { 
  r=c(1,2*estimate(a,d))
  v=binsearch(function(n) {sig(a,n) - d},range=r,lower=min(r),upper=max(r))
  v$where[[length(v$where)]] }
#
#create a resample function
resample = function(x, ...) x[sample(length(x), ...)]
#
  