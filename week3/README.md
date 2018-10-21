## R Package
- An R Package is a collection of R function or other (data) objects, organized in a systematic fashion to provide some consistency
- Mainly, available in CRAN and Bioconductor via `install.packages()`
- GitHub packages can be installed using `install_github()` from `devtools` package
- Checking the package: R CMD check -> does the documentation exist? Code can be loaded? Run examples in documentation, etc.
- `package.skeleton()` to getting started

### Elements
- Directory with the name of the R package
- Description file (Packege, Title, Description, Version, Author(s), Mantainer, License, Depends, Suggest, URL, Date, Other, Imports )
- R code (in R subdirectory)
- Documentation (.Rd file in a man subdirectory)
- Namespace (optional) (Which function are exported? which libraries are imported?)
- Requirements (R extensions)

### Classes and Methods
- S4 methods/classes are the new standard for creating classes and methods
- `library(methods)` loaded by default
- A class is a description of a thing
- An object is an instance of that class
- A method is a function that only operates on a certain class of objects
- A generic method is a R function which dispatches methods

## Value of contracts (in billions of COP) in the colombian government

```{r, comment="", echo=FALSE, eval=TRUE, warning=FALSE, message=FALSE}
values <- contract_co[order(-contract_co$value),]
summary_contract_co <- aggregate(contract_co$value, by=list(contract_type=contract_co$contract_type, year=contract_co$year), FUN=sum)
plot_ly(x = summary_contract_co$year, y = summary_contract_co$x, type = "scatter", 
        mode = "markers", color = ~factor(summary_contract_co$contract_type))
```
