//
//  Beer.swift
//  BeerUp
//
//  Created by Maksim Torburg on 26.01.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

struct Beer: Identifiable {
    var id = UUID()
    
    let bid: Int
    let beerName: String
//    let beerLabel: URL
//    let beerAbv: Double
//    let beerIbu: Int
//    let beerSlug: String
//    let beerStyle: String
//    let beer_description: String
//    let createdAt: Date
//    let authRating: Double
//    let wishList: Bool
//    let ratingScore: Double
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
