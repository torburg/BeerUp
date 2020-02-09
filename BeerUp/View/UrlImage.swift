//
//  UrlImage.swift
//  BeerUp
//
//  Created by Maksim Torburg on 05.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation
import SwiftUI

struct UrlImage: View {
    
    private var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }

    var body: some View {
        VStack {
            Image(uiImage: (imageLoader.data != nil) ? UIImage(data: imageLoader.data!)! : UIImage(named: "beer")!)
                .resizable()
                .frame(width: 50,
                       height: 50,
                       alignment: .center)
                .clipShape(Circle())
        }
    }
}
