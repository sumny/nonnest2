% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/icci.R
\name{icci}
\alias{icci}
\title{Information Criteria Confidence Intervals}
\usage{
icci(object1, object2, conf.level = 0.95, ll1 = llcont, ll2 = llcont)
}
\arguments{
\item{object1}{a model object}

\item{object2}{a model object}

\item{conf.level}{confidence level of the interval}

\item{ll1}{an optional function for computing log-likelihood contributions of object1}

\item{ll2}{an optional function for computing log-likelihood contributions of object2}
}
\value{
an object of class \code{icci} containing test results.
}
\description{
Calculate confidence intervals of AIC and BIC for non-nested models.
}
\details{
Functionality is currently available for models of classes
\code{lm}, \code{glm}, \code{glm.nb}, \code{clm}, \code{hurdle}, \code{zeroinfl}, \code{mlogit}, \code{nls}, \code{polr}, \code{rlm}, and \code{lavaan}.

Users should take care to ensure that the two models have
the same dependent variable (or, for lavaan objects, identical
modeled variables), with observations ordered identically within
each model object.  Assuming the same data matrix is used to fit each model,
observation ordering should generally be identical.  There are currently
no checks for this, however.

Note: if models are nested or if the "variance test" from
\code{vuongtest()} indicates models are indistinguishable, then the
intervals returned from \code{icci()} will be incorrect.
}
\examples{
\dontrun{
## Count regression comparisons
require(MASS)
house1 <- glm(Freq ~ Infl + Type + Cont, family=poisson, data=housing)
house2 <- glm(Freq ~ Infl + Sat, family=poisson, data=housing)

## CI for BIC
icci(house2, house1)

## Further comparisons to hurdle, zero-inflated models
require(pscl)
bio1 <- glm(art ~ fem + mar + phd + ment, family=poisson, data=bioChemists)
bio2 <- hurdle(art ~ fem + mar + phd + ment, data=bioChemists)
bio3 <- zeroinfl(art ~ fem + mar + phd + ment, data=bioChemists)
icci(bio2, bio1)
icci(bio3, bio1)
icci(bio3, bio2)

## Latent variable model comparisons
require(lavaan)
HS.model <- 'visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '
fit1 <- cfa(HS.model, data=HolzingerSwineford1939)
fit2 <- cfa(HS.model, data=HolzingerSwineford1939, group="school")
icci(fit1, fit2)
}

}
\references{
Vuong, Q. H. (1989).  Likelihood ratio tests for model selection and non-nested hypotheses.  \emph{Econometrica, 57}, 307-333. <DOI:10.2307/1912557>

Merkle, E. C., You, D., & Preacher, K. (2016). Testing non-nested structural equation models.  \emph{Psychological Methods, 21}, 151-163. <DOI:10.1037/met0000038>
}
\author{
Ed Merkle and Dongjun You
}
