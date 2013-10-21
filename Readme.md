Readme for STAT545A Homework 6 - Jack Ni

* Download into an empty directory:
    - Input data: [`lfs.zip`](https://www.dropbox.com/s/y02gt99rmwomy4m/lfS.zip) *Note: Must download and unzip all 17 files to the empty directory.
    - Scripts: [`01_aggregate_data.R`](https://github.com/jacknii/Proj545/blob/master/01_aggregate_data.R) and [`02_lfs_plots.R`](https://github.com/jacknii/Proj545/blob/master/02_lfs_plots.R)
    - R Markdown: [`03_lfs_report.rmd`](https://github.com/jacknii/Proj545/blob/master/03_lfs_report.rmd)
    - Makefile: [`Makefile`](https://raw.github.com/jennybc/STAT545A/master/hw06_scaffolds/03_knitWithoutRStudio/Makefile)
* In a shell: `make all`. Or just: `make`.
* New files you should see after running the pipeline:
    - [`LFS.csv`](https://github.com/jacknii/Proj545/blob/master/LFS.csv)
    - [`wage_dist.png`](https://github.com/jacknii/Proj545/blob/master/wage_dist.png)
    - [`wage_tenure.png`](https://github.com/jacknii/Proj545/blob/master/wage_tenure.png)
    - [`wage_educ.png`](https://github.com/jacknii/Proj545/blob/master/wage_educ.png)
    - [`boxplot_wage_educ.png`](https://github.com/jacknii/Proj545/blob/master/boxplot_wage_educ.png)
    - [`wage_reg.html`](https://github.com/jacknii/Proj545/blob/master/wage_reg.html)
    - [`wage_union.png`](https://github.com/jacknii/Proj545/blob/master/wage_union.png)
    - [`wage_sex.png`](https://github.com/jacknii/Proj545/blob/master/wage_sex.png)
    - [`wage_age.png`](https://github.com/jacknii/Proj545/blob/master/wage_age.png)
    - [`03_lfs_report.html`](https://github.com/jacknii/Proj545/blob/master/03_lfs_report.html)
* To remove the output and get a clean slate, in a shell: `make clean`