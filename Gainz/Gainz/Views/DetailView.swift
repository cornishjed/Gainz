//
//  DetailView.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 18/03/2022.
//
//  Graphs would be in place of the images

import SwiftUI

struct DetailView: View {
    
    var exercise: Exercise
    var stats = ExerciseStats()
    var settings = Settings()
    @State var exerciseData: [Exercise] = []
    @State var deleted = false
    @State var showDataLog = false
    
    var body: some View {
        if !deleted {
            VStack {
                Toggle("Show datalog", isOn: $showDataLog)
                    .padding()
                if showDataLog && exercise.bodyWeight {
                    List (exerciseData) {
                        exercise in
                            DataLogBW(exercise: exercise)
                    }
                }
                else if showDataLog && !exercise.bodyWeight {
                    List (exerciseData) {
                        exercise in
                            DataLog(exercise: exercise)
                    }
                }
                else if exercise.bodyWeight {
                    Image("bodyweight")
                        .resizable()
                        .padding()
                }
                else {
                    Image("barbell")
                        .resizable()
                        .padding()
                }
                if !exercise.bodyWeight {
                    List {
                        Text(String(format: "Current Weight: %.2fkg", stats.getCurrentWeight(name: exercise.name, settings: settings)))
                        Text(String(format: "Max Weight: %.2fkg", stats.getMaxWeight(name: exercise.name, settings: settings)))
                        Text("Last performed: \(stats.getLastTimeTrained(name: exercise.name, settings: settings))")
                        Text("Times performed: \(stats.getTimesTrained(name: exercise.name, settings: settings))")
                    }
                }
                else {
                    List {
                        Text("Current Rep Count: \(stats.getCurrentRepCount(name: exercise.name, settings: settings))")
                        Text("Max Rep Count: \(stats.getMaxRepCount(name: exercise.name, weight: exercise.weight, settings: settings))")
                        Text("Last performed: \(stats.getLastTimeTrained(name: exercise.name, settings: settings))")
                        Text("Times performed: \(stats.getTimesTrained(name: exercise.name, settings: settings))")
                    }
                }
                Spacer()
                HStack {
                    NavigationLink(destination: NewLogView(exercise: exercise)) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.blue)
                        Text("Create new log")
                    }
                }
                HStack {
                    Image(systemName: "trash")
                        .foregroundColor(.blue)
                    Button("Delete") {
                        settings.deleteExercise(name: exercise.name)
                        self.deleted = true
                    }
                }
                .padding()
            }
            .navigationTitle(exercise.name)
            .onAppear() {
                exerciseData = settings.getExerciseData(name: exercise.name)
            }
        }
        else {
            Image(systemName: "checkmark.square")
                .padding()
                .foregroundColor(.blue)
            Text("Exercise deleted")
        }
        
    }
}

struct DataLog: View {
    let exercise: Exercise
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Date")
                    .underline()
                Text(exercise.logDate)
            }
            Spacer()
            VStack {
                Text("Weight")
                    .underline()
                Text(String(format: "%.2f kg", exercise.weight))
            }
            VStack {
                Text("Rep count")
                    .underline()
                Text("\(exercise.reps)")
            }
            Spacer()
        }
    }
}

struct DataLogBW: View {
    let exercise: Exercise
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Date")
                    .underline()
                Text(exercise.logDate)
            }
            Spacer()
            VStack {
                Text("Rep count")
                    .underline()
                Text("\(exercise.reps)")
            }
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(exercise: exerciseSample)
    }
}
