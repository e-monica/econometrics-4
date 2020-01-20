*=================================================================================
*Title: wage2_monica.do
*Author: Monica Elgawly
*Date Modified: 4/15/2018
*Assignment 4 Part 1
*=================================================================================

cap log close 
clear
set more off

*=================================================================================

*=================================================================================
*1a) Use the wage2.dta to estimate the following model where the return to education 
*depends upon the amount of work experience (and vice versa):
* log(wagei) = B0 + B1edu1 + B2experi + B3(educi)(experi) + ui
*Show that the marginal effect of another year of education equals B1 + B3exper. 
*Plug in the values of B1 and B3 to get the general form for the marginal effect 
*of education.

use "/Users/monicaelgawly/Downloads/wage2.dta"
gen educexper = educ*exper
reg lwage educ exper educexper, r

Take the derivative of the equation with regard to edu we get B1*B3*exper
From the regression estimate: 0.44 + .003*exper
*=================================================================================

*=================================================================================
*b) Test whether the return to education depends on the level of experience.

H0 = B3 = 0, Ha = B3 != 0
p-value of B3 hat indicates that B3 is statistically significant at 5% level.
*=================================================================================

*=================================================================================
*c) Now allow education, experience, job tenure, marriage status, race and geographic 
*location to determine wages by estimating the following model:
*log(wagei) = B0 + B1edui + B2experi + B3tenurei + B4marriedi + B5blacki + B6southi 
*+ B7urbani + ui. Report the results in standard form. Holding other factors fixed, 
*what is the approximate difference in monthly salary between married people and 
*nonmarried people? Is this difference statistically significant at the 5% level?

reg lwage educ exper tenure married black south urban, r

*=================================================================================

*=================================================================================
*d) Modify the model in part(c) by allowing log(wage) to differ across 4 groups of 
* people: married and black, married and nonblack, single and black, and single and 
*nonblack. What is the estimated wage differential between married nonblack people 
*and nonmarried nonblack people?

gen mb = 0
replace mb = 1 if married == 1 & black == 1
gen nmb = 0
replace nmb = 1 if married == 0 & black == 1
gen mnb = 0
replace mnb = 1 if married == 1 & black == 0
gen nmnb = 0
replace nmnb = 1 if married == 0 & black == 0

if Benchmark category is not married, not black
reg lwage educ exper tenure south urban mb nmb mnb, r
married, nonblack people earn on average 20% more than nonmarried nonblack

if Benchmark category is married, not black
reg lwage educ exper tenure south urban mb nmb nmnb, r
nonmarried, nonblack people earn on average 19% less than married nonblack 
*=================================================================================

*=================================================================================
*e) On a graph with education on the x-axis and log(wage) on the y-axis, draw the 
*sample regression functions for the four groups of people (1) married and black, 
*(2) married and nonblack, (3) single and black, and (4) single and nonblack, holding 
*constant experience, tenure, and geographic location (i.e., south and urban). You do 
*not need to create this graph in Stata, but you will use the results from part (d) 
*to draw the graph on paper.
*=================================================================================

clear
