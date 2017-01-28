# MITE_Hunter_2
Minor edits to allow MITE_Hunter (Han &amp; Wessler 2010) to use modern BLAST+


makeblastdb replaces formatdb
blastall is now called via legacy_blast.pl
*Note*: May need to correct path to blast+ packages in legacy_blast.pl if not /usr/bin
i.e. #use constant DEFAULT_PATH => "/usr/local/ncbi/blast/bin";

*Note*: Step 6 still requires blast2 blastall as legacy_blast.pl default output from blastn cannot be parsed by MITE_Hunter_worker3.pl 'tblastn()' function due to slight variation in format.

#Get dependencies
get mdust from: ftp://occams.dfci.harvard.edu/pub/bio/tgi/software/seqclean/mdust.tar.gz
tar -xvzf mdust.tar.gz 
cd mdust
make

get muscle from: http://www.drive5.com/muscle/downloads.htm

#Example install
perl MITE_Hunter_Installer.pl \
-d /Users/username/MITE_Hunter_2/ \
-f /usr/local/ncbi/blast/bin/makeblastdb \
-b /usr/local/ncbi/blast/bin/legacy_blast.pl \
-m /home/username/MITE_Hunter/src/mdust/mdust \
-M /usr/local/bin/muscle

#Example run
perl MITE_Hunter_manager.pl -i Genome.fasta -g Gen_MITE -w 5000 -c 11 -L 80 -I 80 -m 2 -S 12

perl MITE_Hunter_manager.pl -i Genome.fasta -g Gen_MITE -w 5000 -c 11 -L 80 -I 80 -m 2 -S 345678

#Steps
Step 1: Make whole genome blast db. Split Genome into fragments.

	- Output: Gen_MITE_Step1.fa

Step 2: Split genome fragments into groups, search groups for candidate MITEs with TSDs using MITE_Hunter_worker1.pl

	- Output: Gen_MITE.*.TSD.*

Step 3: Merge candidate MITEs, run mdust, filter candidates on mdust thresholds.

	- Output: Gen_MITE_Step2.fa, Gen_MITE_Step2.fa.dusted, Gen_MITE_Step3.fa

Step 4: Classify candidates into groups based on their length. Self blast within groups and filter with MITE_Hunter_worker2.pl

	- Output: Gen_MITE_Step4.fa

Step 5: 

Step 6: 

Step 7: 

Step 8: 
