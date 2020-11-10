# Rails API お試し用アプリ
![](https://github.com/uhsog/rails_api_practice/workflows/RailsTest/badge.svg)

RailsでAPIサーバをつくって試す用のリポジトリ

## API Documents
- TBD

## Links
- [ActiveModelSerializers](https://github.com/rails-api/active_model_serializers)
- [jb](https://github.com/amatsuda/jb)

## How to set up

1. Clone repsitory
```bash
$ git clone git@github.com:uhsog/rails_api_practice.git
$ cd rails_api_practice
```

2. Make docker images
```bash
$ docker-compose build
```

3. Set up for Rails application
```bash
$ docker-compose run web bundle install --path vendor/bundle
```

### tips

```bash
# dbとrails appを起動
$ docker-compose up -d
# dbの用意とか（本当はbin/setupとかでやれるようにすべき）
$ docker-compose run --rm web bin/rails db:create
$ docker-compose run --rm web bin/rails db:migrate
$ docker-compose run --rm web bin/rails db:seed

# dbとrails appを再起動
$ docker-compose restart
# dbとrails appを停止
$ docker-compose down
```
