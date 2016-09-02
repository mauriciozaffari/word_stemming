# WordStemming

Library to extract a dictionary of stems rated 1 to 5 based on most ocurrences from a colleciton of descriptions, and match descriptions accordingly.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'word_stemming'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install word_stemming

## Usage

To create a dictionary from one or multiple pieces of text:

    descriptions = ["The Garage – Auto Repair is a family owned and operated complete automotive repair shop. They service all foreign and domestic cars and light trucks. The Garage employee’s are ASE certified technicians trained in diagnosing and repairing today’s most complex automotive repair problems. They perform minor maintenance services like oil changes, fluid flushes and tune-ups as well as filter replacement. The Garage mechanics can also take care of any of your tire service needs such as installing a new set of tires, repair a flat tire or perform a tire balance. If your TPMS light comes on, their trained automotive technicians can diagnose and repair that also. They can even perform a wheel alignment. If you have a steering or suspension problem they can help by diagnosing the system and replacing any worn out parts.  Their MAC certified professionals can diagnose and repair any of your air conditioning problems as well as any heating system problem.  The Garage can also perform services like drive belt and hose replacement to ensure your cooling system works properly.  If you’re having a problem with your car starting, our mechanics can install a new battery and even test or repair your charging and starting system.  The Garage auto technicians can also perform a brake service while you wait. All their repairs are warranted for 12 months or 12,000 miles and are backed by their nationwide warranty and complementary road side assistance program.", "Need an auto repair or service? Last Chance Auto Repair has been serving Plainfield, Naperville, Bolingbrook, Romeoville, IL, & beyond since 1978. Call (815)577-0327 if you have any questions or to schedule an appointment. Our team welcomes you to our full service, auto repair, maintenance shop. We offer complete auto care, convenient hours, BBB A+ quality, all with a local low cost guarantee. You brake it, we'll fix it, domestic & foreign a-z. Family owned, priced right, quality you can trust plus afford auto repair shop. Call today, tonight, 24-7, we're here for you. Last Chance Auto Repair is complete automotive. How complete you might wonder? Well from our basic air conditioning, air filter, alignment, alternator, battery, cooling system, ignition, inspection, maintenance, oil change, radiator flushing, shocks, struts, spark plug, starter, tire, tune-up, services. To our more complex including alignments, brakes, climate control, disc brake, electrical, emissions, engine, heating & cooling, heater core, radiators, steering & suspension, timing belt, timing chain, transmission flushing, transmission service, transmission rebuilding, water pump services. Just to name a few but you break it, we do fix it, a-z. Do you have any questions? Last Chance Auto Repair has over 100+ years of total automotive business, knowledge, know how plus services under our belts. Family owned & operated Plainfield auto repair service shop started in 1978. Ron ran a Hendrickson Trucks research lab. Worked as a Dodge Trucks service manager. Corry a Universal Technical Institute graduate. Trained in domestic plus foreign auto, diesel, electrical, technology. Including Mercedes Benz, BMW, GM, Ford, Daimler-Chrysler, vehicles a-z. A Tellabs electronic technician. Arrow Trucks A.S.E. trained mechanic. Their combined knowledge equals an auto repair shop that you can trust plus afford. Need an auto repair or service? Call Last Chance Auto Repair at (815)577-0327 now, later, 24-7!"]

    dictionary = WordStemming::Dictionary.new(descriptions.join)

This will create a weighted dictionary:

    dictionary.dictionary

    => {"repair"=>5, "auto"=>3, "servic"=>3, "shop"=>1, "automot"=>1, "system"=>1, "garag"=>1, "problem"=>1, "perform"=>1, "tire"=>1, "diagnos"=>1, "complet"=>1, "brake"=>1, "train"=>1, "truck"=>1, "technician"=>1, "chanc"=>1, "transmiss"=>1, "call"=>1, "start"=>1, "cool"=>1, "belt"=>1, "align"=>1, "mechan"=>1, "replac"=>1, "flush"=>1, "mainten"=>1, "domest"=>1, "foreign"=>1, "own"=>1, "famili"=>1, "air"=>1}

You can also add more descriptions to improve your dictionary:

    dictionary.add_to_dictionary "Need an auto repair or service? Last Chance Auto Repair has been serving Plainfield, Naperville, Bolingbrook, Romeoville, IL, & beyond since 1978. Call (815)577-0327 if you have any questions or to schedule an appointment. Our team welcomes you to our full service, auto repair, maintenance shop. We offer complete auto care, convenient hours, BBB A+ quality, all with a local low cost guarantee. You brake it, we'll fix it, domestic & foreign a-z. Family owned, priced right, quality you can trust plus afford auto repair shop. Call today, tonight, 24-7, we're here for you. Last Chance Auto Repair is complete automotive. How complete you might wonder? Well from our basic air conditioning, air filter, alignment, alternator, battery, cooling system, ignition, inspection, maintenance, oil change, radiator flushing, shocks, struts, spark plug, starter, tire, tune-up, services. To our more complex including alignments, brakes, climate control, disc brake, electrical, emissions, engine, heating & cooling, heater core, radiators, steering & suspension, timing belt, timing chain, transmission flushing, transmission service, transmission rebuilding, water pump services. Just to name a few but you break it, we do fix it, a-z. Do you have any questions? Last Chance Auto Repair has over 100+ years of total automotive business, knowledge, know how plus services under our belts. Family owned & operated Plainfield auto repair service shop started in 1978. Ron ran a Hendrickson Trucks research lab. Worked as a Dodge Trucks service manager. Corry a Universal Technical Institute graduate. Trained in domestic plus foreign auto, diesel, electrical, technology. Including Mercedes Benz, BMW, GM, Ford, Daimler-Chrysler, vehicles a-z. A Tellabs electronic technician. Arrow Trucks A.S.E. trained mechanic. Their combined knowledge equals an auto repair shop that you can trust plus afford. Need an auto repair or service? Call Last Chance Auto Repair at (815)577-0327 now, later, 24-7!"

    => {"repair"=>5, "auto"=>4, "servic"=>4, "shop"=>1, "chanc"=>1, "brake"=>1, "complet"=>1, "truck"=>1, "automot"=>1, "system"=>1, "call"=>1, "train"=>1, "transmiss"=>1, "tire"=>1, "garag"=>1, "cool"=>1, "belt"=>1, "air"=>1, "align"=>1, "flush"=>1, "mainten"=>1, "problem"=>1, "technician"=>1, "domest"=>1, "foreign"=>1, "own"=>1, "famili"=>1, "perform"=>1}

    dictionary.add_to_dictionary "Omega Auto Repair & Towing Fort Worth Tx will have a trained technician out to help you within 30 minutes or less. One of our very recognizable trucks will pull up, and we'll be ready to assist you in changing a tire, refilling your gas tank, jump starting your car's battery etc. And, if something else is wrong with your vehicle, of course we will be able to get you towed to a garage so that you can have a proper mechanic get to work on repairs."

    => {"repair"=>5, "auto"=>4, "servic"=>3, "shop"=>1, "chanc"=>1, "truck"=>1, "brake"=>1, "complet"=>1, "automot"=>1, "train"=>1, "tire"=>1, "call"=>1, "transmiss"=>1, "technician"=>1, "system"=>1, "garag"=>1, "start"=>1, "cool"=>1, "belt"=>1, "align"=>1, "mechan"=>1, "flush"=>1, "mainten"=>1, "perform"=>1, "problem"=>1, "domest"=>1, "foreign"=>1, "own"=>1, "famili"=>1, "air"=>1}

Notice that as the sample size gets bigger, some stems lose relevance and thus get removed from the dictionary:

    dictionary.add_to_dictionary "21st century complete automotive repair facility designed to make car repairs simple, affordable and reliable. Offering complete car care service from routine dealer recommended maintenance to complete diagnostics and full service auto repair. Mechanic One makes auto repair simple through revolutionary convenience, affordable with various offers and reliable with the expertise that their auto mechanic specialists provide. Mechanic One is an Equal Opportunity Employer that is committed to excellence and diversity. We also take affirmative action to offer employment and advancement opportunities to all applicants, including minorities, women, protected veterans, and individuals with disabilities."

    => {"repair"=>5, "auto"=>4, "servic"=>3, "complet"=>1, "shop"=>1, "truck"=>1, "automot"=>1, "chanc"=>1, "mechan"=>1, "train"=>1, "tire"=>1, "brake"=>1, "mainten"=>1, "afford"=>1, "technician"=>1, "garag"=>1, "call"=>1, "system"=>1, "transmiss"=>1}

Now you can check how much a specific description matches this dictionary.

This is a description from a auto repair shop that's included in the dictionary generation:

    dictionary.match "The Garage – Auto Repair is a family owned and operated complete automotive repair shop. They service all foreign and domestic cars and light trucks. The Garage employee’s are ASE certified technicians trained in diagnosing and repairing today’s most complex automotive repair problems. They perform minor maintenance services like oil changes, fluid flushes and tune-ups as well as filter replacement. The Garage mechanics can also take care of any of your tire service needs such as installing a new set of tires, repair a flat tire or perform a tire balance. If your TPMS light comes on, their trained automotive technicians can diagnose and repair that also. They can even perform a wheel alignment. If you have a steering or suspension problem they can help by diagnosing the system and replacing any worn out parts.  Their MAC certified professionals can diagnose and repair any of your air conditioning problems as well as any heating system problem.  The Garage can also perform services like drive belt and hose replacement to ensure your cooling system works properly.  If you’re having a problem with your car starting, our mechanics can install a new battery and even test or repair your charging and starting system.  The Garage auto technicians can also perform a brake service while you wait. All their repairs are warranted for 12 months or 12,000 miles and are backed by their nationwide warranty and complementary road side assistance program."

    => 85% match

This is a description from a auto repair shop that's NOT included in the dictionary generation:

    dictionary.match "LMC Automotive Repair & Collision offers a wide range of services that most auto repair shops do not, we are a one stop shop for all your auto repair needs! We provide auto repair estimates prior to the repair for your approval. We can perform regular scheduled maintenance on your car or truck or repair your vehicle back to original condition from an accident. We also offer a Free Shuttle Service to or from your home or work, we do have some limitations on distance but just ask the guys at the service counter. LMC is a Napa Auto care center which provides peace of mind nationwide warranties on all our repairs. We are committed to auto repair and to serving you with quality and value. Bring your car in today for an inspection, and see what our commitment to quality is all about!"
    => 57% match


This is a description from a rails development company that has nothing to do with the auto-repair industry:

    dictionary.match "http://www.railsteam.com -web application development made application using ruby on rails and web based rails development for internal and customer use.we have talented ruby on rails developer for agile development processes and cost effective Ruby on rails development.we are doing open source application work in our ruby on rails company"
    => 0% match

For calculable integer results instead of a string, use the `match_score` method:

    dictionary.match_score "http://www.railsteam.com -web application development made application using ruby on rails and web based rails development for internal and customer use.we have talented ruby on rails developer for agile development processes and cost effective Ruby on rails development.we are doing open source application work in our ruby on rails company"
    => 0

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and create a tag with the same version.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

