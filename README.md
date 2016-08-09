# project_surveyor
Build it, take it, view it.

Alex and Phil's Surveyor

[A Ruby on Rails project from the Viking Code School which uses Active Record Associations, nested forms, collection forms, range fields, and PostgreSQL](https://www.vikingcodeschool.com)


What is the relationship between a survey and its questions?
A survey has many questions

How might you create a survey and also create questions for it?
Nested form

What is the relationship between a multiple choice question and its options?
A multiple choice question has many options




How do you create a multiple choice questions and also create options for it?
Form that sends you to the nested resource


Surveys
:titles
:descriptions
has_many: questions


Multiple Choice Questions
:type
:text
:required, boolean
has_many: options
belongs_to: survey






Options
:text
belongs_to: multiple_choice_question


Responses
  polymorphic to multiple choice and to range question


Question.fields_for :responses do |response_field|
  if question is multiple choice
  


Override responses= method for MCQ and RQ
  

Did the class methods succeed -- if not you can return why on the survey options






