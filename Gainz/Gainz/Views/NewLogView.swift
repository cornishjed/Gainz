//
//  NewLogView.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 18/03/2022.
//

import SwiftUI

struct NewLogView: View {
    
    @State private var weight: Float = 0.0
    @State private var reps = 0
    @State var saved: Bool = false
    
    let exercise: Exercise
    
    var settings = Settings()
    var stats = ExerciseStats()
    
    var body: some View {
        VStack {
            if exercise.bodyWeight {
                Image("bodyweight")
                    .padding()
            }
            else {
                Image("barbell")
                    .resizable()
                    .padding()
            }
            Spacer()
            if !exercise.bodyWeight {
                Stepper("Total weight lifted:\n\(String(format: "%0.2f", weight))kg", value: $weight, in: 0...200, step: 0.25)
                    .padding()
            }
            Stepper("Rep count:                                 \(reps)", value: $reps, in: 0...200)
                .padding()
            Spacer()
            if !saved {
                HStack {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.blue)
                    Button("Add entry") {
                        settings.setExerciseData(exercise: exercise, weight: weight, repCount: reps)
                        saved = true
                    }
                }
            }
            else {
                Text("Entry submitted.")
            }
        }
        .navigationTitle("New Log")
        .onAppear() {
            weight = stats.getMaxWeight(name: exercise.name, settings: settings)
            reps = stats.getMaxRepCount(name: exercise.name, weight: weight, settings: settings)
        }
        .padding()
    }
}

struct NewLogView_Previews: PreviewProvider {
    static var previews: some View {
        NewLogView(exercise: exercises[0])
    }
}
