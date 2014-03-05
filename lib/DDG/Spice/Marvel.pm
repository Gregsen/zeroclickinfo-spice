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

my $timeStamp   = time;
my $secretKey   = '';#md5_hex($timeStamp.{{ENV{DDG_SPICE_MARVEL_PRIVKEY}}}.{{ENV{DDG_SPICE_MARVEL_PUBKEY}}});

spice to => 'http://gateway.marvel.com/v1/public/characters?name=$1'
            .'?ts=$timeStamp&apikey={{ENV{DDG_SPICE_MARVEL_PUBKEY}}}'
            .'&hash=$secretKey';
spice wrap_jsonp_callback => 1;


handle remainder => sub {
    # Only trigger if the remainder does not exist in the skip hash.
    return $_ if $_ ;
    return;
};

1;
