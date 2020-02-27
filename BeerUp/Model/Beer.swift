//
//  Beer.swift
//  BeerUp
//
//  Created by Maksim Torburg on 26.01.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

struct Beer: Codable, Identifiable {    
    let id: Int
    let name: String
    let label: String
    let style: beerStyle

    enum CodingKeys: String, CodingKey {
        case id     = "bid"
        case name   = "beer_name"
        case label  = "beer_label"
        case style  = "beer_style"
    }

    // FIXME: We can't store style like enum, we can only fetch it from Untappd, and there can be the new one.
    enum beerStyle: String, Codable, CaseIterable {
        case americanIpa = "American IPA"
        case sourFruited = "Sour - Fruited"
        case ipaSour     = "IPA - Sour"
        case hopeIpa     = "Hope - Ipa"
        case lager       = "Lager"
        case weisse      = "Weisse"
        case milkStout   = "Milk Stout"
    }
}

#if DEBUG
//let testData = {
//    return generateBeers()
//}
//func generateBeers() -> [Beer] {
//    var beers = [Beer]()
//    for i in 1...10 {
//        beers.append(Beer(bid: i, beerName: "\(i) Guiness Please"))
//    }
//    return beers
//}
#endif
