## one Makefile to make them all

all: wage_reg.html 03_lfs_report.html

LFS.csv: 97.csv 98.csv 99.csv 00.csv 01.csv 02.csv 03.csv 04.csv 05.csv 06.csv 07.csv 08.csv 09.csv 10.csv 11.csv 12.csv 13.csv 01_aggregate_data.R
	Rscript 01_aggregate_data.R

wage_*.png boxplot_wage_educ.png wage_reg.html: LFS.csv 02_lfs_plots.R
	Rscript 02_lfs_plots.R

03_lfs_report.html: 03_lfs_report.rmd
	Rscript -e "knitr::knit2html('03_lfs_report.rmd')"; rm -r 03_lfs_report.md

clean:
	rm -rf LFS.csv *.png 0*.md *.html figure