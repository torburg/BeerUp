//
//  NetworkManager.swift
//  BeerUp
//
//  Created by Maksim Torburg on 06.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

struct NetworkManager {
    static var UserName: String {
        return AuthProperites.properties.value(forKey: "userName") as! String
    }
    static var ClientId: String {
        return AuthProperites.properties.value(forKey: "clientId") as! String
    }
    static var ClientSecret: String {
        return AuthProperites.properties.value(forKey: "clientSecret") as! String
    }
    
    let router = Router<UntappdApi>()
}

fileprivate struct AuthProperites {
    static var properties: NSDictionary {
        if let path = Bundle.main.path(forResource: "AuthDataTorburg", ofType: "plist"),
            let properties = NSDictionary(contentsOfFile: path) {
                return properties
        }
        return [
            "userName": "defaultUser",
            "clientId": "uknown",
            "clientSecret": "uknown"
        ]
    }
}

enum NetworkResponse: String {
    case success
    case authentificationError = "You need to be authorized"
    case badRequest = "Bad request"
    case failed = "Network request failed"
    case noData = "Response has no data"
    case outdated = "The URL you request is outdated"
    case unableToDecode = "Unable to decode response"
}

enum Result<String> {
    case success
    case failure(String)
}

extension NetworkManager {
    func getBeers(completion: @escaping (_ beers: Beers?, _ error: String?)->()) {
        router.request(.beers) { (data, response, error) in
            if error != nil {
                completion(nil, "Please check your network connection")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(UntappdApiResponse.self, from: responseData)
                        completion(apiResponse.beers, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299:
            return .success
        case 401...500:
            return .failure(NetworkResponse.authentificationError.rawValue)
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
