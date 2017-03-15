context("lexical_sentences")

test_that("lexical_sentences", {
  tt <- lexical_sentences("cellular")
  
  expect_is(tt, "list")
  expect_match(tt$sentence, "cellular")
})
