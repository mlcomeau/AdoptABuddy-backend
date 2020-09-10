# AdoptABudy Backend 

This is a Ruby on Rails based API that is designed to be integrated with the AdoptABuddy frontend, which is a user interface built with React-Redux that allows users to search for adoptable animals in their area. It utilizes a PostgreSQL database and also interacts with the Petfinder API.

## Installation 

Fork and clone this repo onto your computer. 
Install dependencies: `bundle install`
Setup the database: 
```
rake db:migrate
rake db:seed
```

This application uses the Petfinder API, which requires an API key. Instructions on how to get an API key can be found [here](https://www.petfinder.com/developers/)
Once you have your key you will need to make a .env file in the root directory and create a global variable, TOKEN, which contains your credentials. Make sure this file is added to your gitignore file.

## Usage 

The AdoptABuddy front end repository can be found [here](https://github.com/mlcomeau/AdoptABuddy-frontend) and include installation instructions. Once that is complete run `rails s` to start the API 

## Contributing 

Bug reports and pull requests are welcome [here](https://github.com/mlcomeau/AdoptABuddy-backend). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License 

This package is available as open source under the terms of the MIT License.

## Code of Conduct 

Everyone interacting in this project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.

