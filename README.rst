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



Preprocessing
-------------

  1. vaidate HLA types
  2. convert to glstring
  3. reduce to ARD

Allele analysis
---------------
  1. CWD for 8 alleles (A, B, C, DRB1) x 2
  2. identify how many are not in CWD list
  3. Global region analysis for 8 alleles 
     - (number of regions 0-12)

Haplotype Analysis
------------------
  1. Perform Genotype Imputation
  * note if a pair of haplotypes can be identified or not
  * note which populations carry haplotype(s)
  * perform Bayes' population classification
  * perform geospatial analysis on haplotype(s)
  * Search prognosis tool
    - run for each genotype
    - categorize based on expected genotype frequency


Credits
-------
World Marrow Donor Assocation `WMDA
<http://wmda.info/>`_.
