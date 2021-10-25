# 2018-06-24

# pre
./pre.sh

# perform CWD analysis
perl ./flagCWD < ../output/global.2018-06-20.pre.txt >../output/global.2018-06-20.cwd.txt

# tally results

grep -v "\/" ../output/global.2018-06-20.cwd.txt |grep -v None |grep -v ":XX" >../output/global.2018-06-20.cwd.good.txt 




# 40 cases of a rare allele
grep -v "/" out.flagCWD |grep -v XX |grep -v None |sort -k 5,6 |grep -v "     [12]    [12]"
	


# cwd analysis summary
6 missing HLA
	1 missing DRB1
	5 missing C
61 no CWD
	typing too new: B*15:08:01 # ARD redux will fix
	MAC A*02:ABGEV # MAC expand and ARD redux will help/fix
66 are XX
	A*01:XX # MAC expand and ARD redux will help/fix
o


./stats |grep rare >../output/t2.rare.txt

	
