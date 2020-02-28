#! /usr/bin/perl
my $file = $ARGV[0];
my $count = 1;
open (IN,$ARGV[0]) or die $!;
open (OUT,">demo_FPKM") or die $!;
while(<IN>){
	chomp;
	my (@update,$update);
	my @lines = split(/\s+/,$_);
	if ($count == 1){
		push @update,$_;
	}else{
		push @update,$lines[0];
		for (my $i=1;$i<@lines;$i++){
			if ($lines[$i] == 0){
				push @update,"NA";
			}else{
				push @update,$lines[$i];
			}
		}
	}
	$count++;
	$update = join("\t",@update);
	print OUT "$update\n";
}
close IN;
close OUT;
