#!/usr/local/bin/perl -w
# build the MITE_Hunter system 
# Written by Yujun Han
# 8/19/2010
#-----------------------------------------------------
use Getopt::Std;
#-----------------------------------------------------
getopts("d:f:b:m:M:o:h:");

$MITE_Hunter_Dir = defined $opt_d ? $opt_d : "";
$Makeblastdb     = defined $opt_f ? $opt_f : "makeblastdb";
$Legacyblast     = defined $opt_b ? $opt_b : "legacyblast";
$Mdust           = defined $opt_m ? $opt_m : "";
$Muscle          = defined $opt_M ? $opt_M : "";
$Help            = defined $opt_h ? $opt_h : "";

usuage() if((!$MITE_Hunter_Dir)||($Help));
#-----------------------------------------------------

$BFI	= $MITE_Hunter_Dir."blast_makeblastdb_index.pl";
$FWM	= $MITE_Hunter_Dir."fasta_windows_maker.pl";
$FS		= $MITE_Hunter_Dir."fasta_spliter.pl";
$MHW1	= $MITE_Hunter_Dir."MITE_Hunter_worker1.pl";
$LCF	= $MITE_Hunter_Dir."low_complexity_filter.pl";
$MHW2	= $MITE_Hunter_Dir."MITE_Hunter_worker2.pl";
$EM		= $MITE_Hunter_Dir."examplar_maker.pl";
$MHW3	= $MITE_Hunter_Dir."MITE_Hunter_worker3.pl";
$MHW4	= $MITE_Hunter_Dir."MITE_Hunter_worker4.pl";
$RI		= $MITE_Hunter_Dir."reads_indexer.pl";
$PHI	= $MITE_Hunter_Dir."IDTE_PHI.pl";
$ITFM	= $MITE_Hunter_Dir."identify_TE_from_mutialign.pl";

@Raw_Files = glob "*.npl";
foreach(@Raw_Files) {
	$NPL = $_;
	open(RF, "$NPL")||die"$!\n";
	$PL = $NPL;
	$PL =~ s/\.npl/\.pl/;
	open(PL, ">$PL")||die"$!\n";
	while(<RF>) {
		chomp;
		$Line = $_;

		$Line =~ s/_makeblastdb_/$Makeblastdb/;
		$Line =~ s/_legacyblast_/$Legacyblast/;
		$Line =~ s/_mDust_/$Mdust/;
		$Line =~ s/_muscle_/$Muscle/;
		
		$Line =~ s/_BFI_/$BFI/;
		$Line =~ s/_FWM_/$FWM/;
		$Line =~ s/_FS_/$FS/;
		$Line =~ s/_MHW1_/$MHW1/;
		$Line =~ s/_LCF_/$LCF/;
		$Line =~ s/_MHW2_/$MHW2/;
		$Line =~ s/_EM_/$EM/;
		$Line =~ s/_MHW3_/$MHW3/;
		$Line =~ s/_MHW4_/$MHW4/;
		$Line =~ s/_RI_/$RI/;
		$Line =~ s/_PHI_/$PHI/;
		$Line =~ s/_ITFM_/$ITFM/;
	
		print(PL "$Line\n");
	}
	close(RF);
	close(PL);

	system "chmod 755 $PL\n";
}

print "\n\n-------------------- Thank you for using MITE_Hunter -----------------\n\n";
print "Install finished! Please start with the manage program: MITE_Hunter_manager.pl\n";
print "If you input the wrong path, you can do it again with corrected paths\n";
print "If you encount any problems or find some bugs, please contact Yujun Han\n\n";
print "                         hanyujun\@gmail.com\n\n";
print "--------------------------- Have a nice day! -------------------------\n\n\n";

#-----------------------------------------------------
#-----------------------------------------------------
sub usuage {
    print "\nHi, need some help?\n";
    print STDERR <<"    _EOT_";

    Usage :reads_indexer <options> <specification> <default>

	\$MITE_Hunter_Dir = defined \$opt_d ? \$opt_d : "";	    	#	The path of where you put MITE_Hunter. It starts from the root, like "/usr/name/MITE_Hunter/".
	\$Makeblastdb     = defined \$opt_f ? \$opt_f : "makeblastdb";	#	The "makeblastdb" command, include path if necessary, like "/usr/bin/BLAST/makeblastdb"
	\$Legacyblast     = defined \$opt_b ? \$opt_b : "legacy_blast.pl";	#	The "legacyblast" command, include path if necessary, like "/usr/bin/BLAST/legacy_blast.pl"
	\$Mdust           = defined \$opt_m ? \$opt_m : "";			#	The "mdust" command, include path if necessary, like "/usr/bin/mdust/mdust"
	\$Muscle          = defined \$opt_M ? \$opt_M : "";			#	The "muscle" command, include path if necessary, like "/usr/bin/muscle/muscle"
    \$Help            = defined \$opt_h ? \$opt_h : "";


	"You can find mdust at http://compbio.dfci.harvard.edu/tgi/software/";
	"You can find muscle at http://www.drive5.com/muscle/";

    _EOT_
    exit(1)
}
