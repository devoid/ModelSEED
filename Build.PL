use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'ModelSeedCore',
    license             => 'perl',
    dist_author         => q{Chris Henry <cshenry@mcs.anl.gov>},
    dist_version_from   => 'lib/ModelSEED/FIGMODEL.pm',
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'perl' => 5.12,
        "Archive::Tar" => 1.54,
        "AutoLoader" => 5.70,
        "Carp" => 1.17,
        "Class::ISA" => 0.36,
        "Config::Tiny" => 2.14,
        "Cwd" => 3.31,
        "DBI" => 1.616,
        "DB_File" => 1.824,
        "Data::Dumper" => 2.131,
        "Digest::MD5" => 2.39,
        "Encode" => 2.39,
        "Fcntl" => 1.06,
        "File::Basename" => 2.78,
        "File::Copy" => 2.18,
        "File::Copy::Recursive" => 0.38,
        "File::HomeDir" => 0.98,
        "File::NFSLock" => 1.21,
        "File::Path" => 2.08_01,
        "File::Temp" => 0.22,
        "File::stat" => 1.02,
        "FileHandle" => 2.02,
        "Getopt::Long" => 2.38,
        "IO::Socket::INET" => 1.31,
        "IPC::Open2" => 1.03,
        "IPC::Run" => 0.90,
        "JSON::Any" => 1.29,
        "LWP::Simple" => 6.00,
        "LWP::UserAgent" => 6.02,
        "List::MoreUtils" => 0.33,
        "List::Util" => 1.23,
        "Moose" => 2.0204,
        "Moose::Role" => 2.0204,
        "Moose::Util::TypeConstraints" => 2.0204,
        "MooseX::NonMoose" => 0.22,
        "MooseX::Singleton" => 0.27,
        "POSIX" => 1.19,
        "Pod::Usage" => 1.36,
        "SOAP::Lite" => 0.714,
        "Scalar::Util" => 1.23,
        "Spreadsheet::WriteExcel" => 2.37,
        "Storable" => 2.22,
        "Symbol" => 1.07,
        "TAP::Formatter::JUnit" => 0.08,
        "TAP::Formatter::HTML" => 0.09,
        "Test::More" => 0.98,
        "Time::HiRes" => 1.9719,
        "Time::localtime" => 1.02,
        "Try::Tiny" => 0.11,
        "URI::Escape" => 3.31,
        "XML::DOM" => 1.44,
        "XML::Simple" => 2.18,
        "YAML" => 0.73,
        "YAML::Any" => 0.72,
        "base" => 2.15,
        "constant" => 1.20,
        "integer" => 1.00,
        "lib" => 0.62,
        "namespace::autoclean" => 0.13,
        "overload" => 1.10,
        "vars" => 1.01,
    },
    add_to_cleanup      => [ 'ModelSeedCore-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();