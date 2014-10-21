##############################################################
# Text::StripAccents - remove non a-z chars from a string
#  and replace them with their a-z counterparts
##############################################################


package Text::StripAccents;
use strict;
use vars qw (@ISA $VERSION @EXPORT);
use Exporter ();

@ISA = qw(Exporter);
@EXPORT = qw(stripaccents);
$VERSION="0.1";

##############################################################
=pod

=head1 NAME

 Text::StripAccents - removes accented & special characters from strings

=head1 SYNOPSIS

 use Text::StripAccents;

 my $Stripaccent = Text::StripAccents->new();

 my $convertedString = $StripAccents->strip($unconvertedString);

OR

 use Text::StripAccents;

 stripaccents($string); 

=head1 DESCRIPTION

This simple module takes accented characters and replaces them with their anglicised ASCII counterparts, e.g. � becomes U.

=head1 LICENSE

Copyright 2005 by Charles Colbourn, all rights reserved. This program is free software, you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Charles Colbourn - charlesc@g0n.net

(Character mapping hash supplied by Nigel Currie).

=cut


##############################################################
# Text::Stripaccent::new - constructor
##############################################################
#
# Takes as param the character set you are using. Latin1 
# support only at present
#
# returns a Stripaccent object
##############################################################

sub new
{
	my $class = shift;
	my $charset = shift;

	my %object;
	return bless \%object,$class;
}

###############################################################
# Text::Stripaccent::strip
###############################################################
#
# Removes all accented chars from a string and replaces them
# with their unaccented equivalents.
# 
# takes a string as a param, returns a converted string
#
###############################################################

sub strip
{

	my $object = shift;
	my $string = shift;


	my %IsoLatin1ToASCIITable = ("A" => "A", "�" => "A", "�" => "A", "�" => "A",
"�" => "A", "�" => "A", "�" => "A",
			     "B" => "B",
    			     "C" => "C", "�" => "C",
    			     "D" => "D",
    			     "E" => "E", "�" => "E", "�" => "E", "�" => "E",
"�" => "E",
    			     "F" => "F",
    			     "G" => "G",
    			     "H" => "H",
    			     "I" => "I", "�" => "I", "�" => "I", "�" => "I",
"�" => "I",
    			     "J" => "J",
    			     "K" => "K",
    			     "L" => "L",
    			     "M" => "M",
    			     "N" => "N", "�" => "N",
    			     "O" => "O", "�" => "O", "�" => "O", "�" => "O",
"�" => "O", "�" => "O",
    			     "P" => "P",
    			     "Q" => "Q",
    			     "R" => "R",
    			     "S" => "S",
    			     "T" => "T",
    			     "U" => "U", "�" => "U", "�" => "U", "�" => "U",
"�" => "U",
    			     "V" => "V",
    			     "W" => "W",
    			     "X" => "X",
    			     "Y" => "Y", "Y" => "Y",
    			     "Z" => "Z",
    			     "a" => "a", "�" => "a", "�" => "a", "�" => "a",
"�" => "a", "�" => "a", "�" => "a",
    			     "b" => "b",
    			     "c" => "c", "�" => "c",
    			     "d" => "d",
    			     "e" => "e", "�" => "e", "�" => "e", "�" => "e",
"�" => "e",
    			     "f" => "f",
    			     "g" => "g",
    			     "h" => "h",
    			     "i" => "i", "�" => "i", "�" => "i", "�" => "i",
"�" => "i",
    			     "j" => "j",
    			     "k" => "k",
    			     "l" => "l",
    			     "m" => "m",
    			     "n" => "n", "�" => "n",
    			     "o" => "o", "�" => "o", "�" => "o", "�" => "o",
"�" => "o", "�" => "o",
    			     "p" => "p",
    			     "q" => "q",
    			     "r" => "r",
    			     "s" => "s",
    			     "t" => "t",
    			     "u" => "u", "�" => "u", "�" => "u", "�" => "u",
"�" => "u",
    			     "v" => "v",
    			     "w" => "w",
    			     "x" => "x",
    			     "y" => "y", "y" => "y", "�" => "y",
    			     "z" => "z",
				"�"=>"ss");

	my @stringArray = split //,$string;
	foreach (@stringArray)
	{
		if ($IsoLatin1ToASCIITable{$_})
		{
			$_ = $IsoLatin1ToASCIITable{$_};
		}
	}

	my $returnString = join '',@stringArray;

	return $returnString;
}

################################################################
# stripaccent - function to call ::strip in non OO mode
################################################################
sub stripaccents
{
	my $string = shift;
	return __PACKAGE__->strip($string);
}



1;

