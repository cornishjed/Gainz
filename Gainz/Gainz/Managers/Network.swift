//
//  Network.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 02/05/2022.
//  Modified source code: https://medium.com/macoclock/simple-async-api-request-with-swift-5-result-type-in-swiftui-d45e2ea04a7d

import Foundation

class Network {
    
    var settings = Settings()
    
    func getQuotes(completion: @escaping (Result<[Quote], Error>) -> Void) {
        guard let url = URL(string: "https://zenquotes.io/api/random") else {
            print("Invalid URL"); return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            
            do {
                let quotes = try! JSONDecoder().decode([Quote].self, from: data!)
                completion(.success(quotes))
                self.settings.setQuoteBody(qb: quotes[0].q)
                self.settings.setQuoteAuthor(qa: quotes[0].a)
                print(quotes)
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
}
