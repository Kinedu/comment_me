# CommentMe

Attached comments for ActiveRecord models

[![Build Status](https://travis-ci.org/Kinedu/comment_me.svg?branch=master)](https://travis-ci.org/Kinedu/comment_me)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'comment_me'
```

And then execute:

```bash
$ bundle install
```

In the root directory:

```bash
$ rails generate comment_me
```

## Usage

The plugin generates a comment structure mounted on ActiveRecord models. Comments can be associated with any model (any model can have the functionality).

It also contains a control that can be used, or not, and that makes data persistence by inserting into the database.


### Models

Make a model commentable.

```ruby
class Article < ActiveRecord::Base
  comment_me
end
```

Then.

```ruby
# Create new record
article = Article.create!

# Create a comment for article
article.comments.create emitter: "Armando Alejandre", message: "¡Hola mundo!"

#  => #<Comment id: 29, emitter: "Armando Alejandre", message: "¡Hola mundo!", entity_type: "Article", entity_id: 2, comment_id: nil, created_at: "2019-10-11 06:37:13", updated_at: "2019-10-11 06:37:13"> 
# 2.6.3 :004 >

# See all comments
article.comments

# => #<ActiveRecord::Associations::CollectionProxy [#<Comment id: 32, emitter: "Armando Alejandre", message: "¡Hola mundo!", entity_type: "Article", entity_id: 2, comment_id: nil, created_at: "2019-10-11 06:40:58", updated_at: "2019-10-11 06:40:58">, #<Comment id: 31, emitter: "Armando Alejandre", message: "¡Hola mundo!", entity_type: "Article", entity_id: 2, comment_id: nil, created_at: "2019-10-11 06:40:57", updated_at: "2019-10-11 06:40:57">, #<Comment id: 30, emitter: "Armando Alejandre", message: "¡Hola mundo!", entity_type: "Article", entity_id: 2, comment_id: nil, created_at: "2019-10-11 06:40:56", updated_at: "2019-10-11 06:40:56">, #<Comment id: 29, emitter: "Armando Alejandre", message: "¡Hola mundo!", entity_type: "Article", entity_id: 2, comment_id: nil, created_at: "2019-10-11 06:37:13", updated_at: "2019-10-11 06:37:13">]>
```

### Controllers

A control is available to record comments and works with any model to which you want to add a comment.

To access the routes, call the #comment_me method into the route file.

```ruby
# call method #comment_me:
# config/routes.rb
    
Rails.application.routes.draw do

  comment_me
end
    
```

Check the routes.

```bach
rails routes
```

More information about the routes visit the [Postman](https://documenter.getpostman.com/view/2691667/SVtVU7zQ) documentation.

## Contributing

Bug report or pull request are welcome.

Make a pull request:

- Clone the repo
- Create your feature branch
- Commit your changes
- Push the branch
- Create new Pull-Request

Please write tests if necessary.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
