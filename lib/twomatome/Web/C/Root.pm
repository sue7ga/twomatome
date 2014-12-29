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
 return $c->render('copy.tx',{feeds => $feeds});
}

sub newtou{
 my($class,$c) = @_;
 my $newtou = new twomatome::Model::Matome(url => 'http://newtou.info/rss.xml');
 my $feeds = $newtou->response();
 return $c->render('newtou.tx',{feeds => $feeds});
}

sub twomatomeblog{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://news020.blog13.fc2.com/?xml');
 my $feeds = $matome->response();
 #$c->db->insert_matome($feeds,4);
 return $c->render('twomatomeblog.tx',{feeds => $feeds});
}

#atomは別?
sub joshiki{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://blog.livedoor.jp/jyoushiki43/atom.xml');
 my $feeds = $matome->response();
 return $c->render('joshiki.tx',{feeds => $feeds});
}

sub watch2ch{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://watch2ch.2chblog.jp/index.rdf');
 my $feeds = $matome->response();
 return $c->render('watch2ch.tx',{feeds => $feeds});
}

sub matometanews{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://matometanews.com/index.rdf');
 my $feeds = $matome->response();
 return $c->render('matometanews.tx',{feeds => $feeds});
}

sub yutori{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://yutori2ch.blog67.fc2.com/?xml');
 my $feeds = $matome->response();
 return $c->render('yutori.tx',{feeds => $feeds});
}

sub itai{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://blog.livedoor.jp/dqnplus/atom.xml');
 my $feeds = $matome->response();
 return $c->render('itai.tx',{feeds => $feeds});
}



1;
