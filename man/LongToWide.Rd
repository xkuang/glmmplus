\name{LongToWide}
\alias{LongToWide}
\alias{longToWide}

\title{LongToWide: Convert nested long structures to wide multivariate structures}
\description{In longitudinal or other multiple response studies, data presented in a long format 
will often feature dependence between rows. While this is the preferred format for lme4, such a
format would hide important information from multiple imputation models and make the MAR assumption
less plausible. Hense, the suggestion is to impute data in a wide format, where rows are again independent,
and then return the mids object to a long format for use with FitModel, ForwardSelect, or BackwardEliminate.}

\usage{
WideToLong(data, id.name, response.base, time.varying.bases = c(""), sep = ".")
}

\arguments{
  \item{data}{
	  A data frame or mids object in "long" format owing to multiple measurements 
    within the same subject. 
  }
  \item{id.name}{
	  The subject id, a character string.  
  }
  \item{period.name} {
    The repeated measurement (within subject) identifier. In a longitudinal study, this will be time.
  }
  \item{time.varying.vars}{
   A character vector of variable names that take multiple values per subject (in different rows)
  }
  \item{sep}{
   The character delimiter by which to separate the variable name base from the period identifier.
   }
}
\seealso{\code{\link{WideToLong}}}

\examples{

# Example of the long-to-wide, impute, wide-to-long strategy
library(glmmplus)
data(nls.97)
nls.97[1:10, 1:4]

nls.wide <- LongToWide(nls.97, id.name = "PUBID.1997", period.name = "age",
                       time.varying.vars = c("math.cs"))

nls.wide[1:2, c(1:2, 20:29)]
mids <- ImputeData(nls.wide, m = 5, maxit = 15, droplist = c("PUBID.1997"))
mids.long <- WideToLong(mids, "PUBID.1997", "math.cs")
}

\references{
	 Stef van Buuren, Karin Groothuis-Oudshoorn (2011). mice: Multivariate Imputation by Chained Equations in R. Journal of Statistical Software, 45(3), 1-67. URL
	   http://www.jstatsoft.org/v45/i03/.
}
