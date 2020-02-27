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
        let less10pull = items.filter { $0.beer.id < 25 }
        result.append(less10pull)
        let from10to20pull = items.filter { $0.beer.id >= 25 && $0.beer.id < 50 }
        result.append(from10to20pull)
        let from50to75pull = items.filter { $0.beer.id >= 50 && $0.beer.id < 75 }
        result.append(from50to75pull)
        let above75pull = items.filter { $0.beer.id >= 75 }
        result.append(above75pull)
        return result
    }

    func beerStylesSorted(by segment: Int) -> [(key: Beer.beerStyle, value: Int)] {
        var styles = [Beer.beerStyle : Int]()
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
        let stylesSorted = styles
            .sorted {
                if ($0.1 == $1.1) {
                    return $0.0.rawValue.lowercased() < $1.0.rawValue.lowercased()
                }
                return $0.1 > $1.1
            }
        return stylesSorted
    }

    func getBeerStyles(in segment: Int) -> [Beer.beerStyle] {
        var result = [Beer.beerStyle]()
        for (style, _) in beerStylesSorted(by: segment) {
            result.append(style)
        }
        return result
    }
}

fileprivate func generateBeers() -> [Item] {
    var items = [Item]()
    for i in 1...100 {
        items.append(
            Item(firstCheckinId: i,
                 beer: Beer(id: i - 1,
                            name: "\(i) Guiness",
                            label: "Label \(i)",
                    style: Beer.beerStyle.allCases.randomElement()!),
                 brewery: Brewery(name: "\(i) Brewery")
            )
        )
    }
    return items
}
