% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/get_dump_scChambers.R
\encoding{UTF-8}
\name{get_dump_scChambers}
\alias{get_dump_scChambers}
\title{Download all Supreme Court chambers}
\usage{
get_dump_scChambers(simplify = FALSE)
}
\arguments{
\item{simplify}{Logical. If \code{TRUE} results will be returned as
\code{data.frame}.}
}
\value{
If \code{simplify = FALSE} the list of all Supreme Courts chambers
  as returned from API. Every element of the list represents one chamber and
  has the following, illustrative structure: \cr
  List of 3 \cr
  $ id       : int 1 \cr
  $ name     : chr "Izba Karna" \cr
  $ divisions:List of 6 \cr
  ..$ :List of 3 \cr
  .. ..$ id      : int 1 \cr
  .. ..$ name    : chr "Wydział VI" \cr
  .. ..$ fullName: chr "Izba Karna Wydział VI" \cr
  ..$ :List of 3 \cr
  .. ..$ id      : int 4 \cr
  .. ..$ name    : chr "Wydział I" \cr
  .. ..$ fullName: chr "Izba Karna Wydział I" \cr
  .. ... \cr

   Detailed description of the meaning of all elements could be found in
   \code{\link[saos]{scchambers}}.

   If \code{simplify = TRUE} a \code{data.frame} as described in
   \code{\link[saos]{scchambers}} is returned.
}
\description{
Download information about all chambers of the Supreme Court of Poland.
}
\seealso{
\code{\link[saos]{scchambers}}, \code{\link[saos]{get_dump_courts}}
}

