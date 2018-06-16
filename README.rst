===============================
RUN
===============================


.. image:: https://img.shields.io/pypi/v/run.svg
        :target: https://pypi.python.org/pypi/run

.. image:: https://img.shields.io/travis/mmaiers-nmdp/run.svg
        :target: https://travis-ci.org/mmaiers-nmdp/run

.. image:: https://readthedocs.org/projects/run/badge/?version=latest
        :target: https://run.readthedocs.io/en/latest/?badge=latest
        :alt: Documentation Status

.. image:: https://pyup.io/repos/github/mmaiers-nmdp/run/shield.svg
     :target: https://pyup.io/repos/github/mmaiers-nmdp/run/
     :alt: Updates


Regigstry of Unmet Need analysis pipeline


* Free software: Apache 2.0
* Documentation: https://run.readthedocs.io.


Features
--------

Start with a list of HLA genotypes that do not have a match worldwide.
Perform a series of analyses to determine if there are patterns in terms of global regions or 
populations that can be identified as a target for future recruitment.



## 0. preprocessing
  * validate HLA types
  * convert to glstring
  * reduce to ARD

## 1. allele analysis
* CWD for 8 alleles (A, B, C, DRB1) x 2
  * identify how many are not in CWD list
   
* Global region analysis for 8 alleles 
  * (number of regions 0-12)

## 2. Haplotype Analysis
* Perform Genotype Imputation
  * note if a pair of haplotypes can be identified or not
  * note which populations carry haplotype(s)
  * perform Bayes' population classification
  * perform geospatial analysis on haplotype(s)
    
* Search prognosis tool
  * run for each genotype
  * categorize based on expected genotype frequency



