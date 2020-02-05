//
//  BeerFetcher.swift
//  BeerUp
//
//  Created by Maksim Torburg on 04.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

class BeerFetcher: ObservableObject {
    @Published var items = [Item]()
    let domainName = "https://api.untappd.com/"
    let apiEndpoint = "v4/user/beers/"
    let userName: String
    let clientId: String
    let clientSecret: String
//    let properties = Preferences()
    
    init() {
        if let path = Bundle.main.path(forResource: "AuthDataTorburg", ofType: "plist"),
            let properties = NSDictionary(contentsOfFile: path) {
                self.userName = properties["userName"] as! String
                self.clientId = properties["clientId"] as! String
                self.clientSecret = properties["clientSecret"] as! String
        } else {
            self.userName = "userName"
            self.clientId = "clientId"
            self.clientSecret = "clientSecret"
        }
        load()
    }
    
    func load() {
        guard let url = getURL() else {
            return
        }
        if let data = performStoreRequest(with: url) {
            print("Recieve JSON String: \(data)")
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(SearchResult.self, from: data)
                items = result.response.beers.items
              } catch {
                  print("JSON Error: \(error)")
                  items = []
            }
        }
        
    }
    
    func getURL() -> URL? {
        guard let urlString = "\(domainName)\(apiEndpoint)\(userName)?client_id=\(clientId)&client_secret=\(clientSecret)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlString) else {
                return nil
        }
        return url
    }
    
    func performStoreRequest(with url: URL) -> Data? {
        do {
            return try Data(contentsOf: url)
        } catch {
            print("Download Error: \(error.localizedDescription)")
            return nil
        }
    }
}

