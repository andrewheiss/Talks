* Super useful site for more complicated plots: 
* http://www.survey-design.com.au/Usergraphs.html

* Load data
use "export1.dta", clear


*--------------------------------------
*-------------------
* Univariate plots
*-------------------
*--------------------------------------
* Box plots
graph box antisocial2011
graph hbox antisocial2011
graph export "antisocial_histogram.pdf"  // Saving to a file...

* Histograms
histogram antisocial2011
histogram antisocial2011, bin(5)
histogram antisocial2011, bin(100)

* Density plots
kdensity antisocial2011

* Bar charts
ssc install catplot
catplot P12CACORNCategory
catplot P12CACORNCategory, percent


*------------------------------------------
*---------------------
* Multivariate plots
*---------------------
*------------------------------------------

*--------------------------
* Continuous + continuous
*--------------------------
* There are all sorts of things you can do with twoway:
* http://www.ats.ucla.edu/STAT/stata/modules/graph8/twoway/default.htm
* http://www.ats.ucla.edu/stat/stata/modules/graph8/intro/graph8.htm

* Scatter plots
graph twoway (scatter antisocial2011 burglary2011)

* Add more information
* See here: http://www.ats.ucla.edu/stat/stata/faq/graph_sep.htm
graph twoway (scatter antisocial2011 burglary2011 if SCIIurban3 == 1) (scatter antisocial2011 burglary2011 if SCIIurban3 == 2) (scatter antisocial2011 burglary2011 if SCIIurban3 == 3), legend(label(1 Urban) label(2 Non-urban) label(3 Rural)) 

* Add a regression line
graph twoway (scatter antisocial2011 burglary2011 if SCIIurban3 == 1) (scatter antisocial2011 burglary2011 if SCIIurban3 == 2) (scatter antisocial2011 burglary2011 if SCIIurban3 == 3) (lfitci antisocial2011 burglary2011), legend(label(1 Urban) label(2 Non-urban) label(3 Rural))

* Line charts
* Good for time series, anything where one variable constantly progresses


*---------------------------
* Categorical + continuous
*---------------------------
* Bar charts with faceting
catplot P12CACORNCategory, percent by(P12HealthACORN07Group)

* Mosaic/spine plots
ssc install spineplot
spineplot P12CACORNCategory P12HealthACORN07Group

* Violin plots
ssc install vioplot
vioplot P12HealthACORN07Group, over(P12CACORNCategory) horizontal ylab(, angle(horiz))


*----------------------------
*--------------
* Model stuff
*--------------
*----------------------------

*--------------
* Diagnostics
*--------------
* Lots of tutorials on how to make residual plots, other model diagnostics
* http://www.ats.ucla.edu/stat/stata/examples/mm/mmstata2.htm
* http://www.stata.com/manuals13/rregresspostestimationdiagnosticplots.pdf

* Scatterplot matrices
graph matrix antisocial2011 burglary2011 violent2011 numGreen density


*----------------
* Visualization
*----------------
* Coefficient plots
* See ftp://repec.sowi.unibe.ch/files/wp1/jann-2013-coefplot.pdf
ssc install coefplot

label variable violent2011 "Crime"
label variable density "Density"
label variable numGreen "Green space"
regress antisocial2011 violent2011 density numGreen
coefplot, drop(_cons) xline(0)

* Works for logit too - any sort of regression model, actually
sysuse auto, clear
logit foreign mpg trunk length turn
coefplot, drop(_cons) xline(0) xtitle(Log odds)

* Predicted probabilities are cool, but tricky in Stata
* Search Google for "prgen", which generates probabilities given a model
