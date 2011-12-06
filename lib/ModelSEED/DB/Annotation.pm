package ModelSEED::DB::Annotation;

use strict;

use base qw(ModelSEED::DB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'annotation',

    columns => [
        uuid    => { type => 'character', length => 36, not_null => 1 },
        modDate => { type => 'datetime' },
        name    => { type => 'varchar', length => 255 },
        genome  => { type => 'character', length => 36, not_null => 1 },
    ],

    primary_key_columns => [ 'uuid' ],

    foreign_keys => [
        genome_obj => {
            class       => 'ModelSEED::DB::Genome',
            key_columns => { genome => 'uuid' },
        },
    ],

    relationships => [
        annotation_feature => {
            class      => 'ModelSEED::DB::AnnotationFeature',
            column_map => { uuid => 'annotation' },
            type       => 'one to many',
        },

        model => {
            class      => 'ModelSEED::DB::Model',
            column_map => { uuid => 'annotation' },
            type       => 'one to many',
        },
        parents => {
            map_class  => 'ModelSEED::DB::AnnotationParents',
            map_from   => 'child_obj',
            map_to     => 'parent_obj',
            type       => 'many to many', 
        },
        children => {
            map_class  => 'ModelSEED::DB::AnnotationParents',
            map_from   => 'parent_obj',
            map_to     => 'child_obj',
            type       => 'many to many',
        },
            
    ],
);

1;

