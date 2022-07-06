## ECON 379:  PROGRAM EVALUATION FOR INTERNATIONAL DEVELOPMENT
## PROFESSOR PAMELA JAKIELA
## EMPIRICAL EXERCISE 1

# ***************************************************************************
#   This exercise makes use of the data set E1-CohenEtAl-data.dta, 
# a subset of the data used in the paper "Price Subsidies, 
# Diagnostic Tests, and Targeting of Malaria Treatment: Evidence from a 
# Randomized Controlled Trial" by Jessica Cohen, Pascaline Dupas, and Simone 
# Schaner, published in the American Economic Review in 2015.  
# 
# The authors examine behavioral responses to various discounts (""subsidies) 
# for malaria treatment, called "artemisinin combination therapy" 
# or "ACT."
# ******************************************************************************
  
## This is an example of a comment in R


## change working directory as appropriate to where you want to save. Note that
## you must use double backslashes here.
setwd("C:\\Users\\jcpat\\OneDrive\\Documents\\R")

## check if you made it to the correct directory
list.files()

## Next, we'll have to load the data from the course website. There are two
## ways of doing this, but you only have to choose one. Firstly, you could just run these three lines:

library(readr)
fileUrl <- "https://raw.githubusercontent.com/pjakiela/IE-in-R/gh-pages/E1-CohenEtAl-data.csv"
E1data <- read_csv(url(fileUrl))

## If you were successful, you'll now see something called 'E1Data' in the 'Data'
## section of RStudio, which should be in the top right corner of your screen.

## Alternatively, you could visit the 'Empirical Exercise 1' page from which you
## downloaded this file and
## click on 'E1-CohenEtAl-data.dta' link on the first line of the page. Now, this
## file is in your 'Downloads' folder. Next, in RStudio, navigate to the 'File'
## tab and select 'Import Dataset' and then 'From Stata'. A new window should
## appear. Click the 'Browse' button in the top right corner of this window,
## find 'E1-CohenEtAl-data.dta' in your 'Downloads' folder, and select it.
## You should now be back at the window where you clicked 'Browse'. Finally,
## click 'Import' in the bottom corner of that window, and you've successfully
## imported the data! You can verify that the data was loaded by checking if 
## 'E1_CohenEtAl_data' appears in the 'Data' section of RStudio, which should be
## in the top right corner of your screen.

# As you answer the following questions, write your commands in the do file,
# so that you could run the whole file and (re)generate all of your answers.
  
# 1. How many observations are in the data set?

  
# 2. What is the mean of the variable act_any (to three decimal places)?
# The variable act_any is a dummy for assignment to any treatment (positive subsidy)
 

# 3. How many people received a positive subsidy?


# 4. What is the standard deviation of the variable c_act?
# The variable c_act is a dummy for using ACT treatment during a malaria episode

 
# 5. How many respondents report using ACT treatment for malaria?

   
# 6. Regress c_act on act_any.  What is the R-squared?

   
# 7. What is the coefficient associated with the act_any variable?

   
# 8. What is the associated standard error?

   
# 9. What do you get when you divide the coefficient by the standard error?

 
# 10. What is the t-statistic associated with the act_any variable?



