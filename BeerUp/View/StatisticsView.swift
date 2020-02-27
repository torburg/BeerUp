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

    init() {
//        UITableView.appearance().backgroundColor = UIColor(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Statistics").font(.system(size: 32)).bold()
                Picker(selection: $pickerItem, label: Text(""), content: {
                    Text(" < 25 ").tag(0)
                    Text(" 25 - 50 ").tag(1)
                    Text(" 50 - 25 ").tag(2)
                    Text(" > 75 ").tag(3)
                })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.all, 20)
                    .animation(.spring())
                DiagramView(beerStyles: beerList.beerStylesSorted(by: pickerItem))
                    .padding(.all, 25)
                Spacer()
                StyleList(beerStyles: beerList.beerStylesSorted(by: pickerItem))
                    .padding(.top, 50)
                Text("Show me your Guiness!")
                Spacer()
            }
        }
    }
}

struct StyleList: View {

    let styles: [StyleLabel]

    init(beerStyles: [(key: Beer.beerStyle, value : Int)]) {
        var stylesOfBeer: [StyleLabel] = []
        
        for style in beerStyles {
            let styleName = style.key
            let beerAmount = style.value
            let color = getColor(for: styleName)
            let styleLabel = StyleLabel(name: styleName.rawValue, amount: beerAmount, color: color)
            stylesOfBeer.append(styleLabel)
        }
        self.styles = stylesOfBeer
    }
    
    var body: some View {
        List {
            ForEach(styles, id: \.name) { style in
                HStack {
                    Text(style.name)
                        .fontWeight(.bold)
                        .foregroundColor(style.color)
                    Spacer()
                    Text("\(style.amount)")
                        .foregroundColor(style.color)
                }
            }
        }
    }
}

struct StyleLabel {
    let name: String
    let amount: Int
    let color: Color
}

struct DiagramView: View {

    let styles: [StyleForDiagram]

    init(beerStyles: [(key: Beer.beerStyle, value : Int)]) {
        
        let totalAmountOfBeers = beerStyles.reduce(0) { total, pair in
            total + pair.value
        }
        var stylesOfBeer: [StyleForDiagram] = []
        var beginAngle = 0.0

        for style in beerStyles {
            let styleName = style.key
            let beerAmount = style.value
            let progress = Double(beerAmount) / Double(totalAmountOfBeers)
            let styleView = StyleForDiagram(for: styleName, beginAngle: beginAngle, progress: progress)
            stylesOfBeer.append(styleView)
            beginAngle += progress
        }
        self.styles = stylesOfBeer
    }
    
    var body: some View {
        ZStack {
            ForEach(styles, id: \.name) { style in
                CircleView(begin: style.beginAngle, value: style.progressAngle, color: style.color)
            }
        }
    }
}

struct StyleForDiagram {

    let name: String
    let color: Color
    let beginAngle: Double
    let progressAngle: Double

    init(for style: Beer.beerStyle, beginAngle: Double, progress: Double) {
        self.color = getColor(for: style)
        name = style.rawValue
        self.beginAngle = beginAngle
        progressAngle = progress
    }
}

struct CircleView: View {

    var begin: Double
    var value: Double
    var color: Color

    var body: some View {
            CirclePath(startAngle: begin, progress: value)
            .stroke(color, style: StrokeStyle(lineWidth: 20,
                                                     lineCap: .butt,
                                                     lineJoin: .round,
                                                     miterLimit: 0,
                                                     dash: [],
                                                     dashPhase: 0))
            .padding(.all, 50)
    }
}

struct CirclePath: Shape {

    let startAngle: Double
    let progress: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: .radians(1.5 * .pi + 2 * .pi * startAngle),
            endAngle: .radians(1.5 * .pi + 2 * .pi * (startAngle + progress)),
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


fileprivate func getColor(for style: Beer.beerStyle) -> Color {
    switch style {
    case .americanIpa:
        return Color(.green)
    case .sourFruited:
        return Color(.orange)
    case .ipaSour:
        return Color(.purple)
    case .hopeIpa:
        return Color(.magenta)
    case .lager:
        return Color(.blue)
    case .weisse:
        return Color(.darkGray)
    case .milkStout:
        return Color(.brown)
    default:
        return Color(.black)
    }
}
