# README
Check it out here: <https://agile-earth-62335.herokuapp.com/>

Demo Users:
 - email: `admin@example.com` password: `go`
 - email: `bob@example.com` password: `go`

Development Concepts Used:
- many to many DB relationship
- polymorphic association
- form with nested attributes
- api call to OpenWeather
- CRUD operations for a project model

Dependencies/Technologies Added:
- postgreSQL (for persistence)
- rspec (for testing)
- httparty (for API calls)
- bourbon/neat (for styling)

As an admin user you can:
- create, update, and delete a project
- assign and unassign people to a project
- view all of the projects your company has

As a regular user you can:
- view all of the projects you're assigned to
- see all of the people that are on the project
- see a show page for a project

NOTE: In the seed file a company was created, and all of the users are added to that
company. For the demo purposes, there isn't an interface for creating a company.
If there are multiple companies, user, when signing up can decide which company
to be added to.