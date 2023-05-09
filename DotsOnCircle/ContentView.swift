//
//  ContentView.swift
//  DotsOnCircle
//
//  Created by Max Franz Immelmann on 5/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var dots: [(CGFloat, CGFloat)] = []
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .onAppear {
                    // Add dots to the circle border
                    let numDots = Int.random(in: 3...9)
                    let circleCenter = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                    let radius = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 4
                    let angleStep = 360 / CGFloat(numDots)
                    for i in 0..<numDots {
                        let angle = CGFloat(i) * angleStep
                        let x = circleCenter.x + radius * cos(angle * .pi / 180)
                        let y = circleCenter.y + radius * sin(angle * .pi / 180)
                        dots.append((x, y))
                    }
                }
            
            ForEach(0..<dots.count, id: \.self) { i in
                Circle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
                    .position(x: dots[i].0, y: dots[i].1)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
