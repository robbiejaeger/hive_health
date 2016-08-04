# HiveHealth README

## About
HiveHealth is a network of beekeepers that can log and share information about the status of their beehives. The goal is to give beekeepers awareness of what techniques or issues other beekeepers are having in their area and across the nation.

The application is a Rails 5 backend with postgresql database. There is an application API that accessed via Ajax calls to render hive sites on the google maps.

## User Flows
HiveHealth uses your Google account to login. Once you login, you can go to your dashboard and create sites. Each site location can have multiple hives. For each hive, you can log it's status periodically.

On the Hive Sites Map, you can see all of the sites for all users. If you go to a site page, you can see all the hives for that site and dive into their logs.

If you want to follow all of the logs for a site, then you can go to that site's page, and click a button to follow them. Their logs will then appear on your own dashboard.

## Future Work
* Alert followers of a site when a hive needs help
* Show followers on a user's dashboard map
* Be able to add images to sites show page and logs (stored on AWS)
* Feature to add winter loss to hive report once per year
* Feature to direct message users who follow each other

## Repository Setup Instructions
You will need to have API keys for Google+, Google Maps, and the Dark Sky Forecast API.
Â
To clone this repository, use this command in your terminal:
```
git clone https://github.com/robbiejaeger/hive_health.git
```
Go into the hive_health directory and bundle.
```
bundle
```
Setup the database and seed data.
```
rails db:{create,migrate,seed}
```
To run the tests, run:
```
rspec
```
