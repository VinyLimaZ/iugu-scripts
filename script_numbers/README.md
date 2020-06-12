## README MagicNumbers Script

A script to verify if a number is a:
Prime and/or a Esoteric number (Number divided only by 3 AND 5) and/or Cetic (Every number that isn't an esoteric)

### What You'll need to use this:
- Ruby 2.6.6 (If you don't have that's okay, remove the `ruby: '2.6.6'` of the Gemfile file, delete the Gemfile.lock
    file and the .ruby-version file)
- Bundler (To install the RSpec gem)
- RSpec (Only to verify if the code is without errors)

### To run the verifier:
`bundle install`
> if you want only to see if a number is a magic number, skip this step)

`ruby main.rb`

### If you want to verify the code: Run the tests!

`rspec`
