rif
=========



[![Build Status](https://api.travis-ci.org/ropensci/rif.png)](https://travis-ci.org/ropensci/rif)

R client for the [Neuroscience Information Framework](http://www.neuinfo.org/) APIs.

* API docs at [http://nif-services.neuinfo.org/servicesv1/](http://nif-services.neuinfo.org/servicesv1/)
* Various clients at [http://nif-services.neuinfo.org/servicesv1/downloads.html](http://nif-services.neuinfo.org/servicesv1/downloads.html)

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
#>   parentCategory   category                        db            indexable
#> 1   System Level   Molecule              PeptideAtlas             MassSpec
#> 2   Type of Data  Phenotype                      IMPC   KnockoutPhenotypes
#> 3   Type of Data  Cell line Coriell Cell Repositories                NIGMS
#> 4   System Level       Cell Coriell Cell Repositories                NIGMS
#> 5   Type of Data Expression                       GEO MicroarrayExperiment
#> 6   Type of Data Microarray                       GEO MicroarrayExperiment
#>              nifId count totalCount snippets
#> 1 nif-0000-03266-2     4         76     NULL
#> 2     nlx_151660-1     2      11373     NULL
#> 3 nif-0000-00182-2    11       9854     NULL
#> 4 nif-0000-00182-2    11       9854     NULL
#> 5 nif-0000-00142-1  4340      68725     NULL
#> 6 nif-0000-00142-1  4340      68725     NULL
#>                             summaryString
#> 1            PeptideAtlas: MassSpec (4)[]
#> 2          IMPC: KnockoutPhenotypes (2)[]
#> 3 Coriell Cell Repositories: NIGMS (11)[]
#> 4 Coriell Cell Repositories: NIGMS (11)[]
#> 5      GEO: MicroarrayExperiment (4340)[]
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
#> 1 1bbad62f-b412-41a4-9018-e1ffd5c4b335    cell NEMO_9559000     cell
#> 2 69ca235c-b002-48d1-b0e5-6af148397f26    cell   GO_0005623     cell
#> 3 3dab9b07-6a44-4822-b5cf-34dab10db8f7 On cell    nifext_32     Cell
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
#> Source: local data frame [5 x 3]
#>
#>       pmid
#> 1 12944235
#> 2  8789268
#> 3  2987169
#> 4 15088773
#> 5 22482413
#> Variables not shown: journal (chr), year (int)
```

Get retractions


```r
out <- literature_retractions()
out[1:20]
```

```
#>  [1] "21386829" "16519442" "23675629" "15968000" "16934686" "10318977"
#>  [7] "16373573" "22360771" "9593639"  "11108151" "19723695" "18410446"
#> [13] "23551690" "17251587" "22992046" "12554767" "11146662" "8909298"
#> [19] "9503219"  "11006278"
```

Then get info on some articles


```r
arts <- literature_pmid(pmid = out[1:2])
lapply(arts, "[[", "title")
```

```
#> [[1]]
#> [1] "Lamellar gels and spontaneous vesicles in catanionic surfactant mixtures."
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
#>   parentCategory   category                        db            indexable
#> 1   System Level   Molecule              PeptideAtlas             MassSpec
#> 2   Type of Data  Phenotype                      IMPC   KnockoutPhenotypes
#> 3   Type of Data  Cell line Coriell Cell Repositories                NIGMS
#> 4   System Level       Cell Coriell Cell Repositories                NIGMS
#> 5   Type of Data Expression                       GEO MicroarrayExperiment
#> 6   Type of Data Microarray                       GEO MicroarrayExperiment
#>              nifId count totalCount snippets
#> 1 nif-0000-03266-2     4         76     NULL
#> 2     nlx_151660-1     2      11373     NULL
#> 3 nif-0000-00182-2    11       9854     NULL
#> 4 nif-0000-00182-2    11       9854     NULL
#> 5 nif-0000-00142-1  4340      68725     NULL
#> 6 nif-0000-00142-1  4340      68725     NULL
#>                             summaryString
#> 1            PeptideAtlas: MassSpec (4)[]
#> 2          IMPC: KnockoutPhenotypes (2)[]
#> 3 Coriell Cell Repositories: NIGMS (11)[]
#> 4 Coriell Cell Repositories: NIGMS (11)[]
#> 5      GEO: MicroarrayExperiment (4340)[]
#> 6      GEO: MicroarrayExperiment (4340)[]
```

Get some data


```r
out <- federation_data(id = "nlx_152871-2")
out$result$result
```

```
#> Source: local data frame [20 x 11]
#>
#>                                                     Gene
#> 1        nuclear receptor subfamily 1, group H, member 4
#> 2    scratch homolog 1, zinc finger protein (Drosophila)
#> 3                                      myogenic factor 5
#> 4                                         ALX homeobox 1
#> 5                        frizzled homolog 6 (Drosophila)
#> 6                                            homeobox A3
#> 7                                            cadherin 11
#> 8             interleukin-1 receptor-associated kinase 1
#> 9  tumor necrosis factor receptor superfamily, member 18
#> 10                         four and a half LIM domains 4
#> 11                             folate receptor 1 (adult)
#> 12                                            syndecan 3
#> 13                   fibroblast growth factor receptor 2
#> 14                           IKAROS family zinc finger 2
#> 15                 guanylate cyclase 1, soluble, alpha 3
#> 16                           estrogen receptor 1 (alpha)
#> 17                            transmembrane protein 184a
#> 18               developmental pluripotency associated 4
#> 19                                 mesenchyme homeobox 2
#> 20           POU domain, class 2, transcription factor 2
#> Variables not shown: Anatomical.Component (chr), Assay.Type (chr),
#>   Theiler.Stage (chr), Tissue (chr), Expression.Strength (chr),
#>   Expression.Pattern (chr), Expression.Pattern.Location (chr), Authors
#>   (chr), Notes (chr), Source (chr)
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rif/issues).
* License: MIT
* Get citation information for `rif` in R doing `citation(package = 'rif')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ro_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
