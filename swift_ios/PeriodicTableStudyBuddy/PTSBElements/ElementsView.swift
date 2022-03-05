//
//  ElementsView.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/17/22.
//

import Foundation
import SwiftUI

struct ElementsView: View {
    private let sck:ScreenKit = ScreenKit.shared
    
    @State private var buttonLength:CGFloat = 0.0
    @State private var circleRadius:CGFloat = 0.0
    @State private var elementScale:CGFloat = 0.0
    
    private func growElementScale(elementScale:CGFloat) {
        if (self.elementScale < 1.0) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                withAnimation {
                    self.elementScale = elementScale
                    self.growElementScale(elementScale: self.elementScale + 0.04)
                }
            }
        }
    }
    
    private func growCircle(newSize:CGFloat) { // grow circle background after select elements is pressed
        if (self.circleRadius < 1.75) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation {
                    self.circleRadius = newSize
                    self.growCircle(newSize: self.circleRadius + 0.025)
                }
            }
        } else {
            growElementScale(elementScale: 0.0)
        }
    }
    
    private func growSelectElementsButton() {
        if (self.buttonLength < 0.25) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.buttonLength += 0.025
                growSelectElementsButton()
            }
        }
    }
    
    private func getElementGroupText(value:Int) -> String {
        if (value == 1) {
            return "G" + String(value)
        } else {
            return String(value)
        }
    }
    
    private func getElementPeriodText(value:Int) -> String {
        if (value == 1) {
            return "P" + String(value)
        } else {
            if value > 8 {
                return String(value - 1)
            } else {
                return String(value)
            }
        }
    }
    
    private func buildPeriodButtons(row:Int, col:Int, gap:CGFloat, hFix:CGFloat, hWidth:CGFloat, vFix:CGFloat, vHeight:CGFloat) -> some View {
        return Button(getElementPeriodText(value: row), role: ButtonRole.cancel, action: {
            
        })
            .frame(width: hWidth * self.elementScale, height: vHeight * self.elementScale, alignment: .center)
            .font(SwiftUI.Font.system(size: hWidth * self.elementScale * 0.5,
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .background(Color.clear)
            .foregroundColor(Color.white)
            .position(x: hFix - hWidth + gap,
                      y: vFix + ((CGFloat(row) * (gap + vHeight)) + gap))
    }
    
    private func buildGroupButtons(row:Int, col:Int, gap:CGFloat, hFix:CGFloat, hWidth:CGFloat, vFix:CGFloat, vHeight:CGFloat) -> some View {
        return Button(getElementGroupText(value: col + 1), role: ButtonRole.cancel, action: {
            
        })
            .frame(width: hWidth * self.elementScale, height: vHeight * self.elementScale, alignment: .bottom)
            .font(SwiftUI.Font.system(size: hWidth * self.elementScale * 0.5,
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .background(Color.clear)
            .foregroundColor(Color.white)
            .position(x: hFix + ((CGFloat(col) * (gap + hWidth)) + gap),
                      y: vFix + ((CGFloat(row) * (gap + vHeight)) + gap))
    }
    
    private func buildElementButton(row:Int, col:Int, gap:CGFloat, hFix:CGFloat, hWidth:CGFloat, vFix:CGFloat, vHeight:CGFloat) -> some View {
        return Button("1\nE", role: ButtonRole.cancel, action: {
        })
            .frame(width: hWidth * self.elementScale, height: vHeight * self.elementScale, alignment: Alignment.center)
            .font(SwiftUI.Font.system(size: hWidth * self.elementScale * 0.4,
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .background(Color.teal)
            .foregroundColor(Color.white)
            .overlay(RoundedRectangle(cornerRadius: hWidth * 0.25).stroke(Color.white, lineWidth: hWidth * 0.1))
            .cornerRadius(hWidth * 0.25)
            .position(x: hFix + ((CGFloat(col) * (gap + hWidth)) + gap),
                      y: vFix + ((CGFloat(row) * (gap + vHeight)) + gap))
    }
    
    private func buildCircle() -> some View {
        return Circle()
            .offset(x: (sck.getWidth(factor: 1.0/3.0) - sck.getWidth(factor: self.circleRadius)) * 0.5,
                    y: (sck.getHeight(factor: 1) - sck.getWidth(factor: self.circleRadius)) * 0.5)
            .size(width: sck.getWidth(factor: self.circleRadius),
                  height: sck.getWidth(factor: self.circleRadius))
            .fill(Color.init(red: 255/255, green: 180/255, blue: 222/255))
    }
    
    private func buildSelectElementButton() -> some View {
        return Button("Select Elements", role: ButtonRole.cancel, action: {
            self.growCircle(newSize: 0.0)
        })
            .font(SwiftUI.Font.system(size: sck.getHeight(factor: 0.045 * (self.buttonLength / 0.25)),
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .frame(width: sck.getHeight(factor: self.buttonLength),
                   height: sck.getHeight(factor: self.buttonLength),
                   alignment: Alignment.center)
            .background(Color.init(red: 255/255, green: 180/255, blue: 222/255))
            .foregroundColor(Color.white)
            .overlay(RoundedRectangle(cornerRadius: self.sck.getHeight(factor: 0.05)).stroke(Color.white, lineWidth: self.sck.getHeight(factor: 0.025)))
            .cornerRadius(sck.getHeight(factor: 0.05))
            .offset(x: sck.getHeight(factor: -0.6),
                    y: sck.getHeight(factor: 0))
    }
    
    var body: some View {
        let gap:CGFloat = sck.getHeight(factor: 0.0075)
        let verticalHeight:CGFloat = (sck.getHeight(factor: 1) - (gap * 13)) / 12
        let verticalFix:CGFloat = (verticalHeight * 0.5)
        let horizontalSpace:CGFloat = sck.getHeight(factor: 1) * 4.0 / 3.0
        let horizontalWidth:CGFloat = (horizontalSpace - (gap * 19)) / 18
        let horizontalFix:CGFloat = ((sck.getWidth(factor: 1) - horizontalSpace) * 0.5) + (horizontalWidth * 0.5)
        ZStack {
            buildSelectElementButton()
            buildCircle()
            ForEach(0..<11) { row in // rows
                ForEach(0..<18) { col in // columns
                    if (row > 0 && row != 8) { // Build period buttons
                        // define period  buttons
                        self.buildPeriodButtons(row: row, col: col, gap: gap, hFix: horizontalFix, hWidth: horizontalWidth, vFix: verticalFix, vHeight: verticalHeight)
                    }
                    if (row == 0) { // Build group buttons
                        self.buildGroupButtons(row: row, col: col, gap: gap, hFix: horizontalFix, hWidth: horizontalWidth, vFix: verticalFix, vHeight: verticalHeight)
                    } else if (row != 8) { // Build element button
                        if (row != 1 || (col == 0 || col == 17)) { // Get rid of period 1 vacant cells
                            if (row != 2 || (col < 2 || col > 11)) { // Get rid of period 2 vacant cells
                                if (row != 3 || (col < 2 || col > 11)) { // Get rid of period 3 vacant cells
                                    if (row != 9 || (col > 2 && col < 17)) { // Get rid of period 8 vacant cells
                                        if (row != 10 || (col > 2 && col < 17)) {
                                            self.buildElementButton(row: row, col: col, gap: gap, hFix: horizontalFix, hWidth: horizontalWidth, vFix: verticalFix, vHeight: verticalHeight)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            //'spfdivjs;ofdijvs;ofjn
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                growSelectElementsButton()
            }
        }
    }
}

