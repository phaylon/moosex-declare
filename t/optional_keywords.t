#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 7;

do {
    package TestingTopScopeOptional;
    use OptionalKeywordDeclarator [qw( optional_class_keyword )];

    class                   RegularTopScope     { method foo { 33 } }
    optional_class_keyword  OptionalTopScope    { method bar { 34 } }

    local $@;

    eval 'optional_class_keyword OptionalWithMissingOptional { optional_test_method foo () { 35 } }';
    do {
        package main;
        ok $@, 'optional inside optional without explicit request';
    };
};

is(RegularTopScope->new->foo,  33, 'regular class keyword with method');
is(OptionalTopScope->new->bar, 34, 'optional class keyword with method');

do {
    package TestingOptionalInner;
    use OptionalKeywordDeclarator [qw( optional_class_keyword optional_test_method -role )];

    optional_class_keyword RegularOptional  { method foo { 36 } }
    optional_class_keyword OptionalOptional { optional_test_method bar { 37 } }

    local $@;

    eval 'optional_class_keyword ExcludedInOptional { role ExcludedThing { } }';
    do {
        package main;
        ok $@, 'excluded keyword in optional class keyword';
    };

    eval 'role ExcludedOnTopLevel { }';
    do {
        package main;
        ok $@, 'excluded keyword on top level';
    };
};

is(RegularOptional->new->foo,  36, 'regular method keyword in optional');
is(OptionalOptional->new->bar, 37, 'optional method keyword in optinoal');
