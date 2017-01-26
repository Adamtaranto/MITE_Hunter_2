# MITE_Hunter_2
Minor edits to allow MITE_Hunter (Han &amp; Wessler 2010) to use modern BLAST+

blastall is now called via legacy_blast.pl

makeblastdb replaces formatdb

#Example install
perl MITE_Hunter_Installer.pl \
-d /Users/username/MITE_Hunter_2/ \
-f /usr/local/ncbi/blast/bin/makeblastdb \
-b /usr/local/ncbi/blast/bin/legacy_blast.pl \
-m /Users/username/MITE_Hunter_2/src/tgicl/bin/mdust \
-M /usr/local/bin/muscle

#Example run
perl MITE_Hunter_manager.pl -i Genome.fasta -g Gen_MITE -w 5000 -c 11 -L 80 -I 80 -m 2 -S 12345678