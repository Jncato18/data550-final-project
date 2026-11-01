NHAMCS_Analysis.html: NHAMCS_Analysis.Rmd output/table1.rds output/figure1.rds code/04_render_report.R
	Rscript code/04_render_report.R

output/analysis_data.rds: data/nhamcs_data_2018_22.csv code/01_prepare_data.R
	Rscript code/01_prepare_data.R

output/table1.rds: output/analysis_data.rds code/02_create_table.R
	Rscript code/02_create_table.R

output/figure1.rds: output/analysis_data.rds code/03_create_figure.R
	Rscript code/03_create_figure.R

.PHONY: clean	
clean:
	rm -f output/*.rds NHAMCS_Analysis.html