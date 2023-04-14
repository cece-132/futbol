# Futbol

Starter repository for the Turing School of Software and Design, [Futbol project](https://backend.turing.edu/module1/projects/futbol/), [Spec Harness](https://github.com/turingschool-examples/futbol_spec_harness/blob/main/spec/stat_tracker_spec.rb).

## Table of Contents
  1. [Project Description](#project-description)
  2. [Testing](#testing)
  3. [Iterations](#iterations)
  4. [Project Requirements](#project-requirements)
  5. [Learning Goals](#learning-goals)
  6. [Run and Install The Project](#run-and-install-the-project)
  7. [Architecture and Design](#architecture-and-design)
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

To run the test suite:
 - Entire suite: `rspec spec`
 - One file: `rspec spec/<folder_name>/<file_name>.rb
 - One test: `rspec spec/<folder_name>/<file_name>.rb:<line_number>

To check the testing percentage run `rspec spec`, then `open coverage/index.html`. An internet window should open with the testing coverage percentages for the entire application.

## Iterations
  - Setup and File I/O
  - Statistics
  - Re-Organization
  - Build a Website

## Project Requirements
  - [ ] Have implemented both inheritance and at least one module in a logical manner. 
  - [ ] Can speak as to how/why inheritance and modules made sense for the given implementations, 
    why they improve the organization of the code, and the distinction between the two.
  - [x] Classes, methods, and variables are well named so that they clearly communicate their purpose. 
  - [x] Code is all properly indented and syntax is consistent. 
  - [ ] No methods are longer than 10 lines long. 
  - [x] Most enumerables/data structures chosen are the most efficient tool for a given job, 
    and I can speak as to why those enumerables/data structures were chosen.
  - [ ] Mocks and/or stubs are used appropriately to ensure one of the following: 
    - [ ] Testing is more robust (i.e., testing methods that might not otherwise be tested due to factors like randomness or user input) 
    - [ ] testing is more efficient (i.e., not reading a full CSV file every time you call a method for a test), 
      or that classes can be tested without relying on functionality from other classes. 
    - [ ] Students are able to speak as to how mocks and/or stubs are fulfilling the above conditions. 
  - [x] Document and implement a code review process throughout the project whereby comments on pull requests are addressed before PRs are merged. 
  - [x] Commits are made in small chunks of functionality. 
  - [x] Use pull requests/github issues

## Learning Goals
  - Build classes with single responsibilities.
  - Write organized readable code.
  - Use TDD as a design strategy.
  - Design an Object Oriented Solution to a problem.
  - Practice algorithmic thinking.
  - Use Pull Requests and Issues to collaborate among multiple partners.

## Run and Install The Project
  ruby version: ruby 2.7.2
  gems: simplecov, pry

  Fork this repository
  Clone your fork
  From the command line, install gems and set up your DB:
    `bundle install`
    Run the [entire test suite](#testing) with `rspec`.

## Architecture and Design

  This app is designed to take in the data from a collection of csv file's and convert the csv into data objects that can then be manipulated throughout the application. 

  ##### Object Oriented Programming (OOP)

  This app follows OOP. Uses classes and objects to create modular reusable code. This was important to the organization of this project to writing code that was readable and followed single responsibility principle. 
  
  ##### Modules
  Throughout the app **modules** are the preferred container for method sharing for the `lib/stat_tracker.rb` I chose this because I didn't want to have to instantiate objects everytime I needed to manipulate a specific set of data. Modules worked well for my use case because I was able to share different categories of methods with the `lib/stat_tracker.rb` while also keeping the data organized based on the return values.

  ##### File Structure

    This project uses `lib`, `spec`, and `data` folders to organize the code. Each folder includes to follwing code:
    - `lib` includes the library of code that contains a folder called `lib/poros`. This folder holds our plain old ruby objects. 
  ##### Command Line Interface
  ##### Testing
  ##### Database Access


## Credits
<table align="left">
    <tr>
        <td align="left"> Candace Eckels: <a href="https://github.com/cece-132">GitHub</a> | <a href="https://www.linkedin.com/in/candace-eckels-b66089201/">LinkedIn</a></td>
    </tr>
        <td align="center"><img src="https://avatars.githubusercontent.com/u/100653933?v=4" alt="Candace Eckels GitHub" width="150" height="auto" />
        </td>
 </table>