#!/usr/bin/env perl
use strict;
use warnings;
use Bio::DB::GenBank;
use Bio::SeqIO;

my $acc = shift or die "Usage: $0 ACCESSION\n";

my $gb  = Bio::DB::GenBank->new(-format => 'Fasta');  # request FASTA from NCBI
my $seq = $gb->get_Seq_by_acc($acc)
    or die "Could not fetch $acc\n";

my $out = Bio::SeqIO->new(-file => ">$acc.fasta", -format => 'fasta');
$out->write_seq($seq);

print "Wrote $acc.fasta (", $seq->length, " bp)\n";
