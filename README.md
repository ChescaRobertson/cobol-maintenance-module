# Maintenance Week

Every time I have spoken to engineers about COBOL, they have told me that COBOL
itself is far from the biggest challenge. The real challenge is working with
legacy or mature codebases. These tend to be large, complex, and unfamiliar.

This week you will learn and put into practice some techniques for working with
mature software projects. The projects you will encounter in work will very
likely be even larger than these.

## Learning objectives

* Learn that while mature software projects may seem intimidating at first, you
  can still understand and modify them with due care and effort.
* Learn to apply tests to control changes to mature software.
* Learn to trace execution through a complex system.
* Learn to diagram out a complex system to identify opportunities for change.

## Project 1: Gilded Rose

The Gilded Rose is a well-known exercise in working with legacy code. You are given a small but very messy codebase, and asked to make a small change to it. If you just immediately try to implement the change, it is challenging.

You can view one of the key qualities of software as 'how easy is it to change?' This code is hard to change.

The learning objective here is to:

* Learn to apply tests to control changes to mature software.

[Take a look at the exercise](./gilded_rose)

### Applying Tests

If you want to change some legacy code, you will almost always have to go through a process of discovery and verification a bit like this:

1. Identify the current behaviour of the code.
2. Change that behaviour.
3. Verify that the new behaviour works as expected.
4. Verify that the prior behaviour still works as expected.

To put it in simple terms, if you're going to change some code you need to make sure you don't break things in the process! And to do this, you need to some form of testing.

That might be manual testing. However, it is usually both more efficient and more reliable to introduce automated testing. Plus, you will be helping your colleagues later on.

In this codebase you have a starter to help you. Very often in your career you won't have this, and you'll have to create your own testing infrastructure! That's where it gets really exciting, but we'll come to this in a future project.

## Project 2: 2048

### Tracing Execution

## Project 3: ORCA

### Diagramming
