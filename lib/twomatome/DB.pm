package twomatome::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub insert_matome{
 my($self,$feeds,$thread_id) = @_;
 for my $feed(@$feeds){
   $self->insert('article',{title => $feed->{title},url => $feed->{link},title => $feed->{content},date => $feed->{date},subject => $feed->{subject},threadid => $thread_id});
 }
}

1;
