% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/package.R
\docType{package}
\name{debugme}
\alias{debugme}
\alias{debugme-package}
\title{Debug R Packages}
\usage{
debugme(env = topenv(parent.frame()), pkg = environmentName(env))
}
\arguments{
\item{env}{Environment to instument debugging in. Defaults to the
package environment of the calling package.}

\item{pkg}{Name of the calling package. The default should be fine
for almost all cases.}
}
\description{
Specify debug messages as special string constants, and control
debugging of packages via environment variables.
}
\details{
To add debugging to your package, you need to
1. Import the `debugme` package.
2. Define an `.onLoad` function in your package, that calls `debugme`.
   An example:
   ```r
   .onLoad <- function(libname, pkgname) { debugme::debugme() }
   ```

By default debugging is off. To turn on debugging, set the `DEBUGME`
environment variable to the names of the packages you want to debug.
Package names can be separated by commas.

Note that `debugme` checks for environment variables when it is starting
up. Environment variables set after the package is loaded do not have
any effect.

Example `debugme` entries:
```
"!DEBUG Start Shiny app"
```
}
\section{Dynamic debug messsages}{


It is often desired that the debug messages contain values of R
expressions evaluated at runtime. For example, when starting a Shiny
app, it is useful to also print out the path to the app. Similarly,
when debugging an HTTP response, it is desired to log the HTTP status
code.

`debugme` allows embedding R code into the debug messages, within
backticks. The code will be evaluated at runtime. Here are some
examples:
```
"!DEBUG Start Shiny app at `path`"
"!DEBUG Got HTTP response `httr::status_code(reponse)`"
```

Note that parsing the debug strings for code is not very sophisticated
currently, and you cannot embed backticks into the code itself.
}

\section{Redirecting the output}{


If the `DEBUGME_OUTPUT_FILE` environment variable is set to
a filename, then the output is written there instead of the standard
output stream of the R process.
}

