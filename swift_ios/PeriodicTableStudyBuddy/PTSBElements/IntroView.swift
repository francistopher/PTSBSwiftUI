//
//  DevIntro.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/10/22.
//

import Foundation
import SwiftUI

struct IntroView: View {
    @State private var circleSize:CGFloat = 0.0;
    @State private var backgroundColor:UIColor = UIColor.white
    let sck:ScreenKit = ScreenKit.shared
    
    func updateCircleSize(newCircleSize: CGFloat) {
        if (newCircleSize < 1.25) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation {
                    self.circleSize = newCircleSize
                    updateCircleSize(newCircleSize: self.circleSize + 0.025)
                }
            }
        } else {
            self.backgroundColor = UIColor.systemTeal
        }
    }
    
    var body: some View {
        ZStack {
            Color(self.backgroundColor) // set background
            let textLetters:[String] = ["D", "B", "C", "F"] // setup properties for text
            let textOffsetDirections = [
                (x:-1, y:-1),
                (x:1, y:-1),
                (x:-1, y:1),
                (x:1, y:1)
            ]
            if (self.backgroundColor == UIColor.white) {
                ForEach(0..<4) { i in // generate 4 texts and apply their properites
                    Text(textLetters[i])
                        .offset(
                            x: CGFloat(textOffsetDirections[i].x) * sck.getHeight(factor: 0.1),
                            y: CGFloat(textOffsetDirections[i].y) * sck.getHeight(factor: 0.1125))
                        .font(SwiftUI.Font.system(size: sck.getHeight(factor: 0.25),
                                                  weight: Font.Weight.bold,
                                                  design: Font.Design.rounded))
                        .foregroundColor(Color.teal)
                        .transition(.scale)
                }
            }
                
                Circle() // circle that grows after select elements is pressed
                    .offset(x: (sck.getWidth(factor: 1) - sck.getWidth(factor: self.circleSize)) * 0.5,
                            y: (sck.getHeight(factor: 1) - sck.getWidth(factor: self.circleSize)) * 0.5)
                    .size(width: sck.getWidth(factor: self.circleSize),
                          height: sck.getWidth(factor: self.circleSize))
                    .fill(Color.teal)
            
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                updateCircleSize(newCircleSize: self.circleSize)
            }
        }
    }
}
