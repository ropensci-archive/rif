rif
=========



R client for the [Neuroscience Information Framework](http://www.neuinfo.org/) APIs.

* API docs at [http://nif-services.neuinfo.org/servicesv1/](http://nif-services.neuinfo.org/servicesv1/)
* Various clients at [http://nif-services.neuinfo.org/servicesv1/downloads.html](http://nif-services.neuinfo.org/servicesv1/downloads.html)

## Installation


```r
install.packages("devtools")
devtools::install_github("ropensci/rif")
```

Load `rif`


```r
library('rif')
```

## Summary endpoint


```r
out <- summary("cellular")
out$query
```

```
#> $clauses
#>   category property    query expansion id quoted require forbid
#> 1       NA       NA cellular      NULL NA  FALSE   FALSE  FALSE
#> 
#> $operator
#> [1] "AND"
```

```r
out$result$literatureSummary
```

```
#> $publications
#> list()
#> 
#> $facets
#> list()
#> 
#> $debugInfo
#> [1] "grantId:cellular^20.0 abstract:cellular^5.0 journal:cellular author:cellular^3.0 title:cellular^10.0 abstract_exact:cellular^10.0 year_search:cellular^10.0 pmid_search:cellular^10.0 pmcid_search:cellular^10.0 title_exact:cellular^20.0 meshHeading:cellular^7.0"
#> 
#> $offset
#> [1] 0
#> 
#> $resultCount
#> [1] 703926
```

```r
out$result$federationSummary$total
```

```
#> [1] 883199
```

```r
out$result$federationSummary$categories
```

```
#>           parent              category  count
#> 1   Type of Data            Antibodies    400
#> 2   Type of Data Brain Activation Foci    364
#> 3   System Level                  Gene 428021
#> 4   Type of Data               Disease   2632
#> 5   Type of Data                People     21
#> 6   Type of Data                 Atlas    187
#> 7   Type of Data            Registries    633
#> 8   Type of Data              Software     20
#> 9   Type of Data             Protocols      5
#> 10  Type of Data            Expression  20785
#> 11  Type of Data                 Drugs   4733
#> 12  Type of Data                Grants 115362
#> 13 Uncategorized               Disease      6
#> 14 Uncategorized                  Gene      6
#> 15  Type of Data                Models    886
#> 16  Type of Data               Animals    845
#> 17  Type of Data             Phenotype   4104
#> 18  System Level              Function   9991
#> 19  System Level         Gross Anatomy     32
#> 20  Type of Data              Plasmids     23
#> 21  Type of Data            Annotation 302469
#> 22  Type of Data                Images  10941
#> 23  Type of Data             Cell line     86
#> 24  System Level              Molecule   4618
#> 25  Type of Data          Interactions     16
#> 26  Type of Data            Multimedia   2749
#> 27  Type of Data             Orthology     19
#> 28  Type of Data            Microarray  21084
#> 29  Type of Data               Dataset    926
#> 30  Type of Data              Pathways    531
#> 31  Type of Data           Biospecimen     19
#> 32  Type of Data       Clinical Trials   5512
#> 33  System Level                  Cell  10548
```

```r
head(out$result$federationSummary$results)
```

```
#>   parentCategory  category                        db           indexable
#> 1   System Level      Cell Coriell Cell Repositories               NIGMS
#> 2   Type of Data Cell line Coriell Cell Repositories               NIGMS
#> 3   Type of Data   Disease                  Orphanet            Diseases
#> 4   Type of Data Phenotype                      OMIM GeneAllelePhenotype
#> 5   System Level      Gene                      OMIM GeneAllelePhenotype
#> 6   System Level      Gene                    GUDMAP          Expression
#>              nifId count totalCount snippets
#> 1 nif-0000-00182-2    11       9854     NULL
#> 2 nif-0000-00182-2    11       9854     NULL
#> 3 nif-0000-21306-1     3       9209     NULL
#> 4 nif-0000-03216-6   176      21164     NULL
#> 5 nif-0000-03216-6   176      21164     NULL
#> 6     nlx_152871-2    90      51837     NULL
#>                             summaryString
#> 1 Coriell Cell Repositories: NIGMS (11)[]
#> 2 Coriell Cell Repositories: NIGMS (11)[]
#> 3                Orphanet: Diseases (3)[]
#> 4       OMIM: GeneAllelePhenotype (176)[]
#> 5       OMIM: GeneAllelePhenotype (176)[]
#> 6               GUDMAP: Expression (90)[]
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rif/issues).
* License: MIT
* Get citation information for `rif` in R doing `citation(package = 'rif')`

[![ro_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
