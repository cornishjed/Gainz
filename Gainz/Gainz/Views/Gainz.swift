//
//  StengthTrainingAppApp.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 15/03/2022.
//

import SwiftUI

@main
struct Gainz: App {
    
    @State var quotes = [Quote]()
    @State var settings = Settings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear() {
                    getQuotesData()
                }
        }
    }
}

extension Gainz {
    func getQuotesData() {
        Network().getQuotes { (result) in
            switch result {
            case .success(let quotes):
                DispatchQueue.main.async {
                    self.quotes = quotes
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
