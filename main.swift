

enum FlightStatus: String {
  case EnRoute = "En Route"
  case Scheduled = "Scheduled"
  case Canceled = "Canceled"
  case Delayed = "Delayed"
}


struct Airport {
  let name: String
  let location: String
}
var JFK = Airport(name: "JFK Airport",
location: "New York, NY")

var SFO = Airport(name: "SFO",
location: "San Francisco, CA")



struct Flight {
  var flightnum: Int 
  var status: FlightStatus
  var time: Int? = nil // Can't import Foundation
  var terminal: String? =  "TBD"
  var airline: String? = "Ask an attendant"
  var destination: String
  var departure: String
  }



//:
//: d. Use a `Date?` for the departure time since it may be canceled.



//:
//: e. Use a `String?` for the Terminal, since it may not be set yet (i.e.: waiting to arrive on time)
//:
//: f. Use a class to represent a `D epartureBoard` with a list of departure flights, and the current airport

class DepartureBoard {
  var flights: [Flight]
  init(flights: [Flight] = []) {
    self.flights = flights
  }
  func alertPassengers () {   
      for flight in flights {
          switch flight.status {
          case .EnRoute:
            print("You're already flying!")
          case .Scheduled:
              print ("Your flight to \(flight.destination) is scheduled to depart at \(flight.time) from terminal: \(flight.terminal)")
          case .Canceled:
              print("We're sorry your flight to \(flight.destination) was canceled, here is a $500 voucher")
          case .Delayed:
              print("We're sorry! Your flight to \(flight.destination) is delayed.")
              }
          if flight.time == nil {
            print("Youre flight is still to be determined!")
          } else {
            print("Your flight to \(flight.destination) is scheduled to depart at \(flight.time) from terminal: TBD")
          }
        }
        }

  
  
}


var myDepartureBoard = DepartureBoard(flights: [])





//: ## 2. Create 3 flights and add them to a departure board

let delta = Flight(flightnum: 4040,
status: .EnRoute,
time: 1400,
terminal: nil,
airline: "Delta",
destination: JFK.name,
departure: SFO.name)

let united = Flight(flightnum: 0202,
status: .Canceled,
time: nil,
terminal: "3",
airline: "United",
destination: JFK.name,
departure: SFO.name)

let spirit = Flight(flightnum: 3030,
status: .Scheduled,
time: 1400,
terminal: "5",
airline: "Delta",
destination: JFK.name,
departure: SFO.name)

myDepartureBoard.flights.append(delta)
myDepartureBoard.flights.append(united)
myDepartureBoard.flights.append(spirit)


//: a. For the departure time, use `Date()` for the current time


//:
//: b. Use the Array `append()` method to add `Flight`'s
//:
//: c. Make one of the flights `.canceled` with a `nil` departure time
//:
//: d. Make one of the flights have a `nil` terminal because it has not been decided yet.
//:
//: e. Stretch: Look at the API for [`DateComponents`](https://developer.apple.com/documentation/foundation/datecomponents?language=objc) for creating a specific time


//: ## 3. Create a free-standing function that can print the flight information from the `DepartureBoard`

func printDepartures(departureBoard: DepartureBoard) {
  for flight in departureBoard.flights {
    if let unwrappedTerminal = flight.terminal {
      print("Flight: \(flight.flightnum), Destination: \(flight.destination), Time: \(flight.time), Terminal: \(unwrappedTerminal), Status: \(flight.status.rawValue)")
  } else {
    print("Flight: \(flight.flightnum), Destination: \(flight.destination), Time: \(flight.time), Terminal: TBD, Status: \(flight.status.rawValue)")
  }
}
}
// printDepartures(departureBoard: myDepartureBoard)

func printDepartures2 (departureBoard: DepartureBoard) {
  for flight in departureBoard.flights {
    if let unwrappedTime = flight.time {
      if let unwrappedTerminal = flight.terminal {
        print("Flight: \(flight.flightnum), Destination: \(flight.destination), Time: \(unwrappedTime), Terminal: \(unwrappedTerminal), Status: \(flight.status)")
    } else {
      print("Flight: \(flight.flightnum), Destination: \(flight.destination), Time: \(unwrappedTime), Terminal: \(flight.terminal), Status: \(flight.status)")}
  } else {
    print("Flight: \(flight.flightnum), Destination: \(flight.destination), Time: N/A, Terminal: TBD, Status: Canceled")
  }
}
}


// printDepartures2(departureBoard: myDepartureBoard)



//: ## 5. Add an instance method to your `DepatureBoard` class (above) that can send an alert message to all passengers about their upcoming flight. Loop through the flights and use a `switch` on the flight status variable.
//: a. If the flight is canceled print out: "We're sorry your flight to \(city) was canceled, here is a $500 voucher"
//:
//: b. If the flight is scheduled print out: "Your flight to \(city) is scheduled to depart at \(time) from terminal: \(terminal)"
//:
//: c. If their flight is boarding print out: "Your flight is boarding, please head to terminal: \(terminal) immediately. The doors are closing soon."
//:
//: d. If the `departureTime` or `terminal` are optional, use "TBD" instead of a blank String
//:
//: e. If you have any other cases to handle please print out appropriate messages
//:
//: d. Call the `alertPassengers()` function on your `DepartureBoard` object below
//:
//: f. Stretch: Display a custom message if the `terminal` is `nil`, tell the traveler to see the nearest information desk for more details.


myDepartureBoard.alertPassengers()

//: ## 6. Create a free-standing function to calculate your total airfair for checked bags and destination
//: Use the method signature, and return the airfare as a `Double`
//:

func calculateAirfare(checkedBags: Int, distance: Int, travelers: Int) -> Double {
  let bagCost = 25.00
  let mileCost = 0.1
  var bags = Double(checkedBags)
  var bdistance = Double(distance)
  var btravelers = Double(travelers) 
  let finalCost = (((bagCost * bags) + (mileCost * bdistance)) * btravelers)
  return finalCost
}


//:
//: a. Each bag costs $25
//:
//: b. Each mile costs $0.10
//:
//: c. Multiply the ticket cost by the number of travelers
//:
//: d. Call the function with a variety of inputs (2 bags, 2000 miles, 3 travelers = $750)
//:
//: e. Make sure to cast the numbers to the appropriate types so you calculate the correct airfare
//:
//: f. Stretch: Use a [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) with the `currencyStyle` to format the amount in US dollars.
