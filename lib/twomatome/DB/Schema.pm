package twomatome::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'twomatome::DB::Row';

table {
   name 'article';
   pk 'id';
   columns qw(id title subject rank url threadid date);
};

1;
