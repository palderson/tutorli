Tutorli
======

A platform for users to create and sell online courses.

Tutorli is made using:

* Rails 3.2
* Ruby 1.9.3
* Bootstrap for styling
* Stripe for payments
* Pandastream for video 
* Amazon S3 for video and static image & file hosting
* Heroku for hosting (recommended due to Pandastream)

What's Included
===========

Tutorli is designed as a customizable platform that allows you to set up your own online learning platform

Tutorli provides functionality for course creators to:

* Create a course with many lessons
* Upload video-based lesson content
* Create a course description and add written lesson content
* Assign a course to a certain category and level
* Attach downloadable materials to each lesson
* Edit and save a course in an unpublished state
* Publish a course for a price determined by the creator and begin selling
* View which courses have been purchased, when
* How much the creator is owed for each course sale that occurs
* How much will be paid to the creator at the end of the month
* See when a payment has been made and for which course sales the payment refers to
* Add a PayPal account for course earnings to be paid into

Tutorli provides functionality for students to:

* View courses by category
* View courses by level
* View courses by price range
* Enrol in a course
* Purchase a course with a credit card
* View which courses I'm enroled in

Tutorli provides functionality for the site admin to:

* View all courses listed on the site in an editable state
* View each registered user of the site
* View a complete list of course sales for the month
* View how much each course creator is owed at the end of the month
* Mark the payment is paid for each creator payment issued

What's Not Included
===========

* Course creator payouts
* Image bio cropping to size

Tutorial
===========

To get started:

Fork

If you’d like to add features (or bug fixes) to improve the application, you can fork the GitHub repo and make pull requests. Your code contributions are more than welcome!

Clone

If you want to copy and customize the app with changes that are only useful for your own project, you can clone the GitHub repo. Tutorli is only mentioned in the brand class. You'll need to search-and-replace the project name throughout the application. Search for Your Site and replace if with your project name. Also, there are mailers that you'll need to set up. Just search for yourdomain.com and replace it with your own. To clone:
```
$ git clone git://github.com/palderson/tutorli.git
```
You’ll need git on your machine.

Set Up
===========

A couple of obvious steps:
```
$ bundle
$ rake db:migrate
```
Next, creating an Admin user is achieved through a rake tast. Open the file admin.rake and add your credentials. Then run:
```
$ rake admin:create
```
There's also a rake task to create a set of sample data, which includes users, courses, lessons, publishing courses and enrolemnts. Run:
```
$ rake sample:create
```
Dependancies
===========

The application relies on a number of thirdparty services. You'll need to register for these services to generat an API_Key. The services are:

Stripe: 
Update the stripe.rb file with your information. Provisions have been made for both the test and production environments:
```
if Rails.env == 'production'
  Stripe.api_key = "PRODUCTION_KEY"
  STRIPE_PUBLIC_KEY = "PRODUCTION_PUBLIC_KEY"
else
  Stripe.api_key = "TEST_PRODUCTION_KEY"
  STRIPE_PUBLIC_KEY = "TEST_PRODUCTION_PUBLIC_KEY"
end
```
Filepicker.io
Course supporting file uploads are handled by Filepicker.io. Bio images are handled by Paperclip (pull requests to unify this are welcome). Nevertheless, you'll need to input your own Filepicker information, and provide your Amazon credentials to Filepicker.io. Add your API key to the application.rb file:
```
config.filepicker_rails.api_key = 'API_KEY'
```
Amazon S3:
S3 information is contained in the file amazon_s3.yml. Input your information. You may also specify in Filepicker or the application itself a specific folder for each upload path.
```
development:
  access_key_id: TEST_KEY
  secret_access_key: TEST_SECRET

test:
  access_key_id: TEST_KEY
  secret_access_key: TEST_KEY

production:
  access_key_id: PRODUCTION_KEY
  secret_access_key: PRODUCTION_KEY
```
Pandastream:
The application was previously hosted on Heroku, which employs 2 second timeouts. This caused a lot of issues when uploading video. The eventual solution was to use the Pandastream Heroku app. To set this up, you'll need to add the app to your application on Heroku with the following command:
```
$ heroku addons:add pandastream 
```
Also, Pandastream caps the file size of the upload as part of the free account. To support video uploads of any decent size, you'll need to the Solo offering.

Sendgrid:
Mailers are hendled by Sendgrid. This again is an Heroku app. Just run the below and set up an account on Sendgrid.
```
$ heroku addons:add sendgrid 
```

Summary
===========

The above should provide you much or what you need to get started. There are a few issues with the code, although nothing that can't be overcome.

Also, I should say that for any newbies, the code certainly does not represent best practices. There's a lot that could be improved as to how it's been built. With that said, it works!

If you fine this helpful, follow me on Twitter @peteralderson.

Lastly, if encountering this bug:
```
Fix for Nokogiri w. libxml2 2.7.8 loading libxml2 2.7.3
```
Run this:
```
brew install libxml2 libxslt
brew link libxml2 libxslt
gem install nokogiri -- --with-xml2-lib=/usr/local/Cellar/libxml2/2.7.8/lib --with-xml2-include=/usr/local/Cellar/libxml2/2.7.8/include
```
