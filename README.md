# Squadra
A company's best asset is their people and with 90% of new starters making a decision whether to stay at a business within the first 6 months the onboarding process is critical to get every employee settled in, building relationships and becoming productive as soon as possible. 

Squadra is a free web app to help you automate onboarding while avoiding.. the boredom of repeating the same old office tour or overused, awkward icebreakers.

This app was a 5 day project built as part of the Flatiron London intensive web development bootcamp.

## Demo
Check out the app here: https://squadra-project.herokuapp.com/about

Note - first page load may take ~10 seconds due to use of a non-premium Heroku account. After initial load delay should be negligible.

## Key Features
🎨 Create a set of fully custom onboarding questions (text or multiple choice supported) that are unique to your company culture and get your employees to open up and express themselves

💬 Every new employee is automatically introduced to your team on Slack with the answers to your onboarding questions, ensuring every employee gets to know a little bit more about their latest colleague. 

😄 Add fun to your onboarding process

🎮 Dynamic quizzes based on custom questions set up by companies and employees responses - see who well you really know your team and encourage team bonding over shared interests

🔐 Uses BCrypt to ensure secure and hashed storage of sensitive data

⭐ Newest employees automatically featured on the company homepage

📱Designed to resize perfectly to any device to suit a modern workforce


## Motivation
We all know how difficult it can be to join a new team and get over the awkward first few interactions in the break out area. At Squadra we help you say goodbye to awkward introductions and forced icebreakers. 

## Build status
Build Stable

## Tech/framework used
<b>Built with</b>
- Ruby-on-Rails (Rails 5)
- Active Record
- SQLite3 (in development)
- Postgres (in production)
- Bootstrap 4 used for layout
- Heroku free account used for hosting
- Check ~/Gemfile for ruby gems used
- NOTE: Javascript not used as this was a project requirement

## Installation
To get a local version of Squadra running follow these steps:
1. Git clone the project
2. Bundle install
3. Insert your Slack Webhook Token 
4. Build the database, Seed the database
```
rails db:migrate
```
```
rails db:seed
```
5. Start the rails server and go to Localhost (default localhost:3000/)
```
rails s
```
6. Enjoy & drop Chris an email if you have any feedback, ideas or general thoughts - I would love to hear them!

## Models and relationships
Diagram below shows current models, relationships, validation and methods
![squadra uml diagram](https://github.com/cacamacho91/squadra/blob/master/public/Squadra%20Model%20%26%20Relationship.png)


## Credits
Built with <3 by
Chris Camacho (https://github.com/cacamacho91)
Souley Sow (https://github.com/julesow)

