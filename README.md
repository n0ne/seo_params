# SeoParams

This is a small application for seo purposes: you can get Google PageRank for your site, number of pages in Google index, Yandex tIC, number of pages in Yandex index.

In addition, you can check the position of your site in the search for keywords in search engines.

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
    SeoParams.all("gihub.com")
      # => {"pr"=>7, "gp"=>33400000, "tic"=>3700, "yap"=>627119}
```
Short description:
`pr`  - Google PageRank,
`gp`  - pages in Google index,
`tic` - Yandex tIC,
`yap` - pages in Yandex index.

### Fetch specific SEO parameter

To fetch only Google PageRank:

``` ruby
    SeoParams.pr("gihub.com")
      # => 7
```

To fetch only pages in Google index:

``` ruby
    SeoParams.gp("gihub.com")
      # => 44000000
```
This request gives sometimes very strange results

To fetch only Yandex tIC:

``` ruby
    SeoParams.tic("gihub.com")
      # => 3700
```

To fetch only pages in Google index:

``` ruby
    SeoParams.yap("gihub.com")
      # => 627119
```

### Check site position in the search for keywords in Google

The most visited sites - are sites on the first page of a search result the user. That is why it is so important control whether the position of your website for keywords.

To check the position of your site in Google for specific keywords:

``` ruby
    SeoParams.gposition("www.none.com.ua", "rails")
      # => {"rails"=>19}
```
or you can specify an array of keywords:

``` ruby
    keywords = ["rails", "ruby", "rvm", "spine.js"]
    SeoParams.gposition("www.none.com.ua", keywords)
      # => {"spine.js"=>1, "rails"=>19, "ruby"=>72, "rvm"=>9}
```



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
