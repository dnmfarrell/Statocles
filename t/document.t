
use Statocles::Base 'Test';
use Statocles::Document;

my %default = ();

subtest 'images' => sub {
    my $doc = Statocles::Document->new(
        %default,
        images => {
            title => {
                src => '/image.jpg',
                alt => 'Title image',
            },
            banner => 'banner.jpg',
        },
    );

    my $img = $doc->images->{ 'title' };
    isa_ok $img, 'Statocles::Image';
    is $img->src => '/image.jpg';
    is $img->alt => 'Title image';

    $img = $doc->images->{ 'banner' };
    isa_ok $img, 'Statocles::Image';
    is $img->src, 'banner.jpg';

};

done_testing;
