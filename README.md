# The FAAST System: Makers Academy Week 1 Challenge

Using Ruby and rspec to implement TDD, we are meant to design a tube system.
The FAAST system will include stations that hold a number of trains, trains with
a number of carriages, and carriages that hold up to 40 passengers.

## Languages and Tools
This system is written in Ruby, using the Rspec testing suite. TDD was done in a combination of Chicago and London styles, with heavy use of [Rspec mocks](https://github.com/rspec/rspec-mocks).

### To Open
In your terminal, clone the repository.
```shell
     	$ git clone git@github.com:barr-code/FAAST.git
```

Change into the directory.
```
	$ cd FAAST
```

### To Run Tests
```
        $ rspec
```

### Play with the code
```
	$ irb
	> require './runner.rb'
	> liverpool_street = Station.new
	> oxford_circus = Station.new
	> victoria = Passenger.new
	> train = Train.new
	> coach = Coach.new
	> train.load(coach)
	> liverpool_street.accept(train)
```

### Enter the station
```
	> victoria.enter(liverpool_street)
```

### Get on a train
```
	> victoria.board(liverpool_street, coach)
```

### Disembark at your destination
```
	> victoria.get_off(coach, oxford_cirucs)
```

### Leave station and go home
```
	> victoria.exit(oxford_circus)
```

