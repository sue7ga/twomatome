package twomatome::Web::C::Root;

use twomatome::Model::Matome;

sub index{
 my($class,$c) = @_;
 return $c->render('index.tx');
}

sub alfa{
 my($class,$c) = @_;
 my $alfa = new twomatome::Model::Matome(url => 'http://alfalfalfa.com/index.rdf');
 my $feeds = $alfa->response();
 return $c->render('alfa.tx',{feeds => $feeds});
}

sub twochcopy{
 my($class,$c) = @_;
 my $copy = new twomatome::Model::Matome(url => 'http://news.2chblog.jp/index.rdf');
 my $feeds = $copy->response();
 print Dumper $feeds;
 return $c->render('copy.tx',{feeds => $feeds});
}


1;
