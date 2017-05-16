all: move rmd2md

move:
		cp inst/vign/rif_vignette.md vignettes

rmd2md:
		cd vignettes;\
		mv rif_vignette.md rif_vignette.Rmd
