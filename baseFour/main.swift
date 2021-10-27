//
//import Foundation
//
//print("Hello, World!")
//






import UIKit


enum CarEngineState{
    case on, off
}

enum CarWindowState{
    case open, close
}

class Car {
    let brand: String
    let year: Int
    let trunkVolume: Int
    var trunkFullness: Int
    var engineState: CarEngineState
    var windowState: CarWindowState

    init(brand: String,
         year: Int,
         trunkVolume: Int,
         trunkFullness: Int,
         engineState: CarEngineState,
         windowState: CarWindowState) {
        self.brand = brand
        self.year = year
        self.trunkVolume = trunkVolume
        self.trunkFullness = trunkFullness
        self.engineState = engineState
        self.windowState = windowState
    }
    
    func openWindows() {
        windowState = .open
        print("Окна открыты")
    }
    
    func closeWindows() {
        windowState = .close
        print("Окна закрыты")
    }
    
    func addBaggage(baggageWeight: Int) {
        if (self.trunkFullness+baggageWeight > self.trunkVolume) {
            print("Багажник переполнен")
        } else {
            self.trunkFullness += baggageWeight;
            print("Багажник заполнен на \(self.trunkFullness) из \(self.trunkVolume)")
        }
    }
}

class SportCar: Car{
    var maxSpeed: Int
    init(maxSpeed: Int,
         brand: String,
         year: Int,
         trunkVolume: Int,
         trunkFullness: Int,
         engineState: CarEngineState,
         windowState: CarWindowState){
        self.maxSpeed = maxSpeed
        super.init(brand: brand, year: year, trunkVolume: trunkVolume, trunkFullness: trunkFullness, engineState: engineState, windowState: windowState)
    }
    
    override func openWindows() {
        super.openWindows()
        print("Закройте окна")
    }
}

class TrunkCar: Car{
    var passengerSeats: Int
    
    init(passengerSeats: Int,
         brand: String, year: Int,
         trunkVolume: Int,
         trunkFullness: Int,
         engineState: CarEngineState,
         windowState: CarWindowState){
        self.passengerSeats = passengerSeats
        super.init(brand: brand, year: year, trunkVolume: trunkVolume, trunkFullness: trunkFullness, engineState: engineState, windowState: windowState)
    }
    
    override func openWindows() {
        print("Окно неисправно, открыть невозможно")
    }
}

var m5BMW = SportCar(maxSpeed: 250, brand: "BMW", year: 2020, trunkVolume: 480, trunkFullness: 10, engineState: .on, windowState: .open)
print(m5BMW.brand)
print(m5BMW.windowState)
print(m5BMW.openWindows())
print(m5BMW.trunkFullness)
m5BMW.addBaggage(baggageWeight: 100)
m5BMW.addBaggage(baggageWeight: 10)

var trunkFord = TrunkCar(passengerSeats: 2, brand: "Ford", year: 2018, trunkVolume: 1480, trunkFullness: 50, engineState: .on, windowState: .close)
print(trunkFord.brand)
print(trunkFord.passengerSeats)
trunkFord.addBaggage(baggageWeight: 200)
print(trunkFord.trunkFullness)
print(trunkFord.windowState)
print(trunkFord.openWindows())
