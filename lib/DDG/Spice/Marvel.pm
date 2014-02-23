package DDG::Spice::Plos;

use DDG::Spice;

name 'Marvel Comic Search';
description 'Search for Marvel super heroes';
primary_example_queries 'Marvel spider-man';
source 'Marvel';
category 'special';
topics 'science';
icon_url '';
code_url 'https://github.com/duckduckgo/zeroclickinfo-spice/blob/master/lib/DDG/Spice/Marvel.pm';
attribution github => ['Gregsen', ''],
			web => ['', ''];

triggers startend => 'Marvel';

spice to => 'http://gateway.marvel.com/v1/public/characters'
            .'?ts={time stampt}&apikey={public key}&hash={m5(timestamp+private key+public key)}'
spice wrap_jsonp_callback => 1;


handle remainder => sub {
    # Only trigger if the remainder does not exist in the skip hash.
    return $_ if $_ ;
    return;
};

1;
