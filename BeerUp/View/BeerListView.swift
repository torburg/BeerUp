//
//  BeerListView.swift
//  BeerUp
//
//  Created by Maksim Torburg on 11.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import SwiftUI

struct BeerListView: View {

    @ObservedObject var beers = BeerList()
    var colorScheme: ColorScheme = .light

    @State var presentingBeerAddForm = false
    @State var presentingAbout = false
    @State var beerName = ""
    @State var anotherOne = ""

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
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
                .padding([.top, .bottom], 25)
                Spacer()
                VStack {
                    Button(action: {
                        self.presentingAbout.toggle()
                    }) {
                        Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .topTrailing)
                    }
                    .padding([.trailing, .top], 25)
                    .sheet(isPresented: $presentingAbout) {
                        AboutView()
                    }
                    Spacer()
                }
            }
//            VStack {
//                Text("Add new beer")
//                Form {
//                    TextField("Add a name", text: $beerName)
//                    Button(action: {
//
//                    }) {
//                        HStack {
//                            Image(systemName: "plus.circle.fill")
//                            Text("Add new item")
//                        }
//                    }
//                    TextField("Another one", text: $anotherOne)
//                }
//            }
            List {
                ForEach(beers.items) { item in
                    HStack{
                        // FIXME: - Check image downloading
                        UrlImage(withURL: item.beer.label)
                        VStack(alignment: .leading) {
                            Text("\(item.beer.name)").modifier(TextModifier())
                            Text("\(item.brewery.name)")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            Text("\(item.beer.style.rawValue)")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                        }
                    }
                }
                .onDelete(perform: beers.deleteItem)
            }
        }
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

struct BeerListView_Preview: PreviewProvider {

    static var previews: some View {
        BeerListView()
    }
}
