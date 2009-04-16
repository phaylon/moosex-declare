use strict;
use warnings;
use Test::More tests => 3;

use FindBin;
use lib "$FindBin::Bin/lib";

use ParameterizedRole;

use MooseX::Declare;

class MyGame::Tile is mutable {
    with Counter => {
        name => 'stepped_on',
    };
}

my $o = MyGame::Tile->new;
isa_ok($o, 'MyGame::Tile');

can_ok($o, 'increment_stepped_on');
can_ok($o, 'decrement_stepped_on');
