## Where to see it

A working version of the app can be found here: [Brickagram](http://brickagram.herokuapp.com/)

##What is it?

This project is a clone of Instagram. The goal is to continue to enhance our knowledge of Rails, introduce some more advanced concepts:

+ Uploading and processing images using Paperclip, hosting via Amazon S3
+ Managing secret information (e.g. private keys)
+ Many-to-many relationships in Rails (with tagging)
+ Twitter Bootstrap
+ Creating APIs using Rails + jBuilder

## Technologies Used:

  + Rails
  + Ruby
  + Postgresql
  + Capybara
  + RSpec
  + CSS
  + Javascript
  + jQuery
  + Heroku
  + Devise
  + Amazon S3
  + Paperclip
  + Imagemagick
  + Bootstrap
 
## To Do

 + Geocoding with Google Maps
 + Fix Stripe API Keys
  
### How to set it up  

```sh
git clone git@github.com:nikeshashar/brickagram.git
cd brickagram
bundle
bin/rake db:setup
```

### How to run it
```sh
cd brickagram
bin/rails s
```

open your browser and go to [localhost:3000](http://localhost:3000)

### How to test it
```sh
cd brickagram
rspec
```

