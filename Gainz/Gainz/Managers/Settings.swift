//
//  Settings.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 02/05/2022.
//

import Foundation

class Settings: ObservableObject {
    
    func setQuoteBody(qb: String) {
        UserDefaults.standard.set(qb, forKey: "quoteBody")
    }
    
    func setQuoteAuthor(qa: String) {
        UserDefaults.standard.set(qa, forKey: "quoteAuthor")
    }
    
    func setExerciseData(name: String, weight: Float, repCount: Int, bodyWeight: Bool) {
        let id = UUID().uuidString
        var names = getExerciseNames()
        var weights = getExerciseWeights()
        var reps = getExerciseReps()
        var exerciseType = getExerciseType()
        var logDates = getLogDate()
        
        names[id] = name
        weights[id] = weight
        reps[id] = repCount
        exerciseType[id] = bodyWeight
        
        // source: https://stackoverflow.com/questions/55776143/how-to-store-date-in-userdefaults
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        let logDate = df.string(from: Date())
        // source end
        
        logDates[id] = logDate
        
        UserDefaults.standard.set(names, forKey: "exerciseNames")
        UserDefaults.standard.set(weights, forKey: "exerciseWeights")
        UserDefaults.standard.set(reps, forKey: "exerciseReps")
        UserDefaults.standard.set(exerciseType, forKey: "exerciseType")
        UserDefaults.standard.set(logDates, forKey: "logDate")
    }
    
    func setExerciseData(exercise: Exercise, weight: Float, repCount: Int) {
        let id = UUID().uuidString
        var names = getExerciseNames()
        var weights = getExerciseWeights()
        var reps = getExerciseReps()
        var exerciseType = getExerciseType()
        var logDates = getLogDate()
        
        names[id] = exercise.name
        weights[id] = weight
        reps[id] = repCount
        exerciseType[id] = exercise.bodyWeight
        
        // source: https://stackoverflow.com/questions/55776143/how-to-store-date-in-userdefaults
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        let logDate = df.string(from: Date())
        // source end
        
        logDates[id] = logDate
        
        UserDefaults.standard.set(names, forKey: "exerciseNames")
        UserDefaults.standard.set(weights, forKey: "exerciseWeights")
        UserDefaults.standard.set(reps, forKey: "exerciseReps")
        UserDefaults.standard.set(exerciseType, forKey: "exerciseType")
        UserDefaults.standard.set(logDates, forKey: "logDate")
    }
    
    func getQuoteBody() -> String {
        return UserDefaults.standard.string(forKey: "quoteBody") ?? ""
    }
    
    func getQuoteAuthor() -> String {
        return UserDefaults.standard.string(forKey: "quoteAuthor") ?? ""
    }
    
    func getExerciseNames() -> Dictionary<String, String> {
        let names = UserDefaults.standard.object(forKey: "exerciseNames") as? [String: String] ?? [:]
        return names
    }
    
    func getExerciseWeights() -> Dictionary<String, Float> {
        let weights = UserDefaults.standard.object(forKey: "exerciseWeights") as? [String: Float] ?? [:]
        return weights
    }
    
    func getExerciseReps() -> Dictionary<String, Int> {
        let reps = UserDefaults.standard.object(forKey: "exerciseReps") as? [String: Int] ?? [:]
        return reps
    }
    
    func getExerciseType() -> Dictionary<String, Bool> {
        let type = UserDefaults.standard.object(forKey: "exerciseType") as? [String: Bool] ?? [:]
        return type
    }
    
    func getLogDate() -> Dictionary<String, String> {
        let logDates = UserDefaults.standard.object(forKey: "logDate") as? [String: String] ?? [:]
        return logDates
    }
    
    func getExerciseData() -> [Exercise] {
        let names = getExerciseNames()
        let weights = getExerciseWeights()
        let reps = getExerciseReps()
        let exerciseType = getExerciseType()
        let logDates = getLogDate()
        
        var exerciseData = exerciseSample
        var exerciseDataArray: [Exercise] = []
        
        if !names.isEmpty {
            for x in 0...names.count - 1 {
                exerciseData.id = Array(names)[x].key
                exerciseData.name = names[exerciseData.id]!
                exerciseData.bodyWeight = exerciseType[exerciseData.id]!
                exerciseData.weight = weights[exerciseData.id]!
                exerciseData.reps = reps[exerciseData.id]!
                exerciseData.logDate = logDates[exerciseData.id]!
                
                exerciseDataArray.append(exerciseData)
            }
        }
        
        return exerciseDataArray
        
    }
    
    func getExerciseData(name: String) -> [Exercise] {
        let names = getExerciseNames()
        let weights = getExerciseWeights()
        let reps = getExerciseReps()
        let exerciseType = getExerciseType()
        let logDates = getLogDate()
        
        var exerciseData = exerciseSample
        var exerciseDataArray: [Exercise] = []
        
        if names.isEmpty {
            return []
        }
        else {
            for x in 0...names.count - 1 {
                if Array(names)[x].value == name {
                    exerciseData.id = Array(names)[x].key
                    exerciseData.name = names[exerciseData.id]!
                    exerciseData.bodyWeight = exerciseType[exerciseData.id]!
                    exerciseData.weight = weights[exerciseData.id]!
                    exerciseData.reps = reps[exerciseData.id]!
                    exerciseData.logDate = logDates[exerciseData.id]!
                    
                    exerciseDataArray.append(exerciseData)
                }
            }
        }
        
        return exerciseDataArray
        
    }
    
    func deleteExercise(name: String) {
        let exerciseData = getExerciseData(name: name)
        var ids: [String] = []
        
        for x in 0...exerciseData.count - 1 {
            ids.append(exerciseData[x].id)
        }
        
        var names = getExerciseNames()
        var weights = getExerciseWeights()
        var reps = getExerciseReps()
        var exerciseType = getExerciseType()
        var logDates = getLogDate()
        
        for x in 0...ids.count - 1 {
            names.removeValue(forKey: ids[x])
            weights.removeValue(forKey: ids[x])
            reps.removeValue(forKey: ids[x])
            exerciseType.removeValue(forKey: ids[x])
            logDates.removeValue(forKey: ids[x])
        }
        
        UserDefaults.standard.set(names, forKey: "exerciseNames")
        UserDefaults.standard.set(weights, forKey: "exerciseWeights")
        UserDefaults.standard.set(reps, forKey: "exerciseReps")
        UserDefaults.standard.set(exerciseType, forKey: "exerciseType")
        UserDefaults.standard.set(logDates, forKey: "logDate")
        
    }
    
}

// https://swiftwombat.com/how-to-store-a-date-using-appstorage-in-swiftui/
// To enable Date() use with @AppStorage

extension Date: RawRepresentable {
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
}
