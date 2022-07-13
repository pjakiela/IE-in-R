# ECON 523:  PROGRAM EVALUATION FOR INTERNATIONAL DEVELOPMENT
# PROFESSOR PAMELA JAKIELA
# EMPIRICAL EXERCISE 2:  THE EXPERIMENTAL IDEAL
# 
# ***************************************************************************
# This exercise makes use of the data set E1-CohenEtAl-data.dta, 
# a subset of the data used in the paper "Price Subsidies, 
# Diagnostic Tests, and Targeting of Malaria Treatment: Evidence from a 
# Randomized Controlled Trial" by Jessica Cohen, Pascaline Dupas, and Simone 
# Schaner, published in the American Economic Review in 2015.  
# 
# The authors examine behavioral responses to various discounts (""subsidies) 
# for malaria treatment, called "artemisinin combination therapy" 
# or "ACT."
# ******************************************************************************

# ** change working directory as appropriate to where you want to save
setwd("C:\\Users\\examplePerson\\OneDrive\\Documents\\R")

# ** load the data from the course website and the fixest package, which you'll
# need later:

library(fixest)
library(readr)
fileUrl <- "https://raw.githubusercontent.com/pjakiela/IE-in-R/gh-pages/E1-CohenEtAl-data.csv"
E2data <- read_csv(url(fileUrl))


# GETTING STARTED (TO BE DONE TOGETHER AS A CLASS)

  
#   key variables (review):
#   
#   - variables starting with b_ are baseline characteristics (measured before the RCT)
# use the command sum b_* to familiarize yourself with them
# 
# - act_any is a treatment dummy; act_any==0 is the control group
# 
# - c_act is a dummy for using ACT treatment the last time a HH member had malaria


  
# ** We are going to test whether individuals *in the control group* who use ACT
# when they have malaria (i.e. individuals with `c_act==1`) differ from those in
# the control group who do not use ACT (i.e. those with `c_act==0`) in terms of 
# observable characteristics.  To focus on individuals in the control group, 
# we'll want to restrict ourselves to data points with `act_any==0` when answer
# the following questions.  

# Question 1  

# Use the t.test() function with the var.equal parameter set to TRUE 
# (i.e. t.test(y ~ x, var.equal = TRUE)) to test whether individuals in the control
# group who use ACT when they have malaria (i.e. individuals with c_act==1) differ
# from those in the control group who do not use ACT when they have malaria in terms
# of the educational attainment of their head of household. What R command would you
# use to do this?


# Question 2  
# 
# What is the mean level of (household head) educational attainment among
# individuals in the control gorup who **did not** use ACT the last time they
# had malaria?



# Question 3  
# 
# What is the mean level of (household head) educational attainment among
# individuals in the control gorup who **did** use ACT the last time they had
# malaria?



# Question 4  
# 
# What is the standard deviation of the level of (household head) educational
# attainment among individuals in the control group who **did** use ACT the 
# last time they had malaria?  



# Question 5  
# 
# Is there a statistically significant difference in educational attainment 
# between those (in the control group) who used ACT the last time they had 
# malaria and those who did not?  What is the p-value associated with this
# hypothesis test?



# Question 6  
# 
# What is the estimated difference in educational attainment between those
# (in the control group) who used ACT the last time they had malaria and 
# those who did not?  



# Question 7  
# 
# What is the standard error associated with the estimated difference in 
# educational attainment between those (in the control group) who used ACT 
# the last time they had malaria and those who did not? To find this, just
# tack $stderr onto the end of your t.test() command from Question 1 
# (i.e. t.test(y ~ x, var.equal = TRUE)$stderr). 


# Question 8  
# 
# To understand where this standard error comes from, remember that the mean
# value of b_h_edu among people who do (or do not) have c_act==1 is a random
# variable, as is the difference in means between those who have c_act==1 and
# those who have c_act==0. The variance of the difference of two independent
# random variables is the sum of their individual variances. Here, our 
# estimator of the variance of the difference in b_h_edu between those with 
# c_act==1 and those with c_act==0 is the sum of the variances of the 
# subgroup means; the estimated variance of each subgroup mean is the square 
# of the estimated standard error. If you used the results of your t.test() 
# function to calculate the standard error of the difference in means 
# "by hand" (by which I mean, using R to do arithmetic instead of using the 
# t.test() function), what answer would you arrive at?


# Question 9 
# 
# If you have answered Question 8 correctly, you might be wondering why the 
# standard error you just calculated differs (slightly) from the one reported
# by the t.test() function. The answer is that our "by hand" calculation did 
# not assume that the variance of b_h_edu was the same in both groups, but
# R's t.test() function imposes that assumption when the var.equal parameter
# is set to TRUE. Trying redoing your t.test(), removing the var.equal 
# parameter (i.e. t.test(y ~ x)). This will automatically set var.equal to 
# FALSE, as FALSE is its default value. What is the estimated standard error 
# on the difference in means now? It should match your answer to Question 8.  
  
  
# Question 10  
# 
# We can also test whether the mean of a variable (b_h_edu) is the same in 
# two groups by regressing it on a dummy characterizing the two groups. What
# command would you use to regress b_h_edu on c_act, restricting the sample
# to the control group in the RCT? Try using the feols() function from the
# fixest package that we loaded here instead of R's standard lm() function.
# It was designed for economists, and it'll make your life much easier! The
# basic syntax you should use is:
#
# feols(y ~ x, data = your_data_frame)
  
  
  
# Question 11  
# 
# When you run this regression, what is the estimated coefficient on `c_act`?  
  
  
  
# Question 12 
# 
# What is the estimated standard error associated with the coefficient on
# `c_act`?  
  
  
  
# Question 13 
# 
# How does the standard error from your regression compare to the standard
# error you got when you used the `t.test()` command?
  
  
# Question 14
# 
# When we run a simple OLS regression, R assumes that errors are
# homoskedastic (the variance of the error term does not vary across
# observations). As an alternative, we can add vcov = "hetero" as a 
# parameter of our feols() function 
# (i.e. feols(y ~ x, data = your_data_frame, vcov = "hetero")) to tell R to
# calculate heteroskedasticity-robust standard errors (which are the default
# in most applied microeconomic research). Rerun your regression with the 
# new vcov parameter. What is the estimated standard error associated with 
# the coefficient on c_act now?

# Question 15 
# 
# You might (quite reasonably) be surprised to learn that the standard error
# reported after an OLS regression with robust standard errors is not the
# same as the one we calculated ourselves using the formula. So, now we
# have three different standard errors! The robust standard error from
# Question 14 differs from the standard error that you calculated by hand
# in Question 8 because of a degrees of freedom correction -- the fixest
# package's robust standard errors are but one of several different 
# variants of the Huber-Eicker-White heteoskedasticity robust standard
# error. Run

feols(b_h_edu ~ c_act, data = E2_control, vcov = "HC1")

# and confirm that your standard error matches the answer to Question 8.
# What is that standard error?