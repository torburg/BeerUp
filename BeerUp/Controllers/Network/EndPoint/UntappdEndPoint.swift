//
//  UntappdEndPoint.swift
//  BeerUp
//
//  Created by Maksim Torburg on 06.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

public enum UntappdApi {
    case info
    case beers
    case badges
}

extension UntappdApi: EndPointType {

    var baseURL: URL {
        guard let url = URL(string: "https://api.untappd.com/v4/user/") else {
            fatalError("Couldn't configure base URL")
        }
        return url
    }

    var path: String {
        switch self {
        case .info:
            return "info"
        case .beers:
            return "beers"
        case .badges:
            return "badges"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .beers:
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: [
                                        "client_id": NetworkManager.ClientId,
                                        "client_secret": NetworkManager.ClientSecret
            ])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
