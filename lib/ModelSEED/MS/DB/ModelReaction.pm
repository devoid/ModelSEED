########################################################################
# ModelSEED::MS::DB::ModelReaction - This is the moose object corresponding to the ModelReaction object
# Authors: Christopher Henry, Scott Devoid, Paul Frybarger
# Contact email: chenry@mcs.anl.gov
# Development location: Mathematics and Computer Science Division, Argonne National Lab
########################################################################
use strict;
use ModelSEED::MS::ModelReactionRawGPR;
use ModelSEED::MS::ModelReactionReagent;
use ModelSEED::MS::BaseObject;
package ModelSEED::MS::DB::ModelReaction;
use Moose;
use namespace::autoclean;
extends 'ModelSEED::MS::BaseObject';


# PARENT:
has parent => (is => 'rw',isa => 'ModelSEED::MS::Model', type => 'parent', metaclass => 'Typed',weak_ref => 1);


# ATTRIBUTES:
has uuid => ( is => 'rw', isa => 'ModelSEED::uuid', type => 'attribute', metaclass => 'Typed', lazy => 1, builder => '_builduuid' );
has modDate => ( is => 'rw', isa => 'Str', type => 'attribute', metaclass => 'Typed', lazy => 1, builder => '_buildmodDate' );
has reaction_uuid => ( is => 'rw', isa => 'ModelSEED::uuid', type => 'attribute', metaclass => 'Typed', required => 1 );
has direction => ( is => 'rw', isa => 'Str', type => 'attribute', metaclass => 'Typed', default => '=' );
has protons => ( is => 'rw', isa => 'Num', type => 'attribute', metaclass => 'Typed', default => '0' );
has modelcompartment_uuid => ( is => 'rw', isa => 'ModelSEED::uuid', type => 'attribute', metaclass => 'Typed', required => 1 );


# ANCESTOR:
has ancestor_uuid => (is => 'rw',isa => 'uuid', type => 'acestor', metaclass => 'Typed');


# SUBOBJECTS:
has gpr => (is => 'rw',default => sub{return [];},isa => 'ArrayRef|ArrayRef[ModelSEED::MS::ModelReactionRawGPR]', type => 'encompassed(ModelReactionRawGPR)', metaclass => 'Typed');
has modelReactionReagents => (is => 'rw',default => sub{return [];},isa => 'ArrayRef|ArrayRef[ModelSEED::MS::ModelReactionReagent]', type => 'encompassed(ModelReactionReagent)', metaclass => 'Typed');


# LINKS:
has reaction => (is => 'rw',lazy => 1,builder => '_buildreaction',isa => 'ModelSEED::MS::Reaction', type => 'link(Biochemistry,Reaction,uuid,reaction_uuid)', metaclass => 'Typed',weak_ref => 1);
has modelcompartment => (is => 'rw',lazy => 1,builder => '_buildmodelcompartment',isa => 'ModelSEED::MS::ModelCompartment', type => 'link(Model,ModelCompartment,uuid,modelcompartment_uuid)', metaclass => 'Typed',weak_ref => 1);


# BUILDERS:
sub _builduuid { return Data::UUID->new()->create_str(); }
sub _buildmodDate { return DateTime->now()->datetime(); }
sub _buildreaction {
	my ($self) = @_;
	return $self->getLinkedObject('Biochemistry','Reaction','uuid',$self->reaction_uuid());
}
sub _buildmodelcompartment {
	my ($self) = @_;
	return $self->getLinkedObject('Model','ModelCompartment','uuid',$self->modelcompartment_uuid());
}


# CONSTANTS:
sub _type { return 'ModelReaction'; }
sub _typeToFunction {
	return {
		ModelReactionRawGPR => 'gpr',
		ModelReactionReagent => 'modelReactionReagents',
	};
}


__PACKAGE__->meta->make_immutable;
1;
