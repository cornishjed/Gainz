//
//  NewExerciseView.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 18/03/2022.
//

import SwiftUI

struct NewExerciseView: View {
    
    @State var name: String
    @State var bodyWeight: Bool
    @State var weight: Float
    @State var repCount: Int
    @State var saved: Bool = false
    var settings = Settings()
    
    var body: some View {
        VStack {
            Toggle("Bodyweight exercise", isOn: $bodyWeight)
            Spacer()
            if bodyWeight {
                Image("bodyweight")
                    .resizable()
                    .fixedSize()
                    .padding()
            }
            else {
                Image("barbell")
                    .resizable()
                    .padding()
            }
            HStack {
                Text("Name:")
                TextField("exercise name..", text: $name)
            }
            if !bodyWeight {
                HStack {
                    Text("Weight per rep: ")
                    TextField("e.g. 12.5", value: $weight, format: .number).keyboardType(.decimalPad)
                }
            }
            HStack {
                Text("Rep count: ")
                TextField("e.g. 12", value: $repCount, format: .number)
                    .keyboardType(.decimalPad)
            }
            Spacer()
            HStack {
                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                if !saved {
                    Button("Add new exercise") {
                        settings.setExerciseData(name: name, weight: weight, repCount: repCount, bodyWeight: bodyWeight)
                        saved = true
                    }
                    .foregroundColor(.blue)
                    .disabled(repCount == 0)
                }
                else {
                    Text("Entry submitted.")
                }
            }
        }
        .padding()
        .navigationTitle("New Exercise")
    }
}

struct NewExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NewExerciseView(name: "", bodyWeight: false, weight: 0.0, repCount: 0)
    }
}

