package twomatome::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;

use Module::Find;

useall 'twomatome::Web::C';
base 'twomatome::Web::C';

get '/index' => "Root#index";

get '/alfa' => "Root#alfa";

get '/2chcp' => "Root#twochcopy";

get '/newtou' => "Root#newtou";

get '/2chmatomeblog' => "Root#twomatomeblog";

get '/joshiki' => "Root#joshiki";

get '/watch2ch' => "Root#watch2ch";

get '/matometanews' => "Root#matometanews";

get '/yutori' => "Root#yutori";

get '/count' => "Root#count";

1;
