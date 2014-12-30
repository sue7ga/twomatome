package twomatome::Web::C::Root;

use twomatome::Model::Matome;
use Data::Dumper;

sub index{
 my($class,$c) = @_;
 return $c->render('index.tx');
}

sub alfa{
 my($class,$c) = @_;
 my $alfa = new twomatome::Model::Matome(url => 'http://alfalfalfa.com/index.rdf');
 my $feeds = $alfa->response();
eval{
   $c->db->insert_matome($feeds,1);
 };
 if($@){
  my @feeds = $c->db->get_matome(1);
  return $c->render('alfa.tx',{feeds => \@feeds});
 }
  my @feeds = $c->db->get_matome(1);
  return $c->render('alfa.tx',{feeds => \@feeds});
}

sub twochcopy{
 my($class,$c) = @_;
 my $copy = new twomatome::Model::Matome(url => 'http://news.2chblog.jp/index.rdf');
 my $feeds = $copy->response();
 eval{
   $c->db->insert_matome($feeds,2);
 };
 if($@){
  my @feeds = $c->db->get_matome(2);
  return $c->render('copy.tx',{feeds => \@feeds});
 }
  my @feeds = $c->db->get_matome(2);
  return $c->render('copy.tx',{feeds => \@feeds});

}

sub newtou{
 my($class,$c) = @_;
 my $newtou = new twomatome::Model::Matome(url => 'http://newtou.info/rss.xml');
 my $feeds = $newtou->response();
 eval{
   $c->db->insert_matome($feeds,3);
 };
 if($@){
  my @feeds = $c->db->get_matome(3);
  return $c->render('newtou.tx',{feeds => \@feeds});
 }
  my @feeds = $c->db->get_matome(3);
  return $c->render('newtou.tx',{feeds => \@feeds});


}

sub twomatomeblog{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://news020.blog13.fc2.com/?xml');
 my $feeds = $matome->response();
 eval{
   $c->db->insert_matome($feeds,4);
 };
 if($@){
  my @feeds = $c->db->get_matome(4);
  return $c->render('twomatomeblog.tx',{feeds => \@feeds});
 }
  my @feeds = $c->db->get_matome(4);
  return $c->render('twomatomeblog.tx',{feeds => \@feeds});
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
 eval{
   $c->db->insert_matome($feeds,5);
 };
 if($@){
  my @feeds = $c->db->get_matome(5);
  return $c->render('watch2ch.tx',{feeds => \@feeds});
 }
  my @feeds = $c->db->get_matome(5);
  return $c->render('watch2ch.tx',{feeds => \@feeds});
}

sub matometanews{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://matometanews.com/index.rdf');
 my $feeds = $matome->response();
 eval{
   $c->db->insert_matome($feeds,6);
 };
 if($@){
  my @feeds = $c->db->get_matome(6);
  return $c->render('matometanews.tx',{feeds => \@feeds});
 }
  my @feeds = $c->db->get_matome(6);
  return $c->render('matometanews.tx',{feeds => \@feeds});
}

sub yutori{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://yutori2ch.blog67.fc2.com/?xml');
 my $feeds = $matome->response();
 eval{
   $c->db->insert_matome($feeds,7);
 };
 if($@){
  my @feeds = $c->db->get_matome(7);
  return $c->render('yutori.tx',{feeds => \@feeds});
 }
  my @feeds = $c->db->get_matome(7);
  return $c->render('yutori.tx',{feeds => \@feeds});
}

sub itai{
 my($class,$c) = @_;
 my $matome = new twomatome::Model::Matome(url => 'http://blog.livedoor.jp/dqnplus/atom.xml');
 my $feeds = $matome->response();
 eval{
   $c->db->insert_matome($feeds,8);
 };
 if($@){
  my @feeds = $c->db->get_matome(8);
  return $c->render('itai.tx',{feeds => \@feeds});
 }
  my @feeds = $c->db->get_matome(8);
  return $c->render('itai.tx',{feeds => \@feeds});
}

sub count{
 my($class,$c) = @_;
 my $param =  $c->req->parameters;
 my $articleid = $param->{articleid};
 my $threadid  = $param->{threadid}; 
 my $itr = $c->db->get_matome_by_articleid($articleid);
 if(not defined $itr->rank){
      $c->db->rank_count_first($articleid);
 }elsif($itr->rank > 0){
      $c->db->rank_count($articleid,$itr->rank + 1);     
 }
 return $c->redirect($itr->url);
}

1;
