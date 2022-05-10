//
//  ExerciseStats.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 08/05/2022.
//

import Foundation

class ExerciseStats: ObservableObject {
    
    func getCurrentWeight(name: String, settings: Settings) -> Float {
        
        let exerciseData = settings.getExerciseData(name: name)
        var latestDate = ""
        var currentWeight: Float = 0.0
        
        if exerciseData.isEmpty {
            return 0
        }
        else {
            for x in 0...exerciseData.count - 1 {
                if exerciseData[x].logDate > latestDate {
                    latestDate = exerciseData[x].logDate
                    currentWeight = exerciseData[x].weight
                }
            }
        }
        
        return currentWeight
        
    }
    
    func getMaxWeight(name: String, settings: Settings) -> Float {
        
        let exerciseData = settings.getExerciseData(name: name)
        var maxWeight: Float = 0.0
        
        if exerciseData.isEmpty {
            return 0
        }
        else {
            for x in 0...exerciseData.count - 1 {
                if exerciseData[x].weight > maxWeight {
                    maxWeight = exerciseData[x].weight
                }
            }
        }
        
        return maxWeight
        
    }
    
    func getLastTimeTrained(name: String, settings: Settings) -> String {
        
        let exerciseData = settings.getExerciseData(name: name)
        var latestExercise = exerciseSample
        
        if exerciseData.isEmpty {
            return ""
        }
        else {
            for x in 0...exerciseData.count - 1 {
                if exerciseData[x].logDate > latestExercise.logDate {
                    latestExercise = exerciseData[x]
                }
            }
        }
        
        return latestExercise.logDate
        
    }
    
    func getTimesTrained(name: String, settings: Settings) -> Int {
        
        let exerciseData = settings.getExerciseData(name: name)
        return exerciseData.count
        
    }
    
    func getCurrentRepCount(name: String, settings: Settings) -> Int {
        
        let exerciseData = settings.getExerciseData(name: name)
        var latestDate = ""
        var currentRepCount: Int = 0
        
        if exerciseData.isEmpty {
            return 0
        }
        for x in 0...exerciseData.count - 1 {
            if exerciseData[x].logDate > latestDate {
                latestDate = exerciseData[x].logDate
                currentRepCount = exerciseData[x].reps
            }
        }
        
        return currentRepCount
        
    }
    
    func getMaxRepCount(name: String, weight: Float, settings: Settings) -> Int {
        
        let exerciseData = settings.getExerciseData(name: name)
        var maxRepCount: Int = 0
        
        if exerciseData.isEmpty {
            return 0
        }
        for x in 0...exerciseData.count - 1 {
            if (exerciseData[x].reps > maxRepCount) && (exerciseData[x].weight == weight) {
                maxRepCount = exerciseData[x].reps
            }
        }
        
        return maxRepCount
        
    }
    
    func getWeightIDs(name: String, settings: Settings) -> [String: Float] {
        
        let exerciseData = settings.getExerciseData(name: name)
        var weightIDs: [String: Float] = ["": 0.0]
        
        if exerciseData.isEmpty {
            return [:]
        }
        for x in 0...exerciseData.count - 1 {
            weightIDs[exerciseData[x].id] = exerciseData[x].weight
        }
        
        return weightIDs
        
    }
    
    func getDateLogIDs(name: String, settings: Settings) -> [String: String] {
        
        let exerciseData = settings.getExerciseData(name: name)
        var dateLogIDs = ["": ""]
        
        if exerciseData.isEmpty {
            return [:]
        }
        for x in 0...exerciseData.count - 1 {
            dateLogIDs[exerciseData[x].id] = exerciseData[x].logDate
        }
        
        return dateLogIDs
        
    }
    
    // was going to use getOrderedWeightData() for graph points
    
    func getOrderedWeightData(name: String, settings: Settings) -> [Float] {
        let weights = getWeightIDs(name: name, settings: settings).sorted(by: <)
        let logDates = getDateLogIDs(name: name, settings: settings).sorted(by: <)
        
        var orderedWeights: [Float] = [0.0]
        
        let count = logDates.count - 1
        var x = 0
        
        while x < count {
            if weights[x].key == logDates[x].key {
                orderedWeights.append(weights[x].value)
                x = x + 1
            }
        }
        
        return orderedWeights
    }
    
}
