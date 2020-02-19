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
//    let fetcher = BeerFetcher()
    
    init() {
//        self.items = fetcher.items
        items = generateBeers()
    }
    
    func deleteItem(whichElement: IndexSet){
        items.remove(atOffsets: whichElement)
    }

    func sortedById() -> [[Item]] {
        var result = [[Item]]()
        let less10pull = items.filter { $0.beer.id < 10 }
        result.append(less10pull)
        let from10to20pull = items.filter { $0.beer.id >= 10 && $0.beer.id < 20 }
        result.append(from10to20pull)
        let above20pull = items.filter { $0.beer.id >= 20 }
        result.append(above20pull)
        return result
    }

    func getBeerStyles(in segment: Int) -> [String] {
        var styles = [String : Int]()
        let beersBySegment = self.sortedById()[segment]
        for item in beersBySegment {
            let styleName = item.beer.style
            if styles.contains(where: { (key, _) in
                key == styleName
            }) {
                styles[styleName]! += 1
            } else {
                styles[styleName] = 1
            }
        }
        // Need to sort to display styles in list by their frequency
        let stylesSorted = styles.sorted { $0.value > $1.value }
        var result = [String]()
        for (style, _) in stylesSorted {
            result.append(style)
        }
        return result
    }
}

fileprivate func generateBeers() -> [Item] {
    var items = [Item]()
    for i in 1...25 {
        items.append(
            Item(firstCheckinId: i,
                 beer: Beer(id: i - 1, name: "\(i) Guiness", label: "Label \(i)", style: Beer.beerStyles.randomElement()! ),
                 brewery: Brewery(name: "\(i) Brewery")
            )
        )
    }
    return items
}
