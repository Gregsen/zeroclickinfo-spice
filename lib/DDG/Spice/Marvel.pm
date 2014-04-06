package DDG::Spice::Marvel;

use DDG::Spice;
use Digest::MD5 qw(md5_hex);

name 'Marvel Comic Search';
description 'Search for Marvel super heroes';
primary_example_queries 'Marvel spider-man';
source 'Marvel';
category 'special';
topics 'science';
icon_url 'http://marvel.com/favicon.ico';
code_url 'https://github.com/duckduckgo/zeroclickinfo-spice/blob/master/lib/DDG/Spice/Marvel.pm';
attribution github => ['Gregsen', 'dd'];

triggers start => 'marvel';

spice from => '([^/]+)/?(?:([^/]+)/?)(?:([^/]+)/?)';
spice to => 'http://gateway.marvel.com/v1/public/characters?name=$1'
            .'&ts=$2&apikey={{ENV{DDG_SPICE_MARVEL_PUBKEY}}}'
            .'&hash=$3';
spice wrap_jsonp_callback => 1;


handle remainder => sub {
my $timeStamp   = time;
#my $secretKey   =  $timeStamp${ENV{DDG_SPICE_MARVEL_PRIVKEY}}${ENV{DDG_SPICE_MARVEL_PUBKEY}}
my $secretKey   = md5_hex($timeStamp.${ENV{DDG_SPICE_MARVEL_PRIVKEY}}.${ENV{DDG_SPICE_MARVEL_PUBKEY}});
    if ($_){
         return $_, $timeStamp, $secretKey;
     } else {
    return;
}
};

1;
