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

# helper function to read my dev keys from file
sub getKey  {
    my ($file) = @_;
    print $file;
    open (my $fh, "<", $file) or die $!;
    my $pass = <$fh>;
    chomp($pass);

    return $pass;
}

my $privKey     = &getKey('privkey.txt');
my $pubKey      = &getKey('pubkey.txt');
my $timeStamp   = time;
my $secretKey   = md5_hex($timeStamp.$privKey.$pubKey);

spice to => 'http://gateway.marvel.com/v1/public/characters?name=$1'
            .'?ts=$timeStamp&apikey=$pubKey&hash=$secretKey';
spice wrap_jsonp_callback => 1;


handle remainder => sub {
    # Only trigger if the remainder does not exist in the skip hash.
    return $_ if $_ ;
    return;
};

1;
