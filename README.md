# AdoptABudy Backend 

This is a Ruby on Rails based API that is designed to be integrated with the AdoptABuddy frontend, which is a user interface built with React-Redux that allows users to search for adoptable animals in their area. It utilizes a PostgreSQL database and also interacts with the Petfinder API.

## Installation 

1) Fork and clone this repo onto your computer. 
2) Install dependencies: `bundle install`
3) Setup the database: 
```
rake db:migrate
rake db:seed
```
4) Setup PetFinder API credentials 
This application uses the Petfinder API so you'll need to get yourself some credentials --> [GO HERE](https://www.petfinder.com/developers/)
Once you have your key and your secret you will need to make a .env file in the root directory and create two global variables that will hold your credentials
```
CLIENT_ID = 
CLIENT_SECRET = 
```
Don't forget to add the .env file to your .gitignore!

## Usage 

The AdoptABuddy front end repository can be found [here](https://github.com/mlcomeau/AdoptABuddy-frontend) and include installation instructions. Once that is complete run `rails s` to start the API 

## Contributing 

Bug reports and pull requests are welcome [here](https://github.com/mlcomeau/AdoptABuddy-backend). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License 

This package is available as open source under the terms of the MIT License.

## Code of Conduct 

Everyone interacting in this project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.

