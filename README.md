# RUN

##Regigstry of Unmet Need analysis pipeline

* analysis of a cohort (not included) of patients with no match in the global collected regisries of the World Marrow Donor Assocation [WMDA] (http://wmda.info)
* Free software: LGPL v3

Features
--------

Start with a list of HLA genotypes that do not have a match worldwide.
Perform a series of analyses to determine if there are patterns in terms of global regions or 
populations that can be identified as a target for future recruitment.



Preprocessing
-------------
```
./pre.sh
```
  1. vaidate HLA types
  2. convert to glstring
  3. reduce to ARD

Allele analysis
---------------
```
cwd/cwd.sh
```
  1. CWD for 8 alleles (A, B, C, DRB1) x 2
  2. identify how many are not in CWD list
  3. Global region analysis for 8 alleles 
     - (number of regions 0-12)

Haplotype Analysis
------------------
  1. Perform Genotype Imputation
  2. note if a pair of haplotypes can be identified or not
  3. note which populations carry haplotype(s)
  4. perform Bayes' population classification
  5. perform geospatial analysis on haplotype(s)
  6. Search prognosis tool
    - run for each genotype
    - categorize based on expected genotype frequency


Credits
-------
World Marrow Donor Assocation [WMDA] (http://wmda.info)
