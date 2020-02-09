//
//  ImageLoader.swift
//  BeerUp
//
//  Created by Maksim Torburg on 05.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var data: Data?

    init(urlString: String) { 
        guard let url = URL(string: urlString) else { print("empty url"); return }
        print("before task created")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print("task created")
            guard let data = data else { print("empty publisher data"); return }
            DispatchQueue.main.async {
                print("dispatch")
                self.data = data
            }
        }
        task.resume()
    }
}
