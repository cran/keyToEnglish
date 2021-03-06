% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/keyToEnglish.R
\name{keyToEnglish}
\alias{keyToEnglish}
\title{Key to English}
\usage{
keyToEnglish(
  x,
  hash_function = "md5",
  phrase_length = 5,
  corpus_path = NA,
  word_list = wl_common,
  hash_subsection_size = 3,
  sep = "",
  word_trans = "camel",
  suppress_warnings = FALSE,
  hash_output_length = NA,
  forced_limit = NA,
  numeric_append_range = NA
)
}
\arguments{
\item{x}{- field to hash}

\item{hash_function}{`character` name of hash function or hash `function` itself,
returning a hexadecimal character}

\item{phrase_length}{`numeric` of words to use in each hashed key}

\item{corpus_path}{`character` path to word list, as a single-column text file with one
word per row}

\item{word_list}{`character` list of words to use in phrases}

\item{hash_subsection_size}{`numeric` length of each subsection of hash to use for word index. 16^N
unique words can be used for a size of N. This value times
phrase_length must be less than or equal to the length of the
hash output. Must be less than 14.}

\item{sep}{`character` separator to use between each word.}

\item{word_trans}{A `function`, `list` of functions, or 'camel' (for CamelCase). If
a list is used, then the index of the word of each phrase is
mapped to the corresponding function with that index,
recycling as necessary}

\item{suppress_warnings}{`logical` value indicating if warning of non-character
input should be suppressed}

\item{hash_output_length}{optional `numeric` if the provided hash function is not a `character`. This is used
to send warnings if the hash output is too small to provide full range of all
possible combinations of outputs.}

\item{forced_limit}{for multiple word lists, this is the maximum number of values used for calculating the index
(prior to taking the modulus) for each word in a phrase. Using this may speed up processing
longer word lists with a large least-common-multiple among individual word list lengths. This
will introduce a small amount of bias into the randomness. This value should be much larger than
any individual word list whose length is not a factor of this value.}

\item{numeric_append_range}{optional `numeric` value of two integers indicating range of integers to append onto data}
}
\value{
`character` vector of hashed field resembling phrases
}
\description{
Hashes field to sequence of words from a list.
}
\examples{
# hash the numbers 1 through 5
keyToEnglish(1:5)

# alternate upper and lowercase, 3 words only
keyToEnglish(1:5, word_trans=list(tolower, toupper), phrase_length=3)
}
