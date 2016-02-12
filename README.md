

# Regrans 0.0.1

Segmented Linear Regression Models

## Introduction

Regrans was designed to fit segmented regression models.

## Download and install

### Linux/Mac

Use the `devtools` package (available from
[CRAN](http://cran-r.c3sl.ufpr.br/web/packages/devtools/index.html)) to
install automatically from the official Git repository:


```r
library(devtools)
install_github("fernandomayer/Regrans")
```

Alternatively, download the package tarball: [Regrans_0.0.1.tar.gz][]
and run from a UNIX terminal (make sure you are on the container file
directory):


```
R CMD INSTALL -l /path/to/your/R/library Regrans_0.0.1.tar.gz
```

Or, inside an `R` session:



```
install.packages("Regrans_0.0.1.tar.gz", repos = NULL,
                 lib.loc = "/path/to/your/R/library",
                 dependencies = TRUE)
```

Note that `-l /path/to/your/R/library` in the former and `lib.loc =
"/path/to/your/R/library"` in the latter are optional. Only use it if you
want to install in a personal library, other than the standard R
library.

### Windows

Download Windows binary version: [Regrans_0.0.1.zip][] (**do not unzip
it under Windows**), put the file in your working directory, and from
inside `R`:


```
install.packages("Regrans_0.0.1.zip", repos = NULL,
                 dependencies = TRUE)
```

## Documentation

The reference manual in PDF can be found here: [Regrans-manual.pdf][]

## License

This package is released under the
[GNU General Public License (GPL) v. 3.0](http://www.gnu.org/licenses/gpl-3.0.html)



[Regrans_0.0.1.tar.gz]: https://github.com/rodrigosantana/Regrans/blob/master/downloads/Regrans_0.0.1.tar.gz?raw=true
[Regrans_0.0.1.zip]: https://github.com/rodrigosantana/Regrans/blob/master/downloads/Regrans_0.0.1.zip?raw=true
[Regrans-manual.pdf]: https://github.com/rodrigosantana/Regrans/raw/master/downloads/FishMaps-manual.pdf
