########################################################################
# ModelSEED::MS::DefaultTransportedReagent - This is the moose object corresponding to the DefaultTransportedReagent object
# Authors: Christopher Henry, Scott Devoid, Paul Frybarger
# Contact email: chenry@mcs.anl.gov
# Development location: Mathematics and Computer Science Division, Argonne National Lab
# Date of module creation: 2012-03-14T07:56:20
########################################################################
use strict;
use Moose;
use namespace::autoclean;
use ModelSEED::MS::BaseObject
package ModelSEED::MS::DefaultTransportedReagent
extends ModelSEED::MS::BaseObject


# PARENT:
has parent => (is => 'rw',required => 1,isa => 'ModelSEED::MS::',weak_ref => 1);


# ATTRIBUTES:


# BUILDERS:


# CONSTANTS:
sub _type { return 'DefaultTransportedReagent'; }


# FUNCTIONS:
#TODO


__PACKAGE__->meta->make_immutable;
1;