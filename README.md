# Futbol

Starter repository for the [Turing School](https://turing.io/) [Futbol project](https://backend.turing.edu/module1/projects/futbol/).

## Table of Contents
1. [Project Description](#project-description)
2. [Testing](#testing)
- [Spec Harness](#spec-harness)
3. [Iterations](#iterations)
4. [Project Requirements](#project-requirements)
5. [Learning Goals](#learning-goals)
6. [Run and Install The Project](#run-and-install-the-project)
7. [Architure and Design](#architure-and-design)
8. [Endponts](#endpoints)
9. [Credits](#credits)

## Project Description
We will be using data from a fictional soccer league to analyze team performance for specific seasons and across seasons. We want to see who the best and worst performers are, as well as be able to pull statistics for individual teams. To that end we will create a StatTracker class that will provide us with the information we need.

The first half of the project will focus on building the base statistics functionality through our StatTracker. As you build out this class, you will quickly realize that there is waaaay too much going on in one class; so, for the second half of the project we will switch our focus to reorganizing our code to practice good SRP!

A key goal of this project is to write readable, organized, object-oriented code. Each of the methods will implement should be defined as instance methods on StatTracker. However, all of the code for this project should not be contained in the StatTracker class. Code will be broken up into logical, organized components.

This project will use a “red, green, refactor” approach. First, write tests, write code that makes the tests pass, and then focus on refactoring and organizing after you have working tests and code. It will be easier to make decisions about new classes, modules, methods, etc. when you have seen working code.

Progress will be tracked by utilizing a project management tool such as GitHub Issues and GitHub Projects.

## Testing
Another key goal of this project is to utilize Test Driven Development. Because the data set is so large, it will be inefficient to use the actual dataset as test data. Instead, making up your own test data will be a lot more efficient. This will either be done by creating dummy CSV files, known as fixture files, or by creating dummy data within the test files.

#### Spec Harness
In addition to your own tests, instructors will use this Spec Harness to assess the completion of your project. Prior to your evaluation, follow the direction in the README to set up the spec harness and verify that your code passes the tests. *NOTE: the spec harness is not a replacement for writing your own tests.*

## Iterations
  - Setup and File I/O
  - Statistics
  - Re-Organization
  - Build a Website

## Project Requirements
  - [ ] Have implemented both inheritance and at least one module in a logical manner. 
  - [ ] Can speak as to how/why inheritance and modules made sense for the given implementations, 
    why they improve the organization of the code, and the distinction between the two.
  - [ ] Classes, methods, and variables are well named so that they clearly communicate their purpose. 
  - [ ] Code is all properly indented and syntax is consistent. 
  - [ ] No methods are longer than 10 lines long. 
  - [ ] Most enumerables/data structures chosen are the most efficient tool for a given job, 
    and I can speak as to why those enumerables/data structures were chosen.
  - [ ] Mocks and/or stubs are used appropriately to ensure one of the following: 
    - [ ] Testing is more robust (i.e., testing methods that might not otherwise be tested due to factors like randomness or user input) 
    - [ ] testing is more efficient (i.e., not reading a full CSV file every time you call a method for a test), 
      or that classes can be tested without relying on functionality from other classes. 
    - [ ] Students are able to speak as to how mocks and/or stubs are fulfilling the above conditions. 
    - [ ] Spec harness runs in 5 seconds or less.
  - [ ] Document and implement a code review process throughout the project whereby comments on pull requests are addressed before PRs are merged. 
  - [ ] Commits are made in small chunks of functionality. 
  - [ ] Use pull requests/github issues

## Learning Goals
  - Build classes with single responsibilities.
  - Write organized readable code.
  - Use TDD as a design strategy.
  - Design an Object Oriented Solution to a problem.
  - Practice algorithmic thinking.
  - Use Pull Requests and Issues to collaborate among multiple partners.

## Run and Install The Project
  ruby version:
  gems:

  Fork this repository
  Clone your fork
  From the command line, install gems and set up your DB:
    `bundle`
    `rails db:create`
  Run the entire test suite with `bundle exec rspec`.
  Run your development server with rails s to see the app in action.

## Architure and Design
## Endpoints

## Credits
<table align="left">
    <tr>
        <td align="left"> Candace Eckels: <a href="https://github.com/cece-132">GitHub</a> | <a href="https://www.linkedin.com/in/candace-eckels-b66089201/">LinkedIn</a></td>
    </tr>
<td align="center"><img src="https://avatars.githubusercontent.com/u/100653933?v=4" alt="Candace Eckels GitHub"
 width="150" height="auto" /></td>
 </table>