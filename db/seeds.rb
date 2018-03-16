# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.create(name: 'Sunny Construction')
company.create_address(street: '4 Sunny Street', city: 'Seattle', state: 'WA', zip: '98102')

admin = User.create(
  username: 'admin',
  email: 'admin@example.com',
  company_id: company.id,
  password: 'go',
  password_confirmation: 'go',
  admin: true
)

project_1 = Project.create(
  name: 'The Tallest Building',
  description: 'Prior to 1998, the tallest building status was determined by the height of the building to the top of its architectural elements',
  image_url: 'tallest_building',
  company_id: company.id
)
project_1.create_address(street: '123 Main Street', city: 'Rockville', state: 'MD', zip: '20853')

project_2 = Project.create(
  name: 'The Pool',
  description: 'Swimming pools became popular in Britain in the mid-19th century',
  image_url: 'pool.jpg',
  company_id: company.id
)

project_2.create_address(street: '123 East Street', city: 'Seattle', state: 'WA', zip: '98102')

bob = User.create(
  username: 'bob',
  email: 'bob@example.com',
  company_id: company.id,
  password: 'go',
  password_confirmation: 'go'
)

molly = User.create(
  username: 'molly',
  email: 'molly@example.com',
  company_id: company.id,
  password: 'go',
  password_confirmation: 'go'
)

frank = User.create(
  username: 'frank',
  email: 'frank@example.com',
  company_id: company.id,
  password: 'go',
  password_confirmation: 'go'
)

bob.projects << project_1
bob.projects << project_2
molly.projects << project_1
frank.projects << project_2
