# LiteraryPad

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### Skills

- [Ruby](https://www.ruby-lang.org/)
- [Ruby On Rails](https://rubyonrails.org/)
- [Ruby on Rails Guides](https://guides.rubyonrails.org/)
- [Postgresql](https://www.postgresql.org/)
- [Redis](https://redis.io/)
- [Dragonfly](https://www.dragonflydb.io/)
- [Pagy](https://github.com/ddnexus/pagy)
- [Sidekiq](https://github.com/sidekiq/sidekiq)
- [Rubocop rails](https://github.com/rubocop/rubocop-rails)
- [Stimulus JS](https://stimulus.hotwired.dev/)
- [Esbuild](https://esbuild.github.io/)
- [Bootstrap 5](https://getbootstrap.com/)
- [Chart.js](https://www.chartjs.org/)
- [Tailwindcss](https://tailwindcss.com/)
- [FlyonUI](https://flyonui.com/)

### Install Ruby and Ruby on Rails
https://gorails.com/setup/ubuntu/22.04


### Run app

```shell
cd myapp

./bin/dev
#Run in http://localhost:3000 
```

### Run app with Docker and Docker Compose

```shell
cd myapp

docker-compose build
docker-compose up # run http://localhost:3000
 
docker-compose up --build # run http://localhost:3000

# Optional
docker-compose ps
docker-compose stop
docker-compose down
docker-compose run --rm app rails db:create
docker-compose run --rm app rails db:setup db:migrate 
docker-compose run --rm app rails db:migrate 
docker-compose run --rm app rails db:seed 
docker-compose run --rm app rails console
docker-compose run --rm app rails rspec
docker-compose run --rm app rails rubocop
docker-compose run --rm app bash
docker-compose run --rm app bundle install
docker-compose run --rm app yarn install --check-files 

# run http://localhost:3000
```

### Test for checks Ruby on Rails applications for security vulnerabilities with brakeman gem
```shell
brakeman
brakeman --help
brakeman -o tmp/output_analysis.html
open tmp/output_analysis.html # open browser

```

### Run all specs in spec directory (excluding plugin specs). Run tests with rspec
```shell
rake spec # or
rails spec
```

### Code Coverage With SimpleCov Gem

#### In a Debian/Ubuntu Terminal you can use this command:
```shell
open coverage/index.html
```

#### In a Mac terminal, you can use this command:
```shell
xdg-open coverage/index.html
```

#### Report code statistics (KLOCs, etc) from the application or engine
```shell
rake stats # or
rails stats

```

https://gilcierweb.com.br