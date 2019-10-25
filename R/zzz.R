.onAttach <- function(lib, pkg) {
    pkg.info <- drop(read.dcf(
        file = system.file("DESCRIPTION", package = "Regrans"),
        fields = c("Package", "Title", "Version", "Date", "URL")
    ))
    dashes <- paste0(rep("----------", times = 7), collapse = "")
    packageStartupMessage(
        paste0(dashes, "\n  ",
               pkg.info["Package"], ": ", pkg.info["Title"], "\n  ",
               pkg.info["Package"], " version ", pkg.info["Version"],
               "\n", dashes)
    )
}
