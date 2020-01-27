//
//  ContentView.swift
//  BeerUp
//
//  Created by Maksim Torburg on 26.01.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var beers: [Beer] = testData()
    var colorScheme: ColorScheme = .light
    
    @State var presentingBeerAddForm = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.presentingBeerAddForm.toggle()
            }) {
                Text("Add Guiness")
            }
            .padding([.top, .bottom], 100)
            .alert(isPresented: self.$presentingBeerAddForm) {
                Alert(title: Text("One more Guiness?"),
                      message: Text("New Guiness!"),
                      dismissButton: .destructive(Text("Absolutely")))
            }
            List(beers) { beer in
                Image(systemName: "photo")
                VStack(alignment: .leading) {
                    Text("Hello, Beer User!")
                    Text("New text")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text("\(beer.bid)")
                    Text("\(beer.beerName)")
                }
            }
        }
    }
}

// MARK: - WTF is this?
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(beers: testData(),colorScheme: .dark)
    }
}
