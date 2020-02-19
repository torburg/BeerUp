//
//  ContentView.swift
//  BeerUp
//
//  Created by Maksim Torburg on 26.01.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    init() {
//        UITabBar.appearance().backgroundColor = UIColor(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    var body: some View {
        ZStack {
//            Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
//                .edgesIgnoringSafeArea(.all)
            TabView {
                BeerListView()
                    .tabItem({
                        Image(systemName: "list.bullet")
                        Text("Beers")
                    })
//                .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))

                StatisticsView()
                    .tabItem({
                        Image(systemName: "person.crop.circle")
                        Text("Statistics")
                    })
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        MainView(beers: testData(),colorScheme: .dark)
        MainView()
    }
}
