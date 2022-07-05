#-----------------------------------------------------------------------
# De Rnw para PDF.

utils::Sweave("docsweave.Rnw", encoding = "utf-8")
utils::Stangle("docsweave.Rnw", encoding = "utf-8")

#-----------------------------------------------------------------------
# Com LibreOffice ODT.

# remotes::install_github("cran/odfWeave")
library(odfWeave)

odfWeave(file = "doc_in.odt", dest = "doc_out.odt")

#-----------------------------------------------------------------------
