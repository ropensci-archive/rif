rif
===



[![Build Status](https://api.travis-ci.org/ropensci/rif.png)](https://travis-ci.org/ropensci/rif)
[![codecov.io](https://codecov.io/github/ropensci/rif/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rif?branch=master)

R client for the [Neuroscience Information Framework](https://www.neuinfo.org/) APIs.

* API docs at <http://nif-services.neuinfo.org/servicesv1/>
* Various clients at <http://nif-services.neuinfo.org/servicesv1/downloads.html>

## Installation

Install development version from GitHub (not on CRAN yet)


```r
install.packages("devtools")
devtools::install_github("ropensci/rif")
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
#>   parentCategory    category                        db
#> 1    Entity Type    Molecule              PeptideAtlas
#> 2   Type of Data   Phenotype                      IMPC
#> 3   Type of Data   Cell line Coriell Cell Repositories
#> 4    Entity Type        Cell Coriell Cell Repositories
#> 5   Type of Data Biospecimen Coriell Cell Repositories
#> 6   Type of Data  Expression                       GEO
#>              indexable            nifId count totalCount snippets
#> 1             MassSpec nif-0000-03266-2     4         76     NULL
#> 2   KnockoutPhenotypes     nlx_151660-1     3      22344     NULL
#> 3                NIGMS nif-0000-00182-2    11      12986     NULL
#> 4                NIGMS nif-0000-00182-2    11      12986     NULL
#> 5                NIGMS nif-0000-00182-2    11      12986     NULL
#> 6 MicroarrayExperiment nif-0000-00142-1  4340      68725     NULL
#>                             summaryString
#> 1            PeptideAtlas: MassSpec (4)[]
#> 2          IMPC: KnockoutPhenotypes (3)[]
#> 3 Coriell Cell Repositories: NIGMS (11)[]
#> 4 Coriell Cell Repositories: NIGMS (11)[]
#> 5 Coriell Cell Repositories: NIGMS (11)[]
#> 6      GEO: MicroarrayExperiment (4340)[]
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
#>                                   uuid    term           id category
#> 1 c2aad6c6-a2b8-4818-b2c8-5271dd5f431c    cell NEMO_9559000     cell
#> 2 439b50ba-d1a6-4b4c-bbfd-d1d61d74ba69    cell   GO_0005623     cell
#> 3 8ddd9932-4e66-4a25-84af-237c0784cef4 On cell    nifext_32     Cell
#>   provider inferred acronym abbreviation synonyms definition
#> 1   NIFSTD    FALSE   FALSE        FALSE       NA         NA
#> 2   NIFSTD    FALSE   FALSE        FALSE       NA         NA
#> 3   NIFSTD    FALSE   FALSE        FALSE       NA         NA
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
#> # A tibble: 5 × 3
#>       pmid
#> *    <chr>
#> 1 12944235
#> 2 27417120
#> 3  8789268
#> 4  2987169
#> 5 15088773
#> # ... with 2 more variables: journal <chr>, year <int>
```

Get retractions


```r
out <- literature_retractions()
out[1:20]
```

```
#>  [1] "21386829" "21967191" "16519442" "23675629" "15968000" "16934686"
#>  [7] "10318977" "16373573" "22360771" "9593639"  "19723695" "11108151"
#> [13] "18410446" "17251587" "23551690" "26389933" "27163758" "22992046"
#> [19] "12554767" "11146662"
```

Then get info on some articles


```r
arts <- literature_pmid(pmid = out[1:2])
lapply(arts, "[[", "title")
```

```
#> [[1]]
#> [1] "Treatment of articulatory dysfunction in Parkinson's disease using repetitive transcranial magnetic stimulation."
#>
#> [[2]]
#> [1] "Molecular pathways underlying IBD-associated colorectal neoplasia: therapeutic implications."
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
#>   parentCategory    category                        db
#> 1    Entity Type    Molecule              PeptideAtlas
#> 2   Type of Data   Phenotype                      IMPC
#> 3   Type of Data   Cell line Coriell Cell Repositories
#> 4   Type of Data Biospecimen Coriell Cell Repositories
#> 5    Entity Type        Cell Coriell Cell Repositories
#> 6   Type of Data  Expression                       GEO
#>              indexable            nifId count totalCount snippets
#> 1             MassSpec nif-0000-03266-2     4         76     NULL
#> 2   KnockoutPhenotypes     nlx_151660-1     3      22344     NULL
#> 3                NIGMS nif-0000-00182-2    11      12986     NULL
#> 4                NIGMS nif-0000-00182-2    11      12986     NULL
#> 5                NIGMS nif-0000-00182-2    11      12986     NULL
#> 6 MicroarrayExperiment nif-0000-00142-1  4340      68725     NULL
#>                             summaryString
#> 1            PeptideAtlas: MassSpec (4)[]
#> 2          IMPC: KnockoutPhenotypes (3)[]
#> 3 Coriell Cell Repositories: NIGMS (11)[]
#> 4 Coriell Cell Repositories: NIGMS (11)[]
#> 5 Coriell Cell Repositories: NIGMS (11)[]
#> 6      GEO: MicroarrayExperiment (4340)[]
```

Get some data


```r
out <- federation_data(id = "nlx_152871-2")
out$result$result
```

```
#> # A tibble: 20 × 11
#>                                                                           Gene
#>                                                                          <chr>
#> 1                                              B cell CLL/lymphoma 6, member B
#> 2                                                    cyclin-dependent kinase 4
#> 3                           calcium channel, voltage-dependent, beta 2 subunit
#> 4                                                                     clarin 3
#> 5                                                                       afamin
#> 6                                          Fas death domain-associated protein
#> 7                                                       ring finger protein 14
#> 8                                 DnaJ (Hsp40) homolog, subfamily C, member 21
#> 9                                        protein inhibitor of activated STAT 1
#> 10                                                     erythropoietin receptor
#> 11 COP9 (constitutive photomorphogenic) homolog, subunit 3 (Arabidopsis thalia
#> 12                       proteasome (prosome, macropain) 26S subunit, ATPase 2
#> 13                                           speedy homolog A (Xenopus laevis)
#> 14                                                            apolipoprotein M
#> 15                                                     zinc finger protein 623
#> 16                                            P450 (cytochrome) oxidoreductase
#> 17                                                     erythropoietin receptor
#> 18                                                      zinc and ring finger 1
#> 19              solute carrier family 13 (sodium/sulfate symporters), member 1
#> 20                                                snail homolog 2 (Drosophila)
#> # ... with 10 more variables: Anatomical.Component <chr>,
#> #   Assay.Type <chr>, Theiler.Stage <chr>, Tissue <chr>,
#> #   Expression.Strength <chr>, Expression.Pattern <chr>,
#> #   Expression.Pattern.Location <chr>, Authors <chr>, Notes <chr>,
#> #   Source <chr>
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rif/issues).
* License: MIT
* Get citation information for `rif` in R doing `citation(package = 'rif')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ro_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
