# _Mario's Good Food Stuff_
### version 1.0

### Contributer
* Hans Schroeder

### The Site
* [View the raw documents on GitHub](https://github.com/hajschroeder/ruby_cr4)
---

## Technologies Used
* HP Laptop with Windows 10
* GitBash and GitHub
* VS Code
* Ruby version 2.6.9
* Rails version 5.2.8
* RSpec version 3.11.0
* PostgreSQL

## Resources Used
1. [Ruby Documentation](https://ruby-doc.org/) 
1. [Learn How To Program](https://learnhowtoprogram.com) The curriculum for Epicodus students.
1. [The Odin Project](https://theodinproject.com) A free web resource for coding and programming.
1. [YouTube](www.youtube.com)
1. [Effective Testing with RSpec 3](https://pragprog.com/titles/rspec3/effective-testing-with-rspec-3/) by M. Marston, I. Dees

---

## Description

This is an independant project for the coding school Epicodus. It's an application for a faux local business that allows a user to post reviews of various products. The purpose is to demonstrate the author's understanding of the Rails framework using Active Record, as well as the author's understanding of simple database structures and one-to-many relationships. 

## Setup/Installation
_Note, this will require your local device to have Ruby installed_
* Clone this repository to your desktop
* Open the folder saved to your desktop with VSCode (or any other IDE capable of running Ruby scripts)
* Bundle the gems by typing 'gem bundle install'. 
* With two bash terminals open, run 'postgres' in one, and rails s in the other. This will start the server.
* In the browser navigate to 'localhost:3000' 
___

## Known Bugs
Due to time constraints full integration testing is not complete. This will receive further attention in the coming days. 

Additionally, there was an error in seeding the database. When running `rake db:seed` the following error was returned:
```
$ rake db:seed
rake aborted!
ActiveRecord::RecordInvalid: Validation failed: Product must exist
C:/Users/hajsc/Desktop/ruby_cr4/db/seeds.rb:9:in `block (2 levels) in <main>'
C:/Users/hajsc/Desktop/ruby_cr4/db/seeds.rb:8:in `times'
C:/Users/hajsc/Desktop/ruby_cr4/db/seeds.rb:8:in `block in <main>'
C:/Users/hajsc/Desktop/ruby_cr4/db/seeds.rb:4:in `times'
C:/Users/hajsc/Desktop/ruby_cr4/db/seeds.rb:4:in `<main>'
Tasks: TOP => db:seed
(See full trace by running task with --trace)

```
After a decent amount of unnamed search-engining, the only solution I found was to set the relationship within review.rb to :
`belongs_to :product, optional: true`

Upon setting this relationship the database was successfully seeded, however this change to the relationship caused the first test in review_spec.rb to fail. My workaround for this was to simply delete the new code that caused the test to fail while retaining the fruits of the successful database seeding. 



---

## License 
[MIT](https://choosealicense.com/licenses/mit/)

## Copyright
Hans J Schroeder 2022