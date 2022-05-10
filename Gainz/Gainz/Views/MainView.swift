//
//  MainView.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 15/03/2022.
//

import SwiftUI

struct MainView: View {
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        //  Source: https://blog.techchee.com/navigation-bar-title-style-color-and-custom-back-button-in-swiftui/
        Theme.navigationBarColors(background: .purple, titleColor: .white)
    }
    
    var settings = Settings()
    @State var exerciseData: [Exercise] = []
    
    var body: some View {
        ZStack {
            VStack {
                List (exerciseData) {
                    exercise in
                    NavigationLink(destination: DetailView(exercise: exercise)) {
                        ExerciseRow(exercise: exercise)
                    }
                    .listRowBackground(Color.clear)
                    .foregroundColor(.white)
                }
                HStack {
                    NavigationLink(destination: NewExerciseView(name: "", bodyWeight: false, weight: Float(), repCount: Int()),  label: {
                        Image(systemName: "plus.circle")
                        Text("Add exercise")
                            .foregroundColor(.blue)
                    })
                }
            }
            .accentColor(.white)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Exercises")
        .background(Image("background")
                        .resizable(resizingMode: .stretch)
                        .ignoresSafeArea()
        )
        .onAppear() {
            let exercise = exerciseSample
            exerciseData = settings.getExerciseData()
            exerciseData = exercise.unique(exercises: exerciseData)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct ExerciseRow: View {
    let exercise: Exercise
    let settings = Settings()
    
    var body: some View {
        HStack {
            Text(exercise.name)
                .font(.title)
                .padding(.trailing)
        }
    }
}
