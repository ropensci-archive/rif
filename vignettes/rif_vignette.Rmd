<!--
%\VignetteIndexEntry{Introduction to the rif package}
%\VignetteEngine{knitr::rmarkdown}
%\VignetteEncoding{UTF-8}
-->



Introduction to the rif package
===============================

`rif` is an R wrapper for the [Neuroscience Information Framework (NIF)](https://www.neuinfo.org/)  APIs.

* API docs at <https://neuinfo.org/about/webservices>

## Install

Stable `rif` version from CRAN


```r
install.packages("rif")
```

Or, the development version from Github


```r
devtools::install_github("ropensci/rif")
```


```r
library("rif")
```

## Summary


```r
out <- rif_summary("cellular")
head(out$result$federationSummary$results)
#>   parentCategory      category                   db      indexable
#> 1    Output Type Data or Model Barres Brain RNA-Seq ExpressionData
#> 2       Category    Expression Barres Brain RNA-Seq ExpressionData
#> 3       Category          Gene Barres Brain RNA-Seq ExpressionData
#> 4       Category          Cell Barres Brain RNA-Seq ExpressionData
#> 5       Category      Molecule        PubMed Health           Drug
#> 6    Output Type   Information        PubMed Health           Drug
#>          nifId count totalCount snippets
#> 1 scr_013736-2     9      22458     NULL
#> 2 scr_013736-2     9      22458     NULL
#> 3 scr_013736-2     9      22458     NULL
#> 4 scr_013736-2     9      22458     NULL
#> 5  nlx_32805-3     2      19179     NULL
#> 6  nlx_32805-3     2      19179     NULL
#>                                summaryString
#> 1 Barres Brain RNA-Seq: ExpressionData (9)[]
#> 2 Barres Brain RNA-Seq: ExpressionData (9)[]
#> 3 Barres Brain RNA-Seq: ExpressionData (9)[]
#> 4 Barres Brain RNA-Seq: ExpressionData (9)[]
#> 5                  PubMed Health: Drug (2)[]
#> 6                  PubMed Health: Drug (2)[]
```

## Query

List NIF query categories


```r
rif_query_categories()
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
#> $sentence
#> [1] "Lorem ipsum inceptos dolor nisi torquent porttitor donec, blandit scelerisquemattis cras quis mi, aliquam sagittis."                                                                                       
#> [2] "Convallis placerat commodo imperdiet varius nunctempus urna vitae ultrices tristique eu mi ornare velit donec, posuere laoreet pretiumvitae porta augue porta feugiat in sapien egestas."                  
#> [3] "Quam odio nullam pulvinar litoracurabitur amet lacus sociosqu gravida ligula molestie dui netus fusce bibendumscelerisque, dictum malesuada proin elit etiam aliquam, mattis euismod donec nisl facilisis."
```

### Chunks


```r
head(lexical_chunks(text))
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
literature_search(query = "cellular", count = 5)
#> $result
#> $result$publications
#> # A tibble: 5 x 18
#>       pmid pmcid
#> *    <chr> <lgl>
#> 1 12944235    NA
#> 2 27417120    NA
#> 3  8789268    NA
#> 4  2987169    NA
#> 5 15088773    NA
#> # ... with 16 more variables: title <chr>, authors <list>,
#> #   grantIds <list>, grantAgencies <list>, retractions <list>,
#> #   journal <chr>, journalShort <chr>, day <int>, month <int>, year <int>,
#> #   meshHeadings <list>, hasAbstract <lgl>, score <dbl>, snippets <list>,
#> #   abstract <chr>, affiliation <list>
#> 
#> $result$facets
#> list()
#> 
#> $result$debugInfo
#> [1] "title_exact:cellular^20.0 grantId:cellular^20.0 journal:cellular meshHeading:cellular^7.0 author:cellular^3.0 pmcid_search:cellular^10.0 year_search:cellular^10.0 abstract:cellular^5.0 pmid_search:cellular^10.0 title:cellular^10.0 abstract_exact:cellular^10.0"
#> 
#> $result$resultCount
#> [1] 816438
#> 
#> $result$offset
#> [1] 0
#> 
#> 
#> $query
#> $query$clauses
#>   category property    query expansion id quoted require forbid
#> 1       NA       NA cellular      NULL NA  FALSE   FALSE  FALSE
#> 
#> $query$operator
#> [1] "AND"
#> 
#> 
#> $messages
#> list()
```

Get retractions


```r
out <- literature_retractions()
out[1:20]
#>  [1] "12768027" "11167165" "22576713" "17973093" "10050223" "21613570"
#>  [7] "12438313" "22364277" "26214776" "10784445" "17519423" "21177250"
#> [13] "23745088" "26009721" "1824564"  "15260988" "20656892" "1400454" 
#> [19] "12200953" "22893106"
```

Then get info on some articles


```r
arts <- literature_pmid(pmid = out[1:2])
lapply(arts, "[[", "title")
#> [[1]]
#> [1] "Basic residues of the helix six domain of influenza virus M1 involved in nuclear translocation of M1 can be replaced by PTAP and YPDL late assembly domain motifs."
#> 
#> [[2]]
#> [1] "Point-of-care (POC) testing of lactate in the intensive care patient. Accuracy, reliability, and costs of different measurement systems."
```

## Data

Search for data


```r
out <- federation_search("cellular")
out$query
#> $clauses
#>   category property    query expansion id quoted require forbid
#> 1       NA       NA cellular      NULL NA  FALSE   FALSE  FALSE
#> 
#> $operator
#> [1] "AND"
head(out$result$results)
#>   parentCategory      category                   db      indexable
#> 1       Category    Expression Barres Brain RNA-Seq ExpressionData
#> 2    Output Type Data or Model Barres Brain RNA-Seq ExpressionData
#> 3       Category          Cell Barres Brain RNA-Seq ExpressionData
#> 4       Category          Gene Barres Brain RNA-Seq ExpressionData
#> 5    Output Type   Information        PubMed Health           Drug
#> 6       Category      Molecule        PubMed Health           Drug
#>          nifId count totalCount snippets
#> 1 scr_013736-2     9      22458     NULL
#> 2 scr_013736-2     9      22458     NULL
#> 3 scr_013736-2     9      22458     NULL
#> 4 scr_013736-2     9      22458     NULL
#> 5  nlx_32805-3     2      19179     NULL
#> 6  nlx_32805-3     2      19179     NULL
#>                                summaryString
#> 1 Barres Brain RNA-Seq: ExpressionData (9)[]
#> 2 Barres Brain RNA-Seq: ExpressionData (9)[]
#> 3 Barres Brain RNA-Seq: ExpressionData (9)[]
#> 4 Barres Brain RNA-Seq: ExpressionData (9)[]
#> 5                  PubMed Health: Drug (2)[]
#> 6                  PubMed Health: Drug (2)[]
```

Get some data


```r
out <- federation_data(id = "nlx_152871-2")
out$result$result
#> # A tibble: 20 x 12
#>                                                   Gene
#>                                                  <chr>
#>  1                                tyrosine hydroxylase
#>  2                              maternally expressed 3
#>  3                       G protein-coupled receptor 37
#>  4                               TANK-binding kinase 1
#>  5                 zinc finger, ZZ domain containing 3
#>  6                         deleted in azoospermia-like
#>  7                                     forkhead box A2
#>  8                         phospholipase A2, group IIF
#>  9                                         homeobox C5
#> 10                              GATA binding protein 4
#> 11                             sal-like 4 (Drosophila)
#> 12                   nitric oxide synthase 1, neuronal
#> 13                          RIKEN cDNA C130073F10 gene
#> 14                           choline acetyltransferase
#> 15                                         cystatin 12
#> 16 ash1 (absent, small, or homeotic)-like (Drosophila)
#> 17                        neurogenic differentiation 4
#> 18                         developing brain homeobox 2
#> 19           zinc finger and SCAN domain containing 22
#> 20                                      Nanog homeobox
#> # ... with 11 more variables: Anatomical.Component <chr>,
#> #   Assay.Type <chr>, Theiler.Stage <chr>, Tissue <chr>,
#> #   Expression.Strength <chr>, Expression.Pattern <chr>,
#> #   Expression.Pattern.Location <chr>, Authors <chr>, Notes <chr>,
#> #   v_uuid <chr>, Source <chr>
```
