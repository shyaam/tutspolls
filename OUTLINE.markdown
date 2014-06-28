# Build a Poll Application with Statistics using Rails

This course is an exercise that focuses on how to build a poll application with
Ruby on Rails. You'll learn how to dissect a complex data model into several
parts and also digest poll data into new data, useful for gathering
intelligence.

# Introduction

## 01. Introduction

### Time: 00:02:56

Welcome to the course! You'll be given an introduction to the exercise we'll
perform and what goals we will achieve.

**Show notes**

* [Ruby Fundamentals Course](https://courses.tutsplus.com/courses/the-fundamentals-of-ruby)
* [Riding Ruby on Rails Course](https://courses.tutsplus.com/courses/riding-ruby-on-rails)

## 02. Bootstrapping the Project

### Time: 00:07:31

In this lesson we'll bootstrap a brand new Rails project, but we'll take it a
step further and install some third-party dependencies right off the bat.

**Show notes**

* [Haml documentation](https://haml.info)

## 03. Defining the Business Model

### Time: 00:06:15

Before jumping into code, it's important we acknowledge how the polls are
defined, in the scope of an information system like the one we're about to
build. We'll dissect the entire data model and define the set of models we'll
create with ActiveRecord.

# Build the Application Core

## 04. Polls

### Time: 00:13:23

Now that we are fully aware of the data model, we'll begin implementing it.
We'll start by creating the polls resource. We'll also take the chance to
improve on the overall look and feel of the application.

**Show notes**

* [Bootstrap CSS](https://getbootstrap.com)

## 05. Questions

### Time: 00:17:22

Once we got poll management to work we can dive into the data model a little
further. In this lesson we'll implement questions.

## 06. Possible Answers

### Time: 00:10:55

Now that questions are integrated with the polls we can focus our attention on
a particular kind of questions that take yet another model: possible answers.
We'll learn how to integrate them with the question model.

## 07. Replies and Answers

### Time: 00:20:45

After defining structure to our polls through questions and possible answers,
we can start thinking about the mechanism of taking the polls. We'll implement
the reply and answer models to fulfill that use case.

## 08. Display Reply Data

### Time: 00:10:40

We are now able to take polls. The final lesson in this chapter revolves around
displaying user data. We'll show all replies to a poll which allow us to
collect valuable information about it.

# Build Statistics

## 09. Serializing Data for the Charts - Part 1

### Time: 00:17:24

Gathering intelligence is really important in business. One way we can
accomplish that is through digested data that can be visualized through charts.
We'll start by considering a class that will digest data to be visualized later
by another portion of code.

The first piece of intelligence we'll gather is how many polls were taken per
month.

## 10. Introducing Google Charts

### Time: 00:08:56

There are many different kinds of visualization libraries out there. For this
course we'll use Google Charts as it very easy to feed data to it, which
immediately displays all the expected chart components. We'll begin exploring
how to get started with the library.

**Show notes**

[Google Charts](http://developers.google.com/chart)

## 11. First Chart: How many polls taken over time?

### Time: 00:16:34

In the previous lesson we began exploring Google Charts to implement our
charts. We'll apply that experience with our own set of data and render our
very first chart.

## 12. Serializing Data for the Charts - Part 2

### Time: 00:04:26

Our first piece of intelligence is taken care of. We can now move on to the
second piece as we'll implement another method that will answer what kind of
answers we have for a particular question.

## 13. Second Chart: What kind of answers for a particular question?

### Time: 00:13:41

Now that we have the data for the second piece of intelligence we can use
Google Charts to visualize that kind of data. We'll refactor what we had for
one chart and make it flexible enough to work with both charts.

# Conclusion

## 14. Administration

### Time: 00:10:10

Our core business model is complete, we can now focus on minor tasks and
features. One thing we can implement is a user base which will allow us to
enforce authentication to our system. We'll use Devise to accomplish that.

**Show notes**

* [Devise on GitHub](http://github.com/plataformatec/devise#readme)

## 15. Authorization

### Time: 00:11:55

After implementing users into our system, we can focus on authorization to make
sure administrators get privileges. This means regular users will face
restrictions to our system, which is exactly the point in this whole endeavor.

## 16. Conclusion

### Time: 00:04:53

Thank you very much for taking the time in viewing this course. Make sure to
give us feedback, either through the course forum or through Twitter.

**Show notes**

[Tuts+ at Twitter](https://twitter.com/tutsplus)
[José at Twitter](https://twitter.com/josemotanet)
