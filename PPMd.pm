package Compress::PPMd;

use 5.006;
use strict;
use warnings;

our $VERSION = '0.03';

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'mrm' => [ qw(MRM_RESTART
				   MRM_CUTOFF
				   MRM_FREEZE) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'mrm'} } );
our @EXPORT = qw();

use constant MRM_RESTART => 1;
use constant MRM_CUTOFF => 2;
use constant MRM_FREEZE => 3;


require XSLoader;
XSLoader::load('Compress::PPMd', $VERSION);

sub Compress::PPMd::Encoder::deflate {
    if (wantarray) {
	return ($_[0]->encode($_[1]), 0)
    }
    $_[0]->encode($_[1])
}

sub Compress::PPMd::Decoder::inflate {
    if (wantarray) {
	return ($_[0]->decode($_[1]), 0)
    }
    $_[0]->decode($_[1])
}

sub Compress::PPMd::Encoder::flush {
    wantarray ? ("", 0) : ""
}

1;
__END__

=head1 NAME

Compress::PPMd - PPMd compression

=head1 SYNOPSIS

  use Compress::PPMd;

  my $encoder=Compress::PPMd::Encoder();
  my $encoded=$encoder->encode($text);
  my $encoded2=$encoder->encode($text2);

  my $decoder=Compress::PPMd::Decoder();
  my $decoded=$encoder->decode($encoded);
  my $decoded2=$encoder->decode($encoded2);


=head1 ABSTRACT

This package is a Perl wrapper around Dmitry Shkarin PPMd compression
library.

=head1 DESCRIPTION

L<Compress::PPMd> is compossed of two classes to compress and
decompress data respectively:

=head2 Compress::PPMd::Encoder

=over 4

=item C<Compress::PPMd::Encoder-E<gt>new($MaxOrder, $MemSizeMB, $MRMethod, $Solid)>

creates a new encoder object. The parameters are:

=over 4

=item C<$MaxOrder>

max order for the PPM modelling ranging from 2 to 16, higher values
produce better compression ratios but are slower.

Default value is 8.

=item C<$MemSizeMB>

max memory in MB the compressor is able to use, bigger values improve
compression.

Default value is 4MB.

=item C<$MRMethod>

method of model restoration at memory insufficiency, possible values are:

=over 4

=item C<MRM_RESTART=1>

restart model from scratch (fast).

=item C<MRM_CUTOFF=2>

cut off model (default, slow).

=item C<MRM_FREEZE=3>

freeze model (faster but dangerous).

=back

Default value is C<MRM_CUTOFF>.

=item C<$Solid>

when true, chunks are compressed with data from previous chunks and so
they are dependant and have to be decompressed in the same sequence.

Default value is true.

=back

=item C<$encoder-E<gt>encode($data)>

compresses a chunk of data.

=item C<$encoder-E<gt>reset()>

in C<solid> mode C<reset> causes the encoder to clean its memory.

=item C<$encoder-E<gt>deflate($data)>

wrapper around C<encode> method for L<Compress::Zlib> interface
compatibility.

=item C<$encoder-E<gt>flush($mode)>

do nothing method for L<Compress::Zlib> interface compatibility.

=back

=head2 Compress::PPMd::Decoder

=over 4

=item C<Compress::PPMd::Decoder-E<gt>new($MaxOrder, $MemSizeMB, $MRMethod, $Solid)>

the decoder has to be initialized with the same parameters that were
used to create the encoder or the decompressed data will be corrupted.

=item C<$decoder-E<gt>decode($encoded_data)>

decodes a chunk of data generated by the encoder. Partial decodes are
not possible, only full chunks *exactly* as generated by the encoder
are accepted.

=item C<$decoder-E<gt>reset()>

has the same function that the equivalent encoder method and has to be
used symmetrically, that is, for every time C<$encoder-E<gt>reset> is called
C<$decoder-E<gt>reset> also has to be called.

=item C<$encoder-E<gt>inflate($data)>

wrapper around C<decode> method for L<Compress::Zlib> interface
compatibility.

=back

=head2 EXPORT

MRMethod constants when used with C<:mrm>:

=over 4

=item C<MRM_RESTART=1>

=item C<MRM_CUTOFF=2>

=item C<MRM_FREEZE=3>

=back

=head1 BUGS

This is a very early release, expect bugs.

Only tested on Linux, support for Win32 planned.

PPMd library doesn't work on 64bits architectures.

I will probably change the interface later.

PPMd library doen't checks for data validity when decompressing, this
can cause crashes and introduce security holes in your code, so ...

DON'T USE THIS LIBRARY ON NETWORK APPLICATIONS

... unless you can trust both client and server programs.


Bug reports and patches are appreciated.

=head1 SEE ALSO

L<Compress::ZLib>.

Original PPMd I1 code at L<ftp://ftp.elf.stuba.sk/pub/pc/pack/ppmdi1.rar>.

If you can read Russian, Dmitry Shkarin web pages at
L<http://compression.graphicon.ru/ds/> may be of interest to you.

For general information about data compression visit
L<http://DataCompression.info/>.

=head1 AUTHOR

Salvador Fandi�o E<lt>sfandino@yahoo.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Salvador Fandi�o

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

Based on code released to the public domain by Dmitry Shkarin.

=cut
