#
# Subtypes for ModelSEED::MS::CompoundAlias
#
package ModelSEED::MS::Types::CompoundAlias;
use Moose::Util::TypeConstraints;
use ModelSEED::MS::DB::CompoundAlias;

coerce 'ModelSEED::MS::DB::CompoundAlias',
    from 'HashRef',
    via { ModelSEED::MS::DB::CompoundAlias->new($_) };
subtype 'ModelSEED::MS::ArrayRefOfCompoundAlias',
    as 'ArrayRef[ModelSEED::MS::DB::CompoundAlias]';
coerce 'ModelSEED::MS::ArrayRefOfCompoundAlias',
    from 'ArrayRef',
    via { [ map { ModelSEED::MS::DB::CompoundAlias->new( $_ ) } @{$_} ] };

1;