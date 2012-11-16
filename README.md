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

Because the application was written for my purposes, the default search is performed in Russian for the country of Ukraine with 100 of results (-: But you can always change these settings. You have to specify the following:

`:hl` - specifies the interface language (host language) of your user interface. To improve the performance and the quality of your search results, you are strongly encouraged to set this parameter explicitly. List of languages you can find [here][1].

`:cr` - restricts search results to documents originating in a particular country. List of countries you can find [here][2].

`:num` - identifies the number of search results to return. I usually use 10 or 100.

The previous example can be rewritten as follows:

``` ruby
    keywords = ["rails", "ruby", "rvm", "spine.js"]
    SeoParams.gposition("www.none.com.ua", keywords, :hl => "ru", :cr => "countryUA", :num => 100)
      # => {"spine.js"=>1, "rvm"=>9, "rails"=>19, "ruby"=>72}
```


[1]: https://developers.google.com/custom-search/docs/xml_results?hl=en#interfaceLanguages
[2]: https://developers.google.com/custom-search/docs/xml_results?hl=en#countryCollections
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
