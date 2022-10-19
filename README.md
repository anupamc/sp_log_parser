### The challenge
```
Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
  e.g.: ./parser.rb webserver.log

b. Returns the following:

  > list of webpages with most page views ordered from most pages views to less page views
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
  > list of webpages with most unique page views also ordered
     e.g.:
         /about/2   8 unique views
         /index     5 unique views
         etc...
```
## Requirements

To run the script you need to have

- [Ruby 3.1.2](https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-1-2-released/)

## Setting the scene

- Clone the repo

- `$ bundle install`

## Running Script

To run the script you can simply do
```
$ ruby app.rb webserver.log
```

## Running Tests

Run tests by running
```
$ bundle exec rspec
```

## Running Rubocop

Run rubocop on the project by simply  
```
$ bundle exec rubocop
```

## Test Coverage

- RSpec has been used as the testing tool

- 100% test covearge has been acvieved and the details can be found at ./coverage/index.html

# Design details 
+ [`LogProcessor::LogReader`][1] class is reading the log file.
+ [`LogProcessor::LogParser`][2] class is used to parse the Enumerator received from LogReader and return two different data structure for total view and unique view
+ [`LogProcessor::LogParser`][3] class is used to sort and count.
+ [`LogProcessor::LogValidator`][4] class is used to validate.
+ [`LogProcessor::LogPresenter`][5] class is used to print the required output.

# Possible improvements
+ The naming of the variables and methods could be more intuitive and would love to get feedback on pair programming
+ Set that is used as for removal of duplicate data for getting unique view - this can be not so efficient for large data set and need to look into some alternatives in that scenario 
+ Given the requirement, further edge case scenario can be tested  