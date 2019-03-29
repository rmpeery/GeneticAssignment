# GeneticAssignment
Scripts used to format files for analysis - Affymetrix SNP data to structure and genepop formats. Including clunky loop scripts to generate replicates of datasets.

General workflow for removing SNPs in LD:

#make .ped and .map files from .str file in PGDspider

#run in terminal

$ plink --file filename --r2 inter-chr --ld-window-r2 0

$ mv plink.ld filename_plink.ld

$ tr -s ' ' <filename_plink.ld | tr ' ' ',' > filename.plink.ld.csv

$ awk -F "," '{$1=""; print $0}' <filename.plink.ld.csv >filename.R2.csv

#in R
r2 <- read.csv("filename.R2.csv", header = T, sep = " ")

#adds the adjusted p values to the table r2

padj <- p.adjust(r2$R2, method = "fdr", n = length(r2$R2))

r2$r2p.adj <- padj

write.table(r2, "filename.R2adj.txt")

quit()

#in terminal

$ grep '0\.8*' filename.R2adj.txt > filename.R2adj_InLD.txt

$ awk '{print $8}' <filename.R2adj_InLD.txt >filename.R2adj_InLDlist.txt

$ sort -u filename.R2adj_InLDlist.txt > filename.probesInLDlist.txt

Workflow for making files:
1. Make lists using a brute forceshell – makeLists.sh
  Example:
  
  $ head -n 101 subsetsRandomizedLists.txt > 100LociRandomizedList.txt
  
  $ awk '{print $1}' 100LociRandomizedList.txt > subset1_100lociList.list
    
2. loopSepSNPfiles_mac.pl
3. loop_addHeader.pl
4. loop_transpose.pl
5. makeStrFiles_perlOneLiners.sh
6. Have to open files and delete the 1st two things on the first line
7. Run a loop to generate genepop files – str2genepop_mac.pl
9. loop_remove.pl
10. Ready to run through GeneClass2 (Windows program; Piry et al. 2004).
11. Then pulled the lines needed for creating averages:
  Example:
  $ awk -F";" '{ print $2 "\t" $3 }' subset1_3415loci.csv > subset1_3415loci.tsv
  
12. Find and replace in BBedit
  Find: M052_(\S+)_(d+)_.+
  Replace: \1\2

Referenced programs:

S. Piry, A. Alapetite, J.-M. Cornuet, D. Paetkau, L. Baudouin, and A. Estoup. 2004. GENECLASS2: A Software for Genetic Assignment and First-Generation Migrant Detection. Journal of Heredity 95(6): 536–539. https://doi.org/10.1093/jhered/esh074

J. K. Pritchard, M. Stephens, and P. Donnelly. 2000. Inference of Population Structure Using Multilocus Genotype Data
Genetics 155(2): 945-959.

M. Raymond and F. Rousset. 1995. GENEPOP (Version 1.2): Population Genetics Software for Exact Tests and Ecumenicism. Journal of Heredity 86(3): 248–249. https://doi.org/10.1093/oxfordjournals.jhered.a111573

PLINK - http://zzz.bwh.harvard.edu/plink/
