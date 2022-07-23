//
//  DevIntro.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/10/22.
//

import Foundation
import SwiftUI


struct IntroView: View {
//    let sck:ScreenKit = ScreenKit.shared
    private let sck:ScreenKitObjC = ScreenKitObjC.sharedScreenKit() as! ScreenKitObjC
    
    @State private var circleSize:CGFloat = 0.0;
    @State private var backgroundColor:UIColor = UIColor.white
    
    private let textLetters:[String] = ["D", "B", "C", "F"] // setup properties for text
    private let textOffsetDirections:[(Int, Int)] = [
        (x:-1, y:-1),
        (x:1, y:-1),
        (x:-1, y:1),
        (x:1, y:1)
    ]
    
    /*
     * TODO: convert the circle into a struct
     */
    
    private var circle: some View {
        return Circle() // circle that grows after select elements is pressed
            .offset(x: (sck.getWidth(1) - sck.getWidth(self.circleSize)) * 0.5,
                    y: (sck.getHeight(1) - sck.getWidth(self.circleSize)) * 0.5)
            .size(width: sck.getWidth(self.circleSize),
                  height: sck.getWidth(self.circleSize))
            .fill(Color.teal)
    }
    
    var body: some View {
        ZStack {
            Color(self.backgroundColor) // set background
            if (self.backgroundColor == UIColor.white) {
                ForEach(0..<4) { i in // generate 4 texts and apply their properites
                    getLetter(i: i, offsetDirections: textOffsetDirections[i])
                }
                self.circle
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                updateCircleSize(newCircleSize: self.circleSize)
            }
        }
    }
    
    private func getLetter(i:Int, offsetDirections:(Int, Int)) -> some View { // returns an intro letter
        return Text(textLetters[i])
            .offset(
                x: CGFloat(offsetDirections.0) * sck.getHeight(0.1),
                y: CGFloat(offsetDirections.1) * sck.getHeight(0.1125))
            .font(SwiftUI.Font.system(size: sck.getHeight(0.25),
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .foregroundColor(Color.teal)
            .transition(.scale)
    }
    
    private func updateCircleSize(newCircleSize: CGFloat) { // grows the background circle
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
    
}
