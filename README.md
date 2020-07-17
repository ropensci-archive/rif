rif
===



[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://api.travis-ci.org/ropensci/rif.png)](https://travis-ci.org/ropensci/rif)
[![codecov.io](https://codecov.io/github/ropensci/rif/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rif?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/rif)](https://github.com/metacran/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/rif)](https://cran.r-project.org/package=rif)


R client for the [Neuroscience Information Framework](https://www.neuinfo.org/) APIs.

* API docs at <https://neuinfo.org/about/webservices>

### Auth

You now need an API key to use the NIF API. Steps:

* Go to <https://www.neuinfo.org/>
* If you don't have an account yet, register for an account. 
* Log in
* Go to <https://www.neuinfo.org/account/developer> - you'll need to 
enter your password again
* Create an API key
* Store your API key ideally as an environment variable in `.Renviron`
or similar. Or, you can save as an R option. (see `?Startup` for help on 
env vars and R options). You can also pass in your API key to each function
but that's not ideal.

## Installation

CRAN version


```r
install.packages("rif")
```

development version


```r
install.packages("remotes")
remotes::install_github("ropensci/rif")
```

Load `rif`


```r
library('rif')
```

## Summary


```r
out <- rif_summary("cellular")
head(out$result$federationSummary$results)
```

```
#>   parentCategory      category                   db      indexable        nifId
#> 1    Output Type Data or Model Barres Brain RNA-Seq ExpressionData scr_013736-2
#> 2       Category          Gene Barres Brain RNA-Seq ExpressionData scr_013736-2
#> 3       Category          Cell Barres Brain RNA-Seq ExpressionData scr_013736-2
#> 4       Category    Expression Barres Brain RNA-Seq ExpressionData scr_013736-2
#> 5    Output Type   Information        PubMed Health           Drug  nlx_32805-3
#> 6       Category      Molecule        PubMed Health           Drug  nlx_32805-3
#>   count totalCount snippets                              summaryString
#> 1     9      22458     NULL Barres Brain RNA-Seq: ExpressionData (9)[]
#> 2     9      22458     NULL Barres Brain RNA-Seq: ExpressionData (9)[]
#> 3     9      22458     NULL Barres Brain RNA-Seq: ExpressionData (9)[]
#> 4     9      22458     NULL Barres Brain RNA-Seq: ExpressionData (9)[]
#> 5     2      20110     NULL                  PubMed Health: Drug (2)[]
#> 6     2      20110     NULL                  PubMed Health: Drug (2)[]
```

## Query

List NIF query categories


```r
rif_query_categories()
```

```
#>  [1] "anatomy"             "antibody"            "catalognumber"      
#>  [4] "cell"                "coordinate"          "disease"            
#>  [7] "environment"         "fulltext"            "function"           
#> [10] "gene"                "genetargetreagent"   "genomiclocus"       
#> [13] "genomiclocusvariant" "genotype"            "identifier"         
#> [16] "interaction"         "interactiontype"     "moleculardomain"    
#> [19] "molecule"            "organism"            "pathway"            
#> [22] "phenotype"           "protocol"            "publication"        
#> [25] "quality"             "resource"            "sequence"           
#> [28] "sequencefeature"     "specimen"            "stage"              
#> [31] "strain"              "subcellularanatomy"
```

## Vocabulary

Search for vocabulary terms


```r
vocabulary_search("cell", limit = 3)
```

```
#>                                   uuid    term           id category provider
#> 1 c2aad6c6-a2b8-4818-b2c8-5271dd5f431c    cell NEMO_9559000     cell   NIFSTD
#> 2 439b50ba-d1a6-4b4c-bbfd-d1d61d74ba69    cell   GO_0005623     cell   NIFSTD
#> 3 8ddd9932-4e66-4a25-84af-237c0784cef4 On cell    nifext_32     Cell   NIFSTD
#>   inferred acronym abbreviation synonyms definition
#> 1    FALSE   FALSE        FALSE       NA         NA
#> 2    FALSE   FALSE        FALSE       NA         NA
#> 3    FALSE   FALSE        FALSE       NA         NA
```

## Lexical

Break up text into various things


```r
text <- "Lorem ipsum inceptos dolor nisi torquent porttitor donec, blandit scelerisque
mattis cras quis mi, aliquam sagittis. Convallis placerat commodo imperdiet varius nunc
tempus urna vitae ultrices tristique eu mi ornare velit donec, posuere laoreet pretium
vitae porta augue porta feugiat in sapien egestas. Quam odio nullam pulvinar litora
curabitur amet lacus sociosqu gravida ligula molestie dui netus fusce bibendum
scelerisque, dictum malesuada proin elit etiam aliquam, mattis euismod donec nisl facilisis."
text <- gsub("\n", "", text)
```

### Sentences


```r
lexical_sentences(text)
```

```
#> $sentence
#> [1] "Lorem ipsum inceptos dolor nisi torquent porttitor donec, blandit scelerisquemattis cras quis mi, aliquam sagittis."                                                                                       
#> [2] "Convallis placerat commodo imperdiet varius nunctempus urna vitae ultrices tristique eu mi ornare velit donec, posuere laoreet pretiumvitae porta augue porta feugiat in sapien egestas."                  
#> [3] "Quam odio nullam pulvinar litoracurabitur amet lacus sociosqu gravida ligula molestie dui netus fusce bibendumscelerisque, dictum malesuada proin elit etiam aliquam, mattis euismod donec nisl facilisis."
```

### Chunks


```r
head(lexical_chunks(text))
```

```
#>                                 token start end
#> 1                Lorem ipsum inceptos     0  20
#> 2 dolor nisi torquent porttitor donec    21  56
#> 3           blandit scelerisquemattis    58  83
#> 4                                cras    84  88
#> 5                             quis mi    89  96
#> 6                    aliquam sagittis    98 114
```

### Entities


```r
head(lexical_entities(text))
```

```
#>                        token start end
#> 1 Lorem ipsum inceptos dolor     0  26
#> 2   torquent porttitor donec    32  56
#> 3  blandit scelerisquemattis    58  83
#> 4                       cras    84  88
#> 5                    quis mi    89  96
#> 6         aliquam sagittis .    98 115
```

## Literature

Search


```r
library("dplyr")
out <- literature_search(query = "cellular", count = 5)
out$result$publications %>%
  select(pmid, journal, year)
```

```
#> # A tibble: 5 x 3
#>   pmid     journal                                                          year
#>   <chr>    <chr>                                                           <int>
#> 1 27417120 BioEssays : news and reviews in molecular, cellular and develo…  2017
#> 2 12944235 Cytotherapy                                                      2003
#> 3 31084436 Cellular reprogramming                                           2020
#> 4 30785345 American journal of physiology. Lung cellular and molecular ph…  2019
#> 5 31687085 Oxidative medicine and cellular longevity                        2020
```

Get retractions


```r
out <- literature_retractions()
out[1:20]
```

```
#>  [1] "30065046" "12768027" "11167165" "23439334" "21613570" "12438313"
#>  [7] "26214776" "17519423" "23745088" "24145124" "26009721" "1824564" 
#> [13] "25497757" "20656892" "12200953" "18252834" "26339438" "18444895"
#> [19] "20175642" "23782032"
```

Then get info on some articles


```r
arts <- literature_pmid(pmid = out[1:2])
lapply(arts, "[[", "title")
```

```
#> [[1]]
#> [1] "OST1 Activation by the Brassinosteroid-Regulated Kinase CDG1-LIKE1 in Stomatal Closure."
#> 
#> [[2]]
#> [1] "Basic residues of the helix six domain of influenza virus M1 involved in nuclear translocation of M1 can be replaced by PTAP and YPDL late assembly domain motifs."
```

## Data

Search for data


```r
out <- federation_search("cellular")
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
head(out$result$results)
```

```
#>   parentCategory      category                   db      indexable        nifId
#> 1       Category          Gene Barres Brain RNA-Seq ExpressionData scr_013736-2
#> 2    Output Type Data or Model Barres Brain RNA-Seq ExpressionData scr_013736-2
#> 3       Category          Cell Barres Brain RNA-Seq ExpressionData scr_013736-2
#> 4       Category    Expression Barres Brain RNA-Seq ExpressionData scr_013736-2
#> 5    Output Type   Information        PubMed Health           Drug  nlx_32805-3
#> 6       Category      Molecule        PubMed Health           Drug  nlx_32805-3
#>   count totalCount snippets                              summaryString
#> 1     9      22458     NULL Barres Brain RNA-Seq: ExpressionData (9)[]
#> 2     9      22458     NULL Barres Brain RNA-Seq: ExpressionData (9)[]
#> 3     9      22458     NULL Barres Brain RNA-Seq: ExpressionData (9)[]
#> 4     9      22458     NULL Barres Brain RNA-Seq: ExpressionData (9)[]
#> 5     2      20110     NULL                  PubMed Health: Drug (2)[]
#> 6     2      20110     NULL                  PubMed Health: Drug (2)[]
```

Get some data


```r
out <- federation_data(id = "nlx_152871-2")
out$result$result
```

```
#> # A tibble: 20 x 12
#>    Gene  Anatomical.Comp… Assay.Type Theiler.Stage Tissue Expression.Stre…
#>    <chr> <chr>            <chr>      <chr>         <chr>  <chr>           
#>  1 tyro… nerve of bladder IHC (Immu… TS28          bladd… strong          
#>  2 mate… urogenital mese… ISH (In S… TS20          urina… unspecified     
#>  3 G pr… ovary            ISH (In S… TS23          Not p… unspecified     
#>  4 TANK… testis           ISH (In S… TS23          Not p… unspecified     
#>  5 zinc… ureter           ISH (In S… TS23          Not p… unspecified     
#>  6 dele… ovary            ISH (In S… TS27          ovary  strong          
#>  7 fork… urinary system   ISH (In S… TS25          Not p… moderate        
#>  8 phos… pelvis           ISH (In S… TS26          metan… strong          
#>  9 home… testis           ISH (In S… TS22          testis moderate        
#> 10 GATA… ovary            ISH (In S… TS23          Not p… unspecified     
#> 11 sal-… testis           ISH (In S… TS23          Not p… unspecified     
#> 12 nitr… nerve of bladder IHC (Immu… TS26          bladd… strong          
#> 13 RIKE… metanephros      ISH (In S… TS26          metan… weak            
#> 14 chol… pelvic ganglion  TG (trans… TS22          pelvi… strong          
#> 15 cyst… oviduct          ISH (In S… TS27          ovary  moderate        
#> 16 ash1… ureter           ISH (In S… TS23          Not p… unspecified     
#> 17 neur… ureter           ISH (In S… TS23          Not p… unspecified     
#> 18 deve… testis           ISH (In S… TS23          Not p… unspecified     
#> 19 zinc… bladder          ISH (In S… TS23          Not p… unspecified     
#> 20 Nano… ureter           ISH (In S… TS23          Not p… unspecified     
#> # … with 6 more variables: Expression.Pattern <chr>,
#> #   Expression.Pattern.Location <chr>, Authors <chr>, Notes <chr>,
#> #   v_uuid <chr>, Source <chr>
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rif/issues).
* License: MIT
* Get citation information for `rif` in R doing `citation(package = 'rif')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ro_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
