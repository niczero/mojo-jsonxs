package Mojo::JSON_XS;

our $VERSION = 0.001;
# From groups.google.com/forum/#!msg/mojolicious/a4jDdz-gTH0/Exs0-E1NgQEJ

use Cpanel::JSON::XS;
use Mojo::JSON;
use Mojo::Util 'monkey_patch';

my $Binary = Cpanel::JSON::XS->new->utf8(1)->allow_nonref(1)->allow_blessed(1)
      ->convert_blessed(1);
my $Text = Cpanel::JSON::XS->new->utf8(0)->allow_nonref(1)->allow_blessed(1)
      ->convert_blessed(1);

monkey_patch 'Mojo::JSON', 'encode_json', sub { $Binary->encode(shift) };
monkey_patch 'Mojo::JSON', 'decode_json', sub { $Binary->decode(shift) };

monkey_patch 'Mojo::JSON', 'to_json',   sub { $Text->encode(shift) };
monkey_patch 'Mojo::JSON', 'from_json', sub { $Text->decode(shift) };

monkey_patch 'Mojo::JSON', 'true',  sub { Cpanel::JSON::XS::true() };
monkey_patch 'Mojo::JSON', 'false', sub { Cpanel::JSON::XS::false() };

1;
__END__

=head1 NAME

Mojo::JSON_XS - Faster JSON processing for Mojolicious

=head1 SYNOPSIS

  use Mojo::JSON_XS;

=head1 DESCRIPTION

Using Mojo::JSON_XS overrides Mojo::JSON, so your JSON processing will be done
by compiled C code rather than pure perl.  L<Cpanel::JSON::XS> is a hard
dependency, so is required both at installation time and run time.

=head1 CAVEATS

The underlying module Cpanel::JSON::XS generates slightly different output when
decoding boolean JSON values.  For instance, C<'[true]'> is decoded as C<[1]>
rather than C<[true]>.  Those interested/concerned are urged to look at the
lines of C<test/10-json.t> that begin C<#!!>, ie the Mojolicious tests that
break when using this module.

=head1 SUPPORT

Although the code is gifted by Sebastian Riedel, this is not part of the
Mojolicious distribution.  Saying that, it is likely you can find someone on the
IRC channel happy to discuss this module.  Any bugs or issues should be logged
in the specific Github account.

=head2 IRC

C<#mojo> on C<irc.perl.org>

=head2 Github Issue Tracker

L<https://github.com/niczero/mojo-jsonxs/issues>

=head1 COPYRIGHT AND LICENCE

Copyright (C) 2014, Sebastian Riedel, Nic Sandfield.

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=head1 SEE ALSO

L<Mojo::JSON>, L<Cpanel::JSON::XS>.  [Also, L<Mojo::JSON::MaybeXS> is expected
any day soon.]
