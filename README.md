# SeoParams

This is a small application for seo purposes: you can get Google PageRank for your site, number of pages in Google index, Yandex tIC, number of pages in Yandex index.

In addition you will be able to know the position of your website on search keywords in the search engines.

## Installation

Add this line to your application's Gemfile:

``` ruby
    gem 'seo_params'
```

And then execute:

``` bash
    bundle
```

Or install it yourself as:

``` bash
    gem install PageRankr
```

## Usage

``` ruby
    require 'seo_params'
```
### Fetch main SEO params

``` ruby
    SeoParams.all("")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
