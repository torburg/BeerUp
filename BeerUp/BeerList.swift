//
//  BeerList.swift
//  BeerUp
//
//  Created by Maksim Torburg on 29.01.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

class BeerList: ObservableObject {
    @Published var items: [Item]
    let fetcher = BeerFetcher()
    
    init() {
        self.items = fetcher.items
//        items = generateBeers()
    }
    
    func deleteItem(whichElement: IndexSet){
        items.remove(atOffsets: whichElement)
    }
}

fileprivate func generateBeers() -> [Beer] {
   var beers = [Beer]()
   for i in 1...10 {
    beers.append(Beer(id: i, name: "\(i) Guiness Please", label: ""))
   }
   return beers
}
