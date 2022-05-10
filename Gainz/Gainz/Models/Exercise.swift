//
//  Exercise.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 18/03/2022.
//

import Foundation

// timestrained and maxWeight to be workout out from archive data

struct Exercise: Identifiable, Equatable{
    var id = UUID().uuidString
    var name: String
    var bodyWeight: Bool
    var weight: Float
    var reps: Int
    var logDate: String
    
    init(name: String, bodyWeight: Bool, weight: Float, reps: Int) {
        self.name = ""
        self.bodyWeight = false
        self.weight = 0.0
        self.reps = 0
        self.logDate = ""
    }
    
    // source: https://stackoverflow.com/questions/42304150/remove-duplicated-in-a-struct-array
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name == rhs.name
    }
    
    func unique(exercises: [Exercise]) -> [Exercise] {
        
        var uniqueExercises = [Exercise]()
        
        for exercise in exercises {
            if !uniqueExercises.contains(exercise) {
                uniqueExercises.append(exercise)
            }
        }
        
        return uniqueExercises
    }
    //source end
    
}

let exercises = [
    Exercise(name: "Bench Press", bodyWeight: false, weight: 35, reps: 12),
    Exercise(name: "Deadlift", bodyWeight: false, weight: 60, reps: 5)
]

let exerciseSample = Exercise(name: "Bench Press", bodyWeight: false, weight: 35, reps: 12)

let newExercise = Exercise(name: "", bodyWeight: false, weight: 0, reps: 0)
