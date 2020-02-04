//
//  AboutView.swift
//  BeerUp
//
//  Created by Maksim Torburg on 27.01.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    let appVersion: String? = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("BeerUp")
                    .modifier(HeaderModifier())
                Text("\(appVersion ?? "Unkown") version")
            }
            Spacer()
            Button("Back") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

//Modifies

struct HeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.largeTitle)
    }
}
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
