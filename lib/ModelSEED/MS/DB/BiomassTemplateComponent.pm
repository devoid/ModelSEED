########################################################################
# ModelSEED::MS::DB::BiomassTemplateComponent - This is the moose object corresponding to the BiomassTemplateComponent object
# Authors: Christopher Henry, Scott Devoid, Paul Frybarger
# Contact email: chenry@mcs.anl.gov
# Development location: Mathematics and Computer Science Division, Argonne National Lab
# Date of module creation: 2012-05-05T02:39:58
########################################################################
use strict;
use ModelSEED::MS::BaseObject;
package ModelSEED::MS::DB::BiomassTemplateComponent;
use Moose;
use namespace::autoclean;
extends 'ModelSEED::MS::BaseObject';


# PARENT:
has parent => (is => 'rw',isa => 'ModelSEED::MS::BiomassTemplate', type => 'parent', metaclass => 'Typed',weak_ref => 1);


# ATTRIBUTES:
has uuid => ( is => 'rw', isa => 'ModelSEED::uuid', type => 'attribute', metaclass => 'Typed', required => 1, lazy => 1, builder => '_builduuid' );
has modDate => ( is => 'rw', isa => 'Str', type => 'attribute', metaclass => 'Typed', lazy => 1, builder => '_buildmodDate' );
has class => ( is => 'rw', isa => 'Str', type => 'attribute', metaclass => 'Typed', default => '0' );
has compound_uuid => ( is => 'rw', isa => 'Str', type => 'attribute', metaclass => 'Typed', default => '0' );
has coefficientType => ( is => 'rw', isa => 'Str', type => 'attribute', metaclass => 'Typed', default => '0' );
has coefficient => ( is => 'rw', isa => 'Num', type => 'attribute', metaclass => 'Typed', default => '0' );
has condition => ( is => 'rw', isa => 'Str', type => 'attribute', metaclass => 'Typed', default => '0' );


# ANCESTOR:
has ancestor_uuid => (is => 'rw',isa => 'uuid', type => 'acestor', metaclass => 'Typed');


# LINKS:
has compound => (is => 'rw',lazy => 1,builder => '_buildcompound',isa => 'ModelSEED::MS::Compound', type => 'link(Biochemistry,Compound,uuid,compound_uuid)', metaclass => 'Typed',weak_ref => 1);


# BUILDERS:
sub _builduuid { return Data::UUID->new()->create_str(); }
sub _buildmodDate { return DateTime->now()->datetime(); }
sub _buildcompound {
	my ($self) = @_;
	return $self->getLinkedObject('Biochemistry','Compound','uuid',$self->compound_uuid());
}


# CONSTANTS:
sub _type { return 'BiomassTemplateComponent'; }


__PACKAGE__->meta->make_immutable;
1;
