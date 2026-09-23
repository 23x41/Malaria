#!/usr/bin/env perl
use strict;
use warnings;
use Cwd qw(abs_path);
use Bio::Tools::Run::StandAloneBlastPlus;

my $fasta = $ARGV[0] or die "Usage: $0 input.fasta\n";
-e $fasta or die "File not found: $fasta\n";
$fasta = abs_path($fasta);

print "Using FASTA: $fasta\n";

my $fac = Bio::Tools::Run::StandAloneBlastPlus->new(
    -db_name => 'mydb',
    -db_data => $fasta,
    -create  => 1,
    -db_type => 'nucl',
);

$fac->make_db();
print "BLAST database created: mydb\n";
