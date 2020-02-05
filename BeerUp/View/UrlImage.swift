//
//  UrlImage.swift
//  BeerUp
//
//  Created by Maksim Torburg on 05.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct UrlImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage(named: "beer") ?? UIImage(systemName: "photo") ?? UIImage()
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString: url)
    }

    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .frame(width: 50,
                       height: 50,
                       alignment: .center)
                .clipShape(Circle())
        }.onReceive(imageLoader.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
