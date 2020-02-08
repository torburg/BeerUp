//
//  NetworkRouter.swift
//  BeerUp
//
//  Created by Maksim Torburg on 06.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
