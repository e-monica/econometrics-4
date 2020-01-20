*=================================================================================
*Title: LOANAPP_monica.do
*Author: Monica Elgawly
*Date Modified: 4/17/2018
*Assignment 4 Part 2
*=================================================================================

cap log close 
clear
set more off

*=================================================================================

*=================================================================================
*2. In 1975, the U.S. passed the Home Mortgage Disclosure Act. This law requires 
*all mortgage lenders to release annual data on all mortgage applications. One 
*goal of the act is to identify discriminatory lending--cases where banks do not 
*lend to individuals based on race or gender. The data set LOANAPP.dta contains a 
*random sample of loan applications from HDMA data. The variables are defined as 
*follows:

** approve is a dummy variable equal to one if the loan application is approved
** black, hispan, and male are dummy variables equal to one if the borrower is 
*black, hispanic or male respectively
** apr is the annual-percent rate on the loan (i.e. the interest rate) 
** term measures the length of time over which the loan will be paid off
** bankruptcy is a dummy variable equal to one if the individual has ever declared 
*bankruptcy
** gdlin is a variable equal to one if the borrower's credit history meets the lender's
** typical guidelines 
** hh_expenditures is a measure of household expenditures as a share of annual income 

*a) Estimate a linear probability model that relates loan approval rates to the 
*applicant's demographic characteristics (black, hispan, male), the loan 
*characteristics (apr, term), and the applicant's credit worthiness (bankruptcy, 
*gdlin, hh_expenditures). Interpret the coefficients on black, hispan and male. 
*Although we are interested in the relationship between demographics and loan approval, 
*why is it important to control for loan characteristics and credit worthiness?

use "/Users/monicaelgawly/Downloads/LOANAPP.dta"
reg approve black hispan male apr term bankruptcy gdlin hh_expenditures, r
*=================================================================================

*=================================================================================
*b) Find the predicted values based on the regression in part a. Summarize the distribution 
* of the predicted values. How does the average predicted approval rate compare to the 
* average actual approval rate? Do you notice anything unusual about the predicted values?
* Explain what you see.

predict y2
sum y2, detail
*(where xb should be assumed) 
*=================================================================================

*=================================================================================
*c) Repeat the regression in part a using only the regressors that are individually 
* statistically significant at the 10% level using t-tests. Do your results change 
* substantially? Are your results sensitive to dropping these controls? What might this 
* tell you about OVB?
reg approve black hispan gdlin, r 
*=================================================================================

*=================================================================================
*d) Estimate the relationship in part c using a probit model. What is the difference 
*in the probability of approval between black and nonblack applicants who meet the 
*borrowing guidelines (gdlin = 1)? How about the difference between hispanic and 
*non-hispanic borrowers? Do the results differ much from the linear probability model?

probit approve black hispan gdlin, r

*=================================================================================

*=================================================================================
*e) Repeat part d using a logit model instead of a probit model. Do your results change?
logit approve black hispan gdlin, r
*=================================================================================

*=================================================================================
*f) Based on your work in parts a through e, comment on the disadvantages and 
*advantages of using the linear probability model vs. probit/logit to estimate models 
*with binary dependent variables.

*=================================================================================

*=================================================================================
*g) Based on your work in parts a through e, what do you conclude about discrimination 
*by lenders?

*=================================================================================

clear
