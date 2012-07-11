#
# Subtypes for ModelSEED::MS::RoleSetAlias
#
package ModelSEED::MS::Types::RoleSetAlias;
use Moose::Util::TypeConstraints;
use ModelSEED::MS::DB::RoleSetAlias;

coerce 'ModelSEED::MS::DB::RoleSetAlias',
    from 'HashRef',
    via { ModelSEED::MS::DB::RoleSetAlias->new($_) };
subtype 'ModelSEED::MS::ArrayRefOfRoleSetAlias',
    as 'ArrayRef[ModelSEED::MS::DB::RoleSetAlias]';
coerce 'ModelSEED::MS::ArrayRefOfRoleSetAlias',
    from 'ArrayRef',
    via { [ map { ModelSEED::MS::DB::RoleSetAlias->new( $_ ) } @{$_} ] };

1;