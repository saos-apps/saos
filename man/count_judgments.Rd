% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/count_judgments.R
\name{count_judgments}
\alias{count_judgments}
\title{Count number of results for a given search}
\usage{
count_judgments(all = NULL, legalBase = NULL, referencedRegulation = NULL,
  judgeName = NULL, caseNumber = NULL, courtType = NULL,
  ccCourtType = NULL, ccCourtId = NULL, ccCourtCode = NULL,
  ccCourtName = NULL, ccDivisionId = NULL, ccDivisionCode = NULL,
  ccDivisionName = NULL, scPersonnelType = NULL, scChamberId = NULL,
  scChamberName = NULL, scDivisionId = NULL, scDivisionName = NULL,
  judgmentTypes = NULL, keywords = NULL, judgmentDateFrom = NULL,
  judgmentDateTo = NULL, sortingField = NULL, sortingDirection = NULL)
}
\arguments{
\item{all}{Character, character vector or a list, see "Query details" section.
Search everywhere for given phrase.}

\item{legalBase}{Character, character vector or a list, see "Query details"
section. Search for legal basis of judgments.}

\item{referencedRegulation}{Character, character vector or a list, see
"Query details" section. Search for regulations referenced in judgments.}

\item{judgeName}{Character. Search for the name of any involved judge.}

\item{caseNumber}{Character. Search for judgments with a given signature.}

\item{courtType}{Character, one from COMMON, SUPREME, ADMINISTRATIVE,
CONSTITUTIONAL_TRIBUNAL, NATIONAL_APPEAL_CHAMBER. Search for a type of
a court.}

\item{ccCourtType}{Character, one from APPEAL, REGIONAL, DISTRICT. Search for
a type of a common court.}

\item{ccCourtId}{Positive integer. Search for the given common court's ID.}

\item{ccCourtCode}{Character. Search for the given common court's code.}

\item{ccCourtName}{Character. Search for the given common court's name.}

\item{ccDivisionId}{Positive integer. Search for the given common court
division's ID.}

\item{ccDivisionCode}{Character. Search for the given common court division's
code.}

\item{ccDivisionName}{Character. Search for the given common court division's
name.}

\item{scPersonnelType}{Character, one from ONE_PERSON, THREE_PERSON,
FIVE_PERSON, SEVEN_PERSON, ALL_COURT, ALL_CHAMBER, JOINED_CHAMBERS. Search
for the type of judgment's personnel in the Supreme Court.}

\item{scChamberId}{Positive integer. Search for the Supreme Court chamber's ID.}

\item{scChamberName}{Character. Search for the Supreme Court chamber's name.}

\item{scDivisionId}{Positive integer. Search for the Supreme Court chamber
division's ID.}

\item{scDivisionName}{Character. Search for the Supreme Court chamber
division's name.}

\item{judgmentTypes}{Character vector, subset of DECISION, RESOLUTION,
SENTENCE, REGULATION, REASONS. Search for judgments with any of given types.}

\item{keywords}{Character. Search for keywords of judgments.}

\item{judgmentDateFrom}{Any date/time object that could be properly converted
with \code{as.POSIXct}, or a string in a format "\%Y-\%m-\%d". Represents
the earliest allowed judgment's date on the list.}

\item{judgmentDateTo}{Any date/time object that could be properly converted
with \code{as.POSIXct}, or a string in a format "\%Y-\%m-\%d". Represents
the latest allowed judgment's date on the list.}

\item{sortingField}{Character. Represents the field by which you want to sort a list
of items, one from: DATABASE_ID, JUDGMENT_DATE, CASE_NUMBER, CC_COURT_TYPE,
CC_COURT_ID, CC_COURT_CODE, CC_COURT_NAME, CC_COURT_DIVISION_ID,
CC_COURT_DIVISION_CODE, CC_COURT_DIVISION_NAME, SC_JUDGMENT_FORM,
SC_PERSONNEL_TYPE, SC_COURT_DIVISION_ID, SC_COURT_DIVISION_NAME,
SC_COURT_DIVISIONS_CHAMBER_ID, SC_COURT_DIVISIONS_CHAMBER_NAME.}

\item{sortingDirection}{Character, one from ASC, DESC. Indicates whether sort
  should be increasing or decreasing.}
}
\value{
the number of results (integer)
}
\description{
Count the number of results for a given search. Useful to check before
 attempting to download a huge number of records, which could be very
 memory and time consuming.
}
\section{Query details}{

All parameters are case insensitive.

A few parameters (\code{"all", "legalBase", "referencedRegulation"}) support
  advanced query parsing:
  \itemize{
  \item when query contains multiple words then search for judgments that
    contain all of these words, as if connected by implicit AND operator;
    e.g. \code{"dobra osobiste"},
  \item operator "OR" - search for judgments that contains one of the words
    in a query, e.g. \code{"dobra OR osobiste"},
  \item quote - search for judgments that contains whole phrase,
    e.g. \code{"\\"dobra osobiste\\""}; note that in R we need to escape
    quotation marks to obtain expected result,
  \item minus sign - search for judgments that don't contain this word,
    e.g. \code{"dobra -osobiste"}.
    }
 Operators could be mixed, e.g \code{"\"dobra osobiste\" OR kodeks"}, with
 precedence: quote, minus sign, OR, implicit AND. OR takes into account only two
 immediate neighbours, so query \code{"dobra osobiste OR kodeks"} will search
 for judgments containing words \code{"dobra"} and at least one from set
 \code{\{"osobiste", "kodeks"\}}.

 Qutation on a single word has no effect.

 A parameter could be a character vector or a list with any of two fields:
 \code{include} and \code{exclude}, which have to be character vectors or
 \code{NULLs}. In case of a vector, if it has length one (i.e. single string)
 it will be send to API as is. If it has two or more elements they
 will be pasted with a space (i.e. implicit AND operator).
 In case of a list elements of \code{include}
 field will be pasted with a space and elements of \code{exclude} field will
 be preceded with "-" operator and then pasted with a space.
 WARNING - every element will be treated as exact phrase, so if you want to
 include or exclude a few words independently, you need to use a single
 element for every word. For example

 \code{list(include = c("dobra osobiste", "kodeks karny"), exclude = "kodeks cywilny")}

 will turn to

 \code{"\\"dobra osobiste\\" \\"kodeks karny\\" -\\"kodeks cywilny\\""},

 or

 \code{c("kodeks karny", "cywilny")}

 will turn to

 \code{"\\"kodeks karny\\" cywilny"}.

Another special parameter is \code{judgmentTypes}. It accepts a character
 vector with any subset of set \{"DECISION", "RESOLUTION", "SENTENCE",
 "REGULATION", "REASONS"\}. API will return judgments with type matching
 anyone from the given vector.
}
\examples{
\donttest{
 count_judgments(judgmentDateFrom="2014-01-01")
 count_judgments(judgeName="Maria Tyszel", judgmentDateTo="2014-06-30")


 ## Examples of query operators, starting from most general query.

 # any of two words
 AorB <- count_judgments(all = "dobra OR osobiste")

 # both words
 AandB <- count_judgments(all = "dobra osobiste")

 # exactly given phrase
 count_judgments(all = "\\"dobra osobiste\\"")

 # one word but not the other
 onlyA <- count_judgments(all = "dobra -osobiste")
 onlyB <- count_judgments(all = "-dobra osobiste")
 AorB == AandB + onlyA + onlyB

 ## Mixing operators
 # in one string
 count_judgments(all = "\\"dobra osobiste\\" -\\"dobra publiczne\\"")

 # as a list
 count_judgments(all = list(include = "dobra osobiste",
                            exclude = "dobra publiczne"))
  }
}
\seealso{
\code{\link[saos]{search_judgments}}
}

