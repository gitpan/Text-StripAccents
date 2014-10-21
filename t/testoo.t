
use Text::StripAccents;
use Test;
use strict;
BEGIN{plan tests=>1}

my $deutsch = "AUFKL�RUNG ist der Ausgang des Menschen aus seiner selbstverschuldeten Unm�ndigkeit. Unm�ndigkeit ist das Unverm�gen, sich seines Verstandes ohne Leitung eines anderen zu bedienen. Selbstverschuldet ist diese Unm�ndigkeit, wenn die Ursache derselben nicht am Mangel des Verstandes, sondern der Entschlie�ung und des Mutes liegt, sich seiner ohne Leitung eines andern zu bedienen. Sapere aude! Habe Mut, dich deines eigenen Verstandes zu bedienen! ist also der Wahlspruch der Aufkl�rung.";
my $var2="AUFKLARUNG ist der Ausgang des Menschen aus seiner selbstverschuldeten Unmundigkeit. Unmundigkeit ist das Unvermogen, sich seines Verstandes ohne Leitung eines anderen zu bedienen. Selbstverschuldet ist diese Unmundigkeit, wenn die Ursache derselben nicht am Mangel des Verstandes, sondern der Entschliessung und des Mutes liegt, sich seiner ohne Leitung eines andern zu bedienen. Sapere aude! Habe Mut, dich deines eigenen Verstandes zu bedienen! ist also der Wahlspruch der Aufklarung.";

my $result=0;

my $stripper = Text::StripAccents->new();
my $var1 = $stripper->strip($deutsch);


if ($var1 eq $var2){$result=1}
ok($result);


