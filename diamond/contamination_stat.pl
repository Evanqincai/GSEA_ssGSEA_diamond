#! /usr/bin/perl

use strict;
use warnings;
use FindBin qw($Bin $Script);
use File::Basename qw(basename dirname);
##################################Parameter
my $sample_list = $ARGV[0];
my $outdir = $ARGV[1];
my $num = $ARGV[2];
my $diamond = "/lustre/rdi/user/licq/research/diamond/diamond-soft/diamond";
my $nr = "/lustre/rdi/user/licq/project/RNA-Seq/20180827_henan_RNA/diamond/NR/nr";
my $taxid = "/lustre/rdi/user/licq/project/RNA-Seq/20180827_henan_RNA/diamond/NR_102/taxdmp/taxonid_list";
unless (@ARGV == 3){
	print "perl $0 sample.list outdir  read.num \n";die;
}
`mkdir $outdir ` unless (-d $outdir);

#################################extract fasta and diamond 
`mkdir $outdir/fasta` unless (-d "$outdir/fasta");
open (IN,$sample_list) or die $!;
while(<IN>){
	chomp;next if (/^#/ || /^$/);
	if (-f $_){
		my $fq_name = (split(/.fastq/,basename($_)))[0];
		open (RE,">>$outdir/work_sh") or die $!;
		print RE "perl $Bin/random_extract_fq.pl $_ $num $outdir/fasta/$fq_name.random >$outdir/fasta/$fq_name.fasta\n";
		print RE "$diamond blastx -d $nr -q $outdir/fasta/$fq_name.fasta -o $outdir/$fq_name.matches.m8 -f 102 -p 4\n";
		print RE "awk -F \'\\t\' \'NR==FNR{a[\$1]=\$2}NR!=FNR{if(a[\$2]){print a[\$2]\"\\t\"\$0}}' $taxid $outdir/$fq_name.matches.m8|cut -f 1,3|sort -k 2 -n|uniq -c |sort -n -k1 -r |sed 's/\\s\\+/\\t/g' |awk '{print \$1\"\\t\"\$NF}' >$outdir/tmp \n";
		print RE "awk -F \'\\t\' \'NR==FNR{a[\$1]=\$2}NR!=FNR{if(a[\$2]){print a[\$2]\"\\t\"\$1\"\\t\"\$1/$num}}' $taxid  $outdir/tmp|awk -F \'\\t\' \'{printf(\"%s\\t%s\\t%.2f%\\n\",\$1,\$2,\$3)}\'|sed \'1i\\Species\\tRead_num\\tPercentage\' |head -n 21 >$outdir/$fq_name.stat\n";

		close RE;
	}else{
		print "Please check your fastq file exists\n";die;
	}
}
close IN;
close RE;
`sh $outdir/work_sh && rm $outdir/tmp`;
