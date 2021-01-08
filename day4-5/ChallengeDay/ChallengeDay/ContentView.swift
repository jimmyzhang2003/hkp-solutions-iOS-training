//
//  ContentView.swift
//  ChallengeDay
//
//  Created by Jimmy Zhang on 1/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let units = ["Celsius", "Farenheit", "Kelvin"]
    
    //define function to convert everything to celsius (makes calculation easier)
    func convertToCelsius(value: Double, unit: String) -> Double {
        switch unit {
        case "Celsius":
            return value
        case "Kelvin":
            return value - 273
        case "Farenheit":
            return (5/9)*(value-32)
        default:
            return 0.0
        }
        
    }
    
    //calculate output
    var outputNumber: Double {
        let input = Double(inputNumber) ?? 0.0
        let outUnit = units[outputUnit]
        let celciusVal = convertToCelsius(value: input, unit: units[inputUnit]) //convert input to celsius
        
        switch outUnit {
        case "Celsius":
            return celciusVal
        case "Kelvin":
            return celciusVal + 273
        case "Farenheit":
            return (9/5)*celciusVal + 32
        default:
            return 0.0
        }
    }
   
    
    var body: some View {
        NavigationView {
            Form {
                //segmented picker to select input unit
                Section(header: Text("Your input unit:")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                //segmented picker to select output unit
                Section(header: Text("Your output unit:")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                //text field to input number
                Section {
                    TextField("Input Number", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                
                //text view to display output number
                Section(header: Text("Converted Temperature")) {
                    Text("\(outputNumber, specifier: "%.2f") degrees \(units[outputUnit])")
                }
            }
            .navigationBarTitle("Temperature Converter")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
