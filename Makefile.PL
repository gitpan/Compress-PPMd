use 5.008;
use ExtUtils::MakeMaker;

WriteMakefile( 'NAME'	       => 'Compress::PPMd',
	       'VERSION_FROM'  => 'PPMd.pm',
	       'ABSTRACT_FROM' => 'PPMd.pm',
	       'PREREQ_PM'     => { 'Test::More' => 0 },
	       'CC'            => 'g++',
	       'OBJECT'        => '$(BASEEXT)$(OBJ_EXT) Model$(OBJ_EXT)',
	       'AUTHOR'        => 'Salvador Fandiño <sfandino@yahoo.com>' );
