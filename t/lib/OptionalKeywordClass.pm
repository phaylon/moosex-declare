package OptionalKeywordClass;
use Moose;

use aliased 'MooseX::Declare::Syntax::Keyword::Method';

use namespace::clean -except => 'meta';

extends 'MooseX::Declare::Syntax::Keyword::Class';

sub default_optional_inner {
    my ($self) = @_;

    return [
        Method->new(identifier => 'optional_test_method'),
    ]
}

1;
