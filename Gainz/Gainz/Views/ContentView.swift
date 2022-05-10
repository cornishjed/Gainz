//
//  ContentView.swift
//  StengthTrainingApp
//
//  Created by Jed Powell on 15/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State var settings = Settings()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable(resizingMode: .stretch)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    ZStack {
                        NavigationLink (destination: MainView()) {
                            Image("logo")
                        }
                        Text("GAINZ")
                            .foregroundColor(.gray)
                            .font(Font.system(size: 90).weight(.bold))
                            .background(.black)
                    }
                    Spacer()
                    Text("Inspiring Words:")
                        .font(.title2)
                    Spacer()
                    Text("\"" + settings.getQuoteBody() + "\" - " + settings.getQuoteAuthor())
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0.0, leading: 20.0, bottom: 100.0, trailing: 20.0))
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
