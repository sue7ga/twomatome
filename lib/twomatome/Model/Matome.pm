package twomatome::Model::Matome;

use strict;
use warnings;

use XML::Feed;
use URI;
use utf8;
use Encode;
use Data::Dumper;
use Mouse;

has url => (
 is => 'ro',
 isa => 'Str'
);

sub response{
 my ($self) = shift;
 my $feed = XML::Feed->parse(URI->new($self->url)) or die XML::Feed->errstr;
 my $feeds = [];
  for my $entry($feed->entries){
    push @$feeds,{title => $entry->{entry}->{title},link =>  $entry->{entry}->{link},subject => Encode::encode_utf8($entry->{entry}->{dc}->{subject}),date => $entry->{entry}->{dc}->{date},content => $entry->{entry}->{content}->{encoded}};
  }
  return $feeds;
}



1;
