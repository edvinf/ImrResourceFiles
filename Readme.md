# Imr Resource file draft repository
This repository is a draft structure for suggesting a way to share resource files for data analysis at IMR.

## Resource files
Resource files are configuration files for analysis that encode some kind of configurable definition. Typical examples include:
* Files that specify how different coding systems should be related, for instance mappings between gear codes.
* Included in this is mapping to grouping variables, for example mapping gear codes to coarse gear-categories or mapping species codes to functionally defined categories (demershal-fish vs pelagic fish, trophic-level definitions, etc.)
* Files that specify a large number of parameter values for a kind of computation, that are impractically to enter into computations in typical user interfaces. For instance length- or weightconversion parameters, spatial strata-definitions, etc.

Resource files are different from code-lists in that they are configurable. Code lists (like those in NMDreference) are fixed definitions. Code-lists may be annotated with mappings to other code-lists when equivalences are defined. You may for instance find several sets of species codes in a taxonomic code list. Often semi-standardized mappings between codes are useful for many purposes, but the mapping is pragmatic and not fit for all purposes, so they are not suitable for inclusion in code-list. Similarly estimated conversion factors may have sufficient precision for some purposes, but not for others. They are then typically not suitable for inclusion in code-lists. 

All such semi-standardized information may be treated as resource-files and it is valuable to store and share these in a semi-structured way. This repository is an attempt at providing that.

## Package
The repository is provided as an R-package in order to support some quality checks, but resource-files can be downloaded without installing the package or any software.

## Documentation
All resourcefiles that are shared should be accompanied by a file that describes:
* Description: A description of the resource, and in particular for what purpose the resource file was obtained
* Format: Definitions for all fields in the resource-files. For StoX-files these are documented in StoX, and it is sufficient to indicate that.
* Author: Who made it

A test that verifies that documentation exist for all resource files is located in:
* tests/testthat/readmecheck.R

## Format
All resource files and documentation files should be formatted in plain-text and be UTF-8 encoded.

## StoX files
At IMR StoX provide a framework for estimation, and many processess in StoX support reading parameters from resource files. In order to more make it easy to relate resource files to the process that supports them a separate storage convention is defined for StoX-resource files. They are stored in:
* inst/stoxfiles/<name of stox process>/<resourcefilename>
* inst/stoxfiles/<name of stox process>/README_<resourcefilename>.md

For these files a test that confirms that the process can be correctly read is located in tests/testthat/test-stoxfile_<name of stox process>.R

A similar layout may be defined for other software.

## Other resource files
Resource files that are not made for a particular software are stored in a thematic directory, e.g for resource files related to gears:
* inst/otherfiles/gear/<resourcefilename>
* inst/otherfiles/gear/README_<resourcefilename>.md

For these file a test that illustrates how files can be read into R is located in
* tests/testthat/test-<name of thematic directory>.R

## Other utility
The package may be a suitable home for functions that are commonly used to prepare resource files. For instance code for converting shapefiles in different formats to the WKT-format supported by StoX.
