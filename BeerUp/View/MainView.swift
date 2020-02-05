//
//  ContentView.swift
//  BeerUp
//
//  Created by Maksim Torburg on 26.01.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var beers = BeerList()
    var colorScheme: ColorScheme = .light
    
    @State var presentingBeerAddForm = false
    @State var presentingAbout = false
    @State var beerName = ""
    @State var anotherOne = ""
    
    var body: some View {
            VStack {
                Button(action: {
//                    self.presentingBeerAddForm.toggle()
                }) {
                    VStack {
                        Image("BeerPlus")
                           .resizable()
                           .frame(width: 200,
                                  height: 200,
                                  alignment: .center)
                        Text("Add Guiness").modifier(TextModifier())
                    }
                }
                .padding([.bottom], 20)
                VStack {
                    Text("Add new beer")
                    Form {
                        TextField("Add a name", text: $beerName)
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Add new item")
                            }
                        }
                        TextField("Another one", text: $anotherOne)
                    }
                }
                List {
                    ForEach(beers.items) { item in
                        HStack{
                            // FIXME: - Check image downloading
                            UrlImage(withURL: item.beer.label)
//                            Image("beer")
                            VStack(alignment: .leading) {
                                Text("\(item.beer.name)").modifier(TextModifier())
                                Text("\(item.brewery.name)")
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    .onDelete(perform: beers.deleteItem)
                }
                Button("About") {
                    self.presentingAbout.toggle()
                }
                .sheet(isPresented: $presentingAbout) {
                    AboutView()
                }
            }
//        .background(Color(.lightGray))
    }
}

// Modifiers
struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
//            .foregroundColor(Color.white)
//            .modifier(Shadow())
    }
}

struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black, radius: 1, x: 1, y: 1)
    }
}

// MARK: - WTF is this?
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        MainView(beers: testData(),colorScheme: .dark)
        MainView()
    }
}
