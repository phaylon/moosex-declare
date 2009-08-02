#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;

use MooseX::Declare [qw( -role -method )];

local $@;

eval 'role Foo { }';
ok $@, 'role usage died when excluded';

eval 'class Foo { method bar () { 23 } }';
ok $@, 'method usage in class died when excluded';
