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

This is an application for a faux local business that allows a user to post reviews of various products. The purpose is to demonstrate the author's understanding of the Rails framework using Active Record, as well as the author's understanding of simple database structures and one-to-many relationships. 

## Setup/Installation
_Note, this will require your local device to have Ruby installed as well as PostgreSQL_
* Clone this repository to your desktop
* Open the folder saved to your desktop with VSCode (or any other IDE capable of running Ruby scripts)
* Bundle the gems by typing `bundle install`. 
* Open a terminal and run `postgres`
* Open a new terminal and enter `rake db:create`
* Run `rake db:migrate`
* Run `rake db:seed`
* Run `rails s` to start the rails server. 
* In the browser navigate to 'localhost:3000', which will take the user to the home page.
* Create an account by clicking the 'sign up' link and follow the instructions on the sign up page. 
### How to gain admin privileges
* Any typical user can view all products, read reviews, and write reviews. However, you will need admin privileges to add, edit, or delete products. You must also be an admin to delete and edit reviews.
* To make yourself an admin, open the rails console by running `rails c` in the terminal. 
* In the console run `user = User.first`, which will show your log in info, including a boolean that will say `admin: false`
* Run `user.admin = true` and then `user.save`. This will grant you admin privileges.
* Click "edit product" to either make changes or to delete the product.  
* Click a reviewer's name to view their review. 
* Click "edit" to make changes to their review, or to delete the review. 
* If the user wants to confirm that the routes and methods are all indeed working propery, then simply run `rake db:test:prepare` followed by `rspec`.
___

## Known Bugs
The application is currently running without any bugs. All functionality is accounted for within the tests, and all tests are passing. 



---

## License 
[MIT](https://choosealicense.com/licenses/mit/)

## Copyright
Hans J Schroeder 2022
