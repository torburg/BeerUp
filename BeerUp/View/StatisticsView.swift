//
//  StatisticsView.swift
//  BeerUp
//
//  Created by Maksim Torburg on 11.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//
import SwiftUI

struct StatisticsView: View {

    @State var pickerItem = 0
    @State var beerList = BeerList()
//    @State var sortedBeersByStyle = BeerList().sortedById()
//    @State var styles = BeerList().getBeerStyles(in: 0)

    init() {
        UITableView.appearance().backgroundColor = UIColor(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Statistics").font(.system(size: 32)).bold()
                Picker(selection: $pickerItem, label: Text(""), content: {
                    Text(" < 10 ").tag(0)
                    Text(" 10 - 20 ").tag(1)
                    Text(" > 20 ").tag(2)
                })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.all, 20)
                    .animation(.spring())
                ZStack {
                    CircleView(value: 0.3)
                    CircleView(value: 0.6)
                }
                Spacer()
                List {
                    ForEach(beerList.getBeerStyles(in: pickerItem), id: \.self) { style in
                            Text(style)
                    }
                    .listRowBackground(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                }
                .padding(.top, 50)
                Text("Show me your Guiness!")
                Spacer()
            }
        }
    }
}

struct CircleView: View {

    var value: Double

    var body: some View {
        ZStack(alignment: .center) {
            CirclePath(progress: 1)
            .stroke(Color.white, style: StrokeStyle(lineWidth: 20,
                                                     lineCap: .butt,
                                                     lineJoin: .round,
                                                     miterLimit: 0,
                                                     dash: [],
                                                     dashPhase: 0))
             CirclePath(progress: value)
            .stroke(Color.green, style: StrokeStyle(lineWidth: 20,
                                                     lineCap: .butt,
                                                     lineJoin: .round,
                                                     miterLimit: 0,
                                                     dash: [],
                                                     dashPhase: 0))
        }.padding(.all, 50)
    }
}

struct CirclePath: Shape {

    let progress: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2,
                    startAngle: .radians(1.5 * .pi),
                    endAngle: .init(radians: 2 * Double.pi * progress + 1.5 * Double.pi),
                    clockwise: false
        )
        return path
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
