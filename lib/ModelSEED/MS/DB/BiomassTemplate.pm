########################################################################
# ModelSEED::MS::DB::BiomassTemplate - This is the moose object corresponding to the BiomassTemplate object
# Authors: Christopher Henry, Scott Devoid, Paul Frybarger
# Contact email: chenry@mcs.anl.gov
# Development location: Mathematics and Computer Science Division, Argonne National Lab
########################################################################
package ModelSEED::MS::DB::BiomassTemplate;
use ModelSEED::MS::BaseObject;
use ModelSEED::MS::BiomassTemplateComponent;
use Moose;
use namespace::autoclean;
extends 'ModelSEED::MS::BaseObject';


# PARENT:
has parent => (is => 'rw', isa => 'ModelSEED::MS::Mapping', weak_ref => 1, type => 'parent', metaclass => 'Typed');


# ATTRIBUTES:
has uuid => (is => 'rw', isa => 'ModelSEED::uuid', required => 1, lazy => 1, builder => '_builduuid', type => 'attribute', metaclass => 'Typed');
has modDate => (is => 'rw', isa => 'Str', lazy => 1, builder => '_buildmodDate', type => 'attribute', metaclass => 'Typed');
has class => (is => 'rw', isa => 'Str', default => '0', type => 'attribute', metaclass => 'Typed');
has dna => (is => 'rw', isa => 'Num', default => '0', type => 'attribute', metaclass => 'Typed');
has rna => (is => 'rw', isa => 'Num', default => '0', type => 'attribute', metaclass => 'Typed');
has protein => (is => 'rw', isa => 'Num', default => '0', type => 'attribute', metaclass => 'Typed');
has lipid => (is => 'rw', isa => 'Num', default => '0', type => 'attribute', metaclass => 'Typed');
has cellwall => (is => 'rw', isa => 'Num', default => '0', type => 'attribute', metaclass => 'Typed');
has cofactor => (is => 'rw', isa => 'Num', default => '0', type => 'attribute', metaclass => 'Typed');


# ANCESTOR:
has ancestor_uuid => (is => 'rw', isa => 'uuid', type => 'ancestor', metaclass => 'Typed');


# SUBOBJECTS:
has biomassTemplateComponents => (is => 'rw', isa => 'ArrayRef[HashRef]', default => sub { return []; }, type => 'child(BiomassTemplateComponent)', metaclass => 'Typed', reader => '_biomassTemplateComponents');


# LINKS:


# BUILDERS:
sub _builduuid { return Data::UUID->new()->create_str(); }
sub _buildmodDate { return DateTime->now()->datetime(); }


# CONSTANTS:
sub _type { return 'BiomassTemplate'; }

my $attributes = [
          {
            'req' => 1,
            'name' => 'uuid',
            'type' => 'ModelSEED::uuid',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'name' => 'modDate',
            'type' => 'Str',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'name' => 'class',
            'default' => '0',
            'type' => 'Str',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'name' => 'dna',
            'default' => '0',
            'type' => 'Num',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'name' => 'rna',
            'default' => '0',
            'type' => 'Num',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'name' => 'protein',
            'default' => '0',
            'type' => 'Num',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'name' => 'lipid',
            'default' => '0',
            'type' => 'Num',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'name' => 'cellwall',
            'default' => '0',
            'type' => 'Num',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'name' => 'cofactor',
            'default' => '0',
            'type' => 'Num',
            'perm' => 'rw'
          }
        ];

my $attribute_map = {uuid => 0, modDate => 1, class => 2, dna => 3, rna => 4, protein => 5, lipid => 6, cellwall => 7, cofactor => 8};
sub _attributes {
    my ($self, $key) = @_;
    if (defined($key)) {
        my $ind = $attribute_map->{$key};
        if (defined($ind)) {
            return $attributes->[$ind];
        } else {
            return undef;
        }
    } else {
        return $attributes;
    }
}

my $subobjects = [
          {
            'name' => 'biomassTemplateComponents',
            'type' => 'child',
            'class' => 'BiomassTemplateComponent'
          }
        ];

my $subobject_map = {biomassTemplateComponents => 0};
sub _subobjects {
    my ($self, $key) = @_;
    if (defined($key)) {
        my $ind = $subobject_map->{$key};
        if (defined($ind)) {
            return $subobjects->[$ind];
        } else {
            return undef;
        }
    } else {
        return $subobjects;
    }
}


# SUBOBJECT READERS:
around 'biomassTemplateComponents' => sub {
    my ($orig, $self) = @_;
    return $self->_build_all_objects('biomassTemplateComponents');
};


__PACKAGE__->meta->make_immutable;
1;
