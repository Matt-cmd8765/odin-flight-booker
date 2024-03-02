# README

## The Odin Project Flight Booker

This repo is a part of the Odin Project curriculum. This project was meant to teach about advanced forms in rails. Link to the project outline is [HERE](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker)

## Rails, Ruby and Gem versions

* Ruby version: 3.3.0
* Rails version: 7.1.3
* Bootstrap gem version: 5.3.2
* Sqlite 3 version: 1.4

## How I did it

### Airport / Flight Models

First step was to create Airport and Flight models and set up the appropriate associations. I went with having the Airport model have many arriving and departing flights named as such as foreign keys.

The Flight model will belong to a departure or arrival airport. Again named as such as foreign keys. 

Flights and airports were created and seeded using db/seeds.rb. My first time using this. 

### Flight Search

As per the instructions the search page is in the flights/index view. In the controller I filter the unique airport codes for the dropdown menus of arrival and departure airports. I also had to set the flight search results to nil initially so that the search results would initially be blank before the user searches. 

The search results also have passenger # and dates to choose from. For the simplicities sake I capped the passenger # at 4. For the dates I used date_field_tag instead of a drop down as specified in the Odin Project cause I thought it looked cooler. 

The form for the search submits a GET request to the flight_path. The relevant params are submitted and searched using Flight.where in the controller. 

### Search Results

Search results are rendered under the dropdown search menus. They are returned in a table format which is within a form that submits a get request to the new_booking_path. It took me a long time to figure out that the form would not work unless it was outside the table. The user will then select which flight they would like to book by selecting the appropriate radio button and clicking the book button.

### Booking and Passenger Models

The booking model belongs_to Flight and has_many Passengers. It also accepts nested attributes for passengers which is used when creating new bookings. The Passengers model belongs_to booking. 

### New Booking

The user will then be directed to the booking new view. This view is a form with model which is a new booking object. This form contains a fields_for passengers sub-form. This as well as the accepts_nested_attributes_for declaration in the booking model allow the user to input the Name and email for each passenger indicated in the flight search page. The ```no_of_passengers.to_i.times { @booking.passengers.build }``` code in the booking controller will ensure that the appropriate number of fields are created for names and emails depending on the number of passengers. 

There are a few simple validations in the passengers model which requires precense of both the name and email are well as email uniqueness. This validation is triggered upon create. 

### Show Booking

The final step will direct the user to the booking show page which will show the user the details of their booking. 

## Bootstrap and CSS

The css for this uses bootstrap. Makes everything look a lot more modern and a lot less 90s. Even so, I have added some custom CSS in the layout.css file. 

## Final Thoughts

Very challenging project, actually took me a few months to complete due to travel and other work / family commitments. This did really increase my understading of active record associations as a good understanding is need to create all the necessary forms for this project. As I'm at the stage where you kind of get thrown in the deep end in the Odin Project it also increased my knowledge of the MVC system and appropriate routes as it was really needed to ensure the forms were following and submitting to the correct paths. 
