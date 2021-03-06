########################################################################
# ModelSEED::MS::DB::Strain - This is the moose object corresponding to the Strain object
# Authors: Christopher Henry, Scott Devoid, Paul Frybarger
# Contact email: chenry@mcs.anl.gov
# Development location: Mathematics and Computer Science Division, Argonne National Lab
########################################################################
package ModelSEED::MS::DB::Strain;
use ModelSEED::MS::BaseObject;
use ModelSEED::MS::Deletion;
use ModelSEED::MS::Insertion;
use Moose;
use namespace::autoclean;
extends 'ModelSEED::MS::BaseObject';


# PARENT:
has parent => (is => 'rw', isa => 'ModelSEED::MS::Genome', weak_ref => 1, type => 'parent', metaclass => 'Typed');


# ATTRIBUTES:
has uuid => (is => 'rw', isa => 'ModelSEED::uuid', printOrder => '0', lazy => 1, builder => '_build_uuid', type => 'attribute', metaclass => 'Typed');
has modDate => (is => 'rw', isa => 'Str', printOrder => '-1', lazy => 1, builder => '_build_modDate', type => 'attribute', metaclass => 'Typed');
has name => (is => 'rw', isa => 'ModelSEED::varchar', printOrder => '0', default => '', type => 'attribute', metaclass => 'Typed');
has source => (is => 'rw', isa => 'ModelSEED::varchar', printOrder => '0', required => 1, type => 'attribute', metaclass => 'Typed');
has class => (is => 'rw', isa => 'ModelSEED::varchar', printOrder => '0', default => '', type => 'attribute', metaclass => 'Typed');


# ANCESTOR:
has ancestor_uuid => (is => 'rw', isa => 'uuid', type => 'ancestor', metaclass => 'Typed');


# SUBOBJECTS:
has deletions => (is => 'rw', isa => 'ArrayRef[HashRef]', default => sub { return []; }, type => 'child(Deletion)', metaclass => 'Typed', reader => '_deletions', printOrder => '-1');
has insertions => (is => 'rw', isa => 'ArrayRef[HashRef]', default => sub { return []; }, type => 'child(Insertion)', metaclass => 'Typed', reader => '_insertions', printOrder => '-1');


# LINKS:


# BUILDERS:
sub _build_uuid { return Data::UUID->new()->create_str(); }
sub _build_modDate { return DateTime->now()->datetime(); }


# CONSTANTS:
sub _type { return 'Strain'; }

my $attributes = [
          {
            'req' => 0,
            'printOrder' => 0,
            'name' => 'uuid',
            'type' => 'ModelSEED::uuid',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'printOrder' => -1,
            'name' => 'modDate',
            'type' => 'Str',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'printOrder' => 0,
            'name' => 'name',
            'default' => '',
            'type' => 'ModelSEED::varchar',
            'perm' => 'rw'
          },
          {
            'req' => 1,
            'printOrder' => 0,
            'name' => 'source',
            'type' => 'ModelSEED::varchar',
            'perm' => 'rw'
          },
          {
            'req' => 0,
            'printOrder' => 0,
            'name' => 'class',
            'default' => '',
            'type' => 'ModelSEED::varchar',
            'perm' => 'rw'
          }
        ];

my $attribute_map = {uuid => 0, modDate => 1, name => 2, source => 3, class => 4};
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
            'printOrder' => -1,
            'name' => 'deletions',
            'type' => 'child',
            'class' => 'Deletion'
          },
          {
            'printOrder' => -1,
            'name' => 'insertions',
            'type' => 'child',
            'class' => 'Insertion'
          }
        ];

my $subobject_map = {deletions => 0, insertions => 1};
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
around 'deletions' => sub {
  my ($orig, $self) = @_;
  return $self->_build_all_objects('deletions');
};
around 'insertions' => sub {
  my ($orig, $self) = @_;
  return $self->_build_all_objects('insertions');
};


__PACKAGE__->meta->make_immutable;
1;
