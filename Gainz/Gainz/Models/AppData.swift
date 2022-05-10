//
//  AppData.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 02/05/2022.
//

import SwiftUI

public class AppData: ObservableObject {
    
    @Published private var quote: String {
        didSet {
            UserDefaults.standard.set(quote, forKey: "quote")
        }
    }
    
    @Published private var exerciseNames: Dictionary<String, String> {
        didSet {
            UserDefaults.standard.set(exerciseNames, forKey: "exerciseNames")
        }
    }
    
    @Published private var exerciseWeights: Dictionary<String, Float> {
        didSet {
            UserDefaults.standard.set(exerciseWeights, forKey: "exerciseWeights")
        }
    }
    
    @Published private var exerciseReps: Dictionary<String, Int> {
        didSet {
            UserDefaults.standard.set(exerciseReps, forKey: "exerciseReps")
        }
    }
    
    @Published private var exerciseType: Dictionary<String, Bool> {
        didSet {
            UserDefaults.standard.set(exerciseType, forKey: "exerciseType")
        }
    }
    
    @Published private var logDate: Dictionary<String, Date> {
        didSet {
            UserDefaults.standard.set(logDate, forKey: "logDate")
        }
    }
    
    init() {
        if let quote = UserDefaults.standard.object(forKey: "quote") as? String {
            self.quote = quote
        } else {
            self.quote = ""
        }
        
        if let exerciseNames = UserDefaults.standard.object(forKey: "exerciseNames") as? Dictionary<String, String> {
            self.exerciseNames = exerciseNames
        } else {
            self.exerciseNames = [:]
        }
        
        if let exerciseWeights = UserDefaults.standard.object(forKey: "exerciseWeights") as? Dictionary<String, Float> {
            self.exerciseWeights = exerciseWeights
        } else {
            self.exerciseWeights = [:]
        }
        
        if let exerciseReps = UserDefaults.standard.object(forKey: "exerciseReps") as? Dictionary<String, Int> {
            self.exerciseReps = exerciseReps
        } else {
            self.exerciseReps = [:]
        }
        
        if let exerciseType = UserDefaults.standard.object(forKey: "exerciseType") as? Dictionary<String, Bool> {
            self.exerciseType = exerciseType
        } else {
            self.exerciseType = [:]
        }
        
        if let exerciseType = UserDefaults.standard.object(forKey: "exerciseType") as? Dictionary<String, Bool> {
            self.exerciseType = exerciseType
        } else {
            self.exerciseType = [:]
        }
        
        if let logDate = UserDefaults.standard.object(forKey: "logDate") as? Dictionary<String, Date> {
            self.logDate = logDate
        } else {
            self.logDate = [:]
        }
        
    }
}
