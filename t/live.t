#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use_ok('WWW::GetProve');

if (0) {
my $test_getprove = WWW::GetProve->new('test_TfcgAyFRGbdIRJHVNAxSizz2ZHp');

isa_ok($test_getprove,'WWW::GetProve','getprove test object');

my @verifications = $test_getprove->verify;

for (@verifications) {
	isa_ok($_,'WWW::GetProve::Verification','received verification');
}

my $verification = $test_getprove->verify('123456');

isa_ok($verification,'WWW::GetProve::Verification','new verification');

my $before_verification = $test_getprove->verify($verification);

#isa_ok($before_verification,'WWW::GetProve::Verification','rechecked new verification');

my $id = $verification->id;

#my $ref_before_verification = $test_getprove->verify(\$id);

#isa_ok($ref_before_verification,'WWW::GetProve::Verification','rechecked new verification via scalar id');

my $after_success_verification = $test_getprove->verify($verification,'1337');

isa_ok($after_success_verification,'WWW::GetProve::Verification','successful verification');

#my $ref_after_success_verification = $test_getprove->verify(\$id,'1337');

#isa_ok($ref_after_success_verification,'WWW::GetProve::Verification','successful verification via scalar id');

#my $after_failed_verification = $test_getprove->verify($verification,'0000');

#isa_ok($after_failed_verification,'WWW::GetProve::Verification','failed verification');
}

done_testing;
