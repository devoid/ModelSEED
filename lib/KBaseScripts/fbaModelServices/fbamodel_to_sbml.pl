########################################################################
# fbamodel_to_sbml.pl - This is a KBase command script automatically built from server specifications
# Authors: Christopher Henry, Scott Devoid, Paul Frybarger
# Contact email: chenry@mcs.anl.gov
# Development location: Mathematics and Computer Science Division, Argonne National Lab
########################################################################
use strict;
use lib "/home/chenry/kbase/models_api/clients/";
use fbaModelServicesClient;
use JSON::XS;

use Getopt::Long;

my $input_file;
my $output_file;
my $url = "http://bio-data-1.mcs.anl.gov/services/fba";

my $rc = GetOptions(
			'url=s'     => \$url,
		    'input=s'   => \$input_file,
		    'output=s'  => \$output_file,
		    );

my $usage = "fbamodel_to_sbml [--input model-file] [--output sbml-file] [--url service-url] [< model-file] [> sbml-file]";

@ARGV == 0 or die "Usage: $usage\n";

my $fbaModelServicesObj = fbaModelServicesClient->new($url);

my $in_fh;
if ($input_file)
{
    open($in_fh, "<", $input_file) or die "Cannot open $input_file: $!";
}
else
{
    $in_fh = \*STDIN;
}

my $out_fh;
if ($output_file)
{
    open($out_fh, ">", $output_file) or die "Cannot open $output_file: $!";
}
else
{
    $out_fh = \*STDOUT;
}
my $json = JSON::XS->new;

my $input;
{
    local $/;
    undef $/;
    my $input_txt = <$in_fh>;
    $input = $json->decode($input_txt)
}


my $output = $fbaModelServicesObj->fbamodel_to_sbml($input);

$json->pretty(1);
print $out_fh $json->encode($output);
close($out_fh);
