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
    SeoParams.all("gihub.com")
      # => {"pr"=>7, "gp"=>42200000, "tic"=>3700, "yap"=>627199, "tweets"=>532, "likes"=>"5,2 т.", "ar"=>276, "dmoz"=>"yes"}
```
Short description:
`pr`  - Google PageRank,
`gp`  - pages in Google index,
`tic` - Yandex tIC,
`yap` - pages in Yandex index,
`tweets` - Twitter tweets,
`likes` - Facebook likes, on Russian in my case,
`ar` - Alexa rank,
`dmoz` - presence in the DMOZ directory.

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

To fetch only tweets

``` ruby
    SeoParams.tweets("gihub.com")
      # => 532
```

To fetch only likes

``` ruby
    SeoParams.likes("gihub.com")
      # => "5,2 т."
```

DMOZ:

``` ruby
    SeoParams.dmoz("gihub.com")
      # => "yes"
```

### Check Netcraft parametrs

``` ruby
    SeoParams.netcraft("gihub.com")
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


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
