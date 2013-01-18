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
    gem install seo_params
```

## Usage

``` ruby
    require 'seo_params'
```
### Fetch main SEO params

``` ruby
    SeoParams.all("github.com")
      # => {"pr"=>7, "gp"=>52900000, "tic"=>3600, "yap"=>569898, "tweets"=>570, "likes"=>711, "ar"=>235, "dmoz"=>"yes", "plus_ones"=>3, "yahoo"=>361000, "bing"=>347000}
```
Short description:
`pr`  - Google PageRank,
`gp`  - pages in Google index,
`tic` - Yandex tIC,
`yap` - pages in Yandex index,
`tweets` - Twitter tweets,
`likes` - Facebook likes, on Russian in my case,
`ar` - Alexa rank,
`dmoz` - presence in the DMOZ directory,
`plus_ones` - number of Google +1s,
`yahoo` - pages in Yahoo index,
`bing` - pages in Bing index.

### Fetch specific SEO parameter

To fetch only Google PageRank:

``` ruby
    SeoParams.pr("github.com")
      # => 7
```

To fetch only pages in Google index:

``` ruby
    SeoParams.gp("github.com")
      # => 44000000
```
This request gives sometimes very strange results

To fetch only Yandex tIC:

``` ruby
    SeoParams.tic("github.com")
      # => 3700
```

To fetch only pages in Google index:

``` ruby
    SeoParams.yap("github.com")
      # => 627119
```

To fetch only tweets

``` ruby
    SeoParams.tweets("github.com")
      # => 532
```

To fetch only likes

``` ruby
    SeoParams.likes("github.com")
      # => "83"
```
Or fetch all Facebook's parameters:

``` ruby
    SeoParams::Facebook.new("github.com").all
      # => {"click_count"=>47, "comment_count"=>157, "like_count"=>83, "share_count"=>348, "total_count"=>588}
```

DMOZ:

``` ruby
    SeoParams.dmoz("github.com")
      # => "yes"
```

Google +1:

To fetch count of +1s

``` ruby
    SeoParams.plus_ones("github.com")
      # => 3000
```

To fetch only pages in Yahoo index:

``` ruby
    SeoParams.yahoo("github.com")
      # => 361000
```

To fetch only pages in Bing index:

``` ruby
    SeoParams.bing("github.com")
      # => 347000
```

### Check Netcraft parametrs

``` ruby
    SeoParams.netcraft("github.com")
      # => {"ip"=>"207.97.227.239", "siterank"=>9359, "country"=>"US", "nameserver"=>"ns1.p16.dynect.net", "firstseen"=>"August 2011", "dnsadmin"=>"hostmaster@github.com", "domainregistrator"=>"godaddy.com", "reversedns"=>"github.com", "organisation"=>"GitHub, Inc.", "nsorganisation"=>"Dynamic Network Services, Inc., 150 Dow St, Manchester, 03101, United States"}
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


### Check site position in the search for keywords in Yandex

Checking the position of keywords in Yandex need only for RuNET, so further description will be in Russian.

С проверкой позиций в Яндексе всё несколько сложнее.

Во-первых, Вам необходимо быть зарегестрированным пользователем Яндекса. Сделать это можно по вот этой [ссылке][1].

Во-вторых, добавить IP-адрес, с которого будут посылаться запросы к сервису Яндекса, на этой [страничке][2]

В-третьих, скопировать/сохранить `user` и `key` из поля "Ваш адрес для совершения запроса" на страничке в предыдущем пункте. Важно знать, что просто зарегистрированные пользователи могут делать не более 10 запросов в день. Если Вы подтвердите Ваш номер телефона, то сможете делать до 1000 запросов в день. Думаю, для многих этого будет достаточно, а кому и этого мало, тогда следует ознакомиться с информацией на самом сайте, как увеличить данное число.

В принципе, уже можно пробовать:

``` ruby
    keywords = ["rails", "ruby", "rvm", "spine.js"]
    SeoParams.yaposition("www.none.com.ua", user, key, keywords)
      # => {"ruby"=>0, "spine.js"=>2, "rvm"=>3, "rails"=>22}
```

Опять же, поиск осуществляется по Украине и при 100 результатах в выдаче. Эти параметры можно изменить:

`:lr`  - идентификатор страны или региона поиска. Список идентификаторов часто используемых стран и регионов приведен в [приложении][3].

`:num` - количество результатов в выдаче поиска. По умолчанию - 100. Ещё одно рекомендуемое значение 10.

Приведённый выше пример можно переписать следующим образом:

``` ruby
    keywords = ["rails", "ruby", "rvm", "spine.js"]
    SeoParams.yaposition("www.none.com.ua", user, key, keywords, :lr => 187, :num => 100)
      # => {"ruby"=>0, "spine.js"=>2, "rvm"=>3, "rails"=>22}
```
Значение "0" в результатах поиска свидетельствует об отсутствии сайта в результате поиска по данному клучевому слову.

[1]: http://passport.yandex.ru/passport?mode=register
[2]: http://xml.yandex.ru/settings.xml
[3]: http://api.yandex.ru/xml/doc/dg/reference/regions.xml

## Changelog

### v.0.0.7

  * added method for fetching number of pages in Yahoo index
  * added method for fetching number of pages in Bing index

### v.0.0.6

  * rewritten method of determining the number of Likes
  * added method for fetching all the parameters provided by Facebook

### v.0.0.5

  * added method for fetching Google +1 counts

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
