## Project name: Train Station
It is a railway station management application with text interface that will allow you to manage stations, receive and send trains, display information about them, etc.
Project allowes to:
- Create station
- Create train:
<!-- Create train -->
    create cargo train;
    create passenger train;
- Create route:
<!-- Create route -->
    add waypoint to route;
    delete a waypoint from route;
    assign route to train;
- Add cars
<!-- Create cars -->
    add cars to cargo train;
    add cars to passenger train;
    delete cars from cargo train;
    delete cars from passenger train;
- Move trains:
<!-- Move trains -->
    move train forward;
    move train backward;
- Show info
<!-- Show info -->
    list available stations;
    list trains at the station.

## Requirements
Ruby 3.0.3

## How to launch
- `git clone https://github.com/GeorgeTim1998/trainstation.git`
- `cd trainstation/`
- `ruby interface.rb`
