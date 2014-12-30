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
   $self->insert('article',{title => $feed->{title},url => $feed->{link},date => $feed->{date},subject => $feed->{subject},threadid => $thread_id});
 }
}

sub get_matome{
 my($self,$threadid) = @_;
 my @feeds = $self->search('article',+{threadid => $threadid},+{order_by => 'rank DESC'});
 return @feeds;
}

sub get_matome_by_articleid{
 my($self,$articleid) = @_;
 my $itr = $self->single('article',+{id => $articleid},+{columns => [qw/url rank/]});
 return $itr;
}

sub rank_count_first{
 my($self,$articleid) = @_;
 $self->update('article',+{rank =>1},+{id => $articleid});
}

sub rank_count{
 my($self,$articleid,$count) = @_;
 $self->update('article',+{rank => $count},+{id => $articleid});
}

1;
