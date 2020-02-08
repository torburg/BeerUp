//
//  HTTPTask.swift
//  BeerUp
//
//  Created by Maksim Torburg on 06.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    
    case requestParameters(
        bodyParameters: Parameters?,
        urlParameters: Parameters?
    )
    
    case requestParametersAndHeaders(
        bodyParameters: Parameters?,
        urlParameters: Parameters?,
        additionalParameters: HTTPHeaders?
    )
}

