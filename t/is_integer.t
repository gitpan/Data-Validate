#!/usr/bin/perl

# -------------------------------------------------------------------------------
# test harness for Data::Validate::is_integer
#
# Author: Richard Sonnen (http://www.richardsonnen.com/)
# -------------------------------------------------------------------------------

use lib './t';
use ExtUtils::TBone;

use lib './blib';
use Data::Validate qw(is_integer);

my $t = ExtUtils::TBone->typical();

# four tests
$t->begin(6);
$t->msg("testing is_integer...");

# normal integer
$t->ok(defined(is_integer(5)), "5 should pass");

# normal integer
$t->ok(defined(is_integer(0)), "0 should pass");

# float
$t->ok(!defined(is_integer(1.01)), "1.01 should fail");

# non-numeric
$t->ok(!defined(is_integer('hi')), "'hi' should fail");

# as an object
my $v = Data::Validate->new();
$t->ok(defined($v->is_integer(0)), "0 should pass (object)");
$t->ok(!defined($v->is_integer('hi')), "'hi' should fail (object)");

# we're done
$t->end();

