########################################################################
# ModelSEED::MS::CompoundAliasSet - This is the moose object corresponding to the CompoundAliasSet object
# Authors: Christopher Henry, Scott Devoid, Paul Frybarger
# Contact email: chenry@mcs.anl.gov
# Development location: Mathematics and Computer Science Division, Argonne National Lab
# Date of module creation: 2012-03-26T23:22:35
########################################################################
use strict;
use ModelSEED::MS::DB::CompoundAliasSet;
package ModelSEED::MS::CompoundAliasSet;
use Moose;
use namespace::autoclean;
extends 'ModelSEED::MS::DB::CompoundAliasSet';
# CONSTANTS:
#TODO
# FUNCTIONS:
#TODO


__PACKAGE__->meta->make_immutable;
1;
