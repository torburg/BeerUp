//
//  BeerList.swift
//  BeerUp
//
//  Created by Maksim Torburg on 29.01.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

class BeerList: ObservableObject {
    @Published var items: [Beer]
    
    init() {
        items = generateBeers()
    }
    
    func deleteItem(whichElement: IndexSet){
        items.remove(atOffsets: whichElement)
    }
}

fileprivate func generateBeers() -> [Beer] {
   var beers = [Beer]()
   for i in 1...10 {
       beers.append(Beer(bid: i, beerName: "\(i) Guiness Please"))
   }
   return beers
}
