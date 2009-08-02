package OptionalKeywordDeclarator;
use strict;
use warnings;
use parent 'MooseX::Declare';

use OptionalKeywordClass;

sub optional_keywords {
    my $class = shift;
    OptionalKeywordClass->new(identifier => 'optional_class_keyword');
}

1;
