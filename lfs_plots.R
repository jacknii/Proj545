library(ggplot2)
library(RColorBrewer)
library(scales)
library(ggthemes)
library(plyr)
library(xtable)

## Read in data and check
lfs <- read.delim("LFS.csv")
str(lfs)

## Looking at distribution of wages
wage_dist <- ggplot(lfs, aes(x = ANNUAL_WAGE)) + geom_histogram() + scale_x_continuous(labels = comma) + theme_wsj() + theme(axis.title=element_text(size = 12))
png("wage_dist.png")
print(wage_dist)
dev.off()

## Relationship of wage with tenure over the years
wage_tenure <- ggplot(subset(lfs, SURVYEAR %in% c("1997", "2004", "2013")), aes(x = TENURE, y = ANNUAL_WAGE, color = as.factor(SURVYEAR))) + labs(colour = "Years") + geom_smooth(method = "lm", lwd = 2, na.rm = TRUE) + facet_grid(~PROV) + scale_color_brewer(palette = "Blues") + theme_few() + theme(legend.position = "top")
png("wage_tenure.png")
print(wage_tenure)
dev.off()

## Reordering education levels by wage
lfs <- within(lfs, EDUC <- reorder(EDUC, ANNUAL_WAGE, na.rm = TRUE))

## Boxplot of wage by education level
wage_educ <- ggplot(subset(lfs, SURVYEAR %in% c("2012", "2013") & PROV == "AB"), aes(x = EDUC, y = ANNUAL_WAGE, fill = EDUC)) + geom_boxplot(na.rm = TRUE) + scale_fill_brewer(palette = "Blues", guide = FALSE) + theme_wsj() + theme(axis.title=element_text(size = 12))
png("wage_educ.png")
print(wage_educ)
dev.off()

## Checking the other provinces
boxplot_wage_educ <- ggplot(subset(lfs, SURVYEAR %in% c("2012", "2013")), aes(x = EDUC, y = ANNUAL_WAGE, fill = EDUC)) + geom_boxplot(na.rm = TRUE) + scale_fill_brewer(palette = "Blues", guide = FALSE) + theme_few() + theme(axis.text.x = element_blank()) + facet_grid(~PROV)
png("boxplot_wage_educ.png")
print(boxplot_wage_educ)
dev.off()

## Regression function returning estimate of the effect of education on wage and its standard error
regfun <- function(x) {
  lm_sum <- summary(lm(ANNUAL_WAGE ~ EDUC, x))
  estCoefs <- cbind(coef(lm_sum)[, 1], coef(lm_sum)[, 2])
  estCoefs <- estCoefs[-1,]
  names(estCoefs) <- c("slope", "standard error")
  return(estCoefs)
}

## Applying regfun to data from Alberta with the two education levels "Some PS" and "Ba and more" by year
wage_reg <- ddply(subset(lfs, PROV == "AB" & EDUC %in% c("Ba or More", "Some PS")), ~ SURVYEAR, regfun)
x <- xtable(wage_reg)
print(x, type="html", file="wage_reg.html")

## Storing a subset for easier access
lfsAb <- subset(lfs, SURVYEAR %in% c("2012", "2013") & PROV == "AB" & EDUC %in% c("Some PS", "Ba or MOre"))

## Effect of union on subset
wage_union <- ggplot(lfsAb, aes(x = ANNUAL_WAGE, fill = UNION, color = UNION)) + geom_bar() + scale_x_continuous(labels = comma) + theme_wsj() + theme(axis.title=element_text(size = 12)) + scale_fill_brewer(palette = "Set1") + scale_color_brewer(palette = "Set1")
png("wage_union.png")
print(wage_union)
dev.off()

## Effect of sex on subset
wage_sex <- ggplot(subset(lfsAb, UNION == "No"), aes(x = ANNUAL_WAGE, color = SEX)) + geom_density() + scale_x_continuous(labels = comma) + theme_wsj() + theme(axis.title=element_text(size = 12))
png("wage_sex.png")
print(wage_sex)
dev.off()

## Effect of age on subset
wage_age <- ggplot(subset(lfsAb, UNION == "No" & SEX == "Male"), aes(x = AGE, y = ANNUAL_WAGE)) + geom_boxplot(na.rm = TRUE) + theme_wsj() + theme(axis.title=element_text(size = 12))
png("wage_age.png")
print(wage_age)
dev.off()