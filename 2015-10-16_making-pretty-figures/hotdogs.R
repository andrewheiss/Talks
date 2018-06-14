# Load CSV file into R
hotdogs <- read.csv("http://datasets.flowingdata.com/hot-dog-contest-winners.csv")

# Super basic plot
barplot(hotdogs$Dogs.eaten)

# Help on all the things you can modify with the plot
?barplot

# Add names
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year)

# Add colors
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col="red")

# Remove border
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col="red", border=NA)

# Add a new column specifying the color of the bars
hotdogs$fill_colors <- ifelse(hotdogs$New.record == 1, "green", "grey50")

barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=hotdogs$fill_colors, border=NA)

# Full plot
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=hotdogs$fill_colors, 
        border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten", 
        space=0.3, main="Hot Dog Eating Contest Results, 1980-2010", ylim=c(0, 80))

# To save the plot as a PDF, run the command between pdf(...) and dev.off(). 
# Or just use RStudio's export graph menu. That's easier.
pdf("~/Desktop/plots.pdf", width=10, height=5)  # Start an empty PDF
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=hotdogs$fill_colors, 
        border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten", 
        space=0.3, main="Hot Dog Eating Contest Results, 1980-2010", ylim=c(0, 80))
dev.off()  # Save and close the PDF


# Using a fancier graphics library
library(ggplot2)
ggplot(hotdogs, aes(x=Year, y=Dogs.eaten, fill=Country)) + 
  geom_bar(stat="identity")


# Use Stata
# import delimited "http://datasets.flowingdata.com/hot-dog-contest-winners.csv"
# graph bar dogseaten, over(year)


# Text for the fancy graph:
# Nathan's hot dog eating contest every July 4th has been going on since the 1900s, but it wasn't until 2011 when things got serious. Takeru Kobayashi from Japan raised the bar, more than doubling the previous world record. Highlighted bars indicate new records.
# 
# Frank Delarosa sets a new world record with 21.5 HDBs.
# 
# In 2001, Takeru Kobayashi gets his first win in the competition. He went on to win five more years in a row.
# 
# For the first time since 1999, an American reclaims the title when Joey Chestnut consumes 66 HDBs.
# 
# Source: Wikipedia | Nathan Yau
