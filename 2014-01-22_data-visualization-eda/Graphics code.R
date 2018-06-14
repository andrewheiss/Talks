# Load ggplot (install it first if you need to)
library(ggplot2)

# Load built-in data
mtcars <- mtcars
movies <- movies
# Select 1000 of the movies
movies <- movies[sample(nrow(movies), 1000), ]

# If you want to use data from Stata, do the following:
# library(foreign)  # Lets you load data from other programs
# read.dta(file.choose())  # read.dta() opens a .dta file. file.choose() opens a file dialog so you can navigate to your dta file. 

# Alternatively you can put the actual path to the file, like so:
# read.dta("data.dta")
# Also, if your data is a csv or something, you don't need to use the foreign library and you can just do this:
# read.csv(file.choose())


# Univariate stuff
# Continuous data
# Histograms
p <- ggplot(data=movies, aes(x=rating))
p + geom_histogram()  # default bins
p + geom_histogram(binwidth=2)  # big bins
p + geom_histogram(binwidth=0.1)  # small bins

# Density plots
p + geom_density(fill="darkgrey")

# Boxplot
m <- ggplot(data=movies, aes(y=rating, x=factor(0)))
m + geom_boxplot() + coord_flip()


# Bar charts (categorical)
c <- ggplot(mtcars, aes(factor(cyl)))
c + geom_bar()


# Bivariate stuff
# Continuous + continuous
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point(size=4)

# Add other variables
p + geom_point(aes(colour=factor(cyl), size = qsec))

# Continuous + categorical
p <- ggplot(mpg, aes(factor(cyl), hwy))
p + geom_point(size=4)  # Overlaid dots
p + geom_point(size=4, position="jitter")  # Jittered dots
p + geom_point(size=4, alpha=.2)  # Transparent dots

# Violin plots
p <- ggplot(mpg, aes(x=factor(cyl), y=hwy, fill=factor(cyl)))
p + geom_violin(scale = "width")
# Add jittered dots for fun
p + geom_violin(scale = "width") + geom_point(size=2, position="jitter")


# Categorical stuff 
mosaicplot(~ Sex + Survived, data = Titanic, color = TRUE)
mosaicplot(Titanic, color = TRUE)


# Coefficient plots
library(coefplot)  # Install this package
model1 <- lm(mpg ~ wt + disp + hp + factor(cyl), data=mtcars)
summary(model1)
coefplot(model1) + labs(title=NULL) + theme_bw()

# Scatterplot matrix
library(car)
scatterplotMatrix(~ mpg + wt + disp + hp | cyl, data=mtcars, main=NULL)
