//
//  ElementsView.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/17/22.
//

import Foundation
import SwiftUI
import CoreData

struct ElementsView: View {
    private let sck:ScreenKit = ScreenKit.shared
    
    @State private var buttonLength:CGFloat = 0.0
    @State private var circleRadius:CGFloat = 0.0
    @State private var elementScale:CGFloat = 0.0
    @State private var largeElementCellText:String = "1\nH"
    @State private var elementInfoText:String = "Atomic Number: 1\nSymbol: H\nName: Hydrogen"
    
    private func growElementScale(elementScale:CGFloat) {
        if (self.elementScale < 0.96) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                withAnimation {
                    self.elementScale = elementScale
                    self.growElementScale(elementScale: self.elementScale + 0.04)
                }
            }
        } else {
            self.elementScale = 1.0
        }
    }
    
    private func shrinkElementScale(elementScale:CGFloat) {
        if (self.elementScale > 0.04) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                withAnimation {
                    self.elementScale = elementScale
                    if (self.elementScale < 0.2 && self.elementScale > 0.19) {
                        self.shrinkCircle(newSize: 1.75 - 0.025)
                    }
                    self.shrinkElementScale(elementScale: self.elementScale - 0.04)
                }
            }
        } else {
            self.elementScale = 0.0
        }
    }
    
    private func growCircle(newSize:CGFloat) { // grow circle background after select elements is pressed
        if (self.circleRadius < 1.75 - 0.025) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation {
                    self.circleRadius = newSize
                    if (self.circleRadius > 1.59 && self.circleRadius < 1.6) {
                        growElementScale(elementScale: 0.04)
                    }
                    self.growCircle(newSize: self.circleRadius + 0.025)
                }
            }
        } else {
            self.circleRadius = 1.775
        }
    }
    
    private func shrinkCircle(newSize:CGFloat) {
        if (self.circleRadius > 0.0 + 0.025) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation {
                    self.circleRadius = newSize
                    self.shrinkCircle(newSize: self.circleRadius - 0.025)
                }
            }
        } else {
            self.circleRadius = 0.0
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
    
    private func renderElementButton(row:Int, col:Int, gap:CGFloat, hFix:CGFloat, hWidth:CGFloat, vHeight:CGFloat, elementData:[String:String]) -> some View {
        return Button("\(elementData["AtomicNumber"] ?? "1")\n\(elementData["Symbol"] ?? "H")", role: ButtonRole.cancel, action: {
            self.largeElementCellText = "\(elementData["AtomicNumber"] ?? "1")\n\(elementData["Symbol"] ?? "H")"
            self.elementInfoText = "Atomic Number: \(elementData["AtomicNumber"] ?? "1")\nSymbol: \(elementData["Symbol"] ?? "H")\nName: \(elementData["Name"] ?? "Hydrogen")"
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
                      y: (CGFloat(row) * (gap + vHeight)) + gap)
            .multilineTextAlignment(TextAlignment.center)
    }
    
    private func renderLargeElementCell(row: Int, col:Int, gap:CGFloat, hFix:CGFloat, hWidth:CGFloat, vHeight:CGFloat) -> some View {
        return Text(self.largeElementCellText)
            .frame(width: ((hWidth * 2.5) + gap) * self.elementScale,
                   height: ((vHeight * 3) + (gap * 2)) * self.elementScale,
                   alignment: Alignment.center)
            .font(SwiftUI.Font.system(size: (hWidth * 0.9) * self.elementScale,
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
        
            .background(Color.init(red: 63/255, green: 224/255, blue: 208/255))
            .foregroundColor(Color.white)
            .overlay(RoundedRectangle(cornerRadius: hWidth * 0.33).stroke(Color.white, lineWidth: hWidth * 0.1))
            .cornerRadius(hWidth * 0.33)
            .position(x: hFix + ((CGFloat(col) + 0.825) * (gap + hWidth)),
                      y: (CGFloat(row + 1) * (gap + vHeight)) + gap)
            .multilineTextAlignment(TextAlignment.center)
    }
    
    private func renderElementInfoPane(row: Int, col:Int, gap:CGFloat, hFix:CGFloat, hWidth:CGFloat, vHeight:CGFloat) -> some View {
        return Text(self.elementInfoText)
            .frame(width: ((hWidth * 7.55) + (gap * 6.55)) * self.elementScale,
                   height: ((vHeight * 3) + (gap * 2)) * self.elementScale,
                   alignment: Alignment.center)
            .font(SwiftUI.Font.system(size: hWidth * 0.666 * self.elementScale,
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .background(Color.init(red:63/255, green: 224/255, blue:208/255))
            .foregroundColor(Color.white)
            .overlay(RoundedRectangle(cornerRadius: hWidth * 0.33).stroke(Color.white, lineWidth: hWidth * 0.1))
            .cornerRadius(hWidth * 0.33)
            .position(x: hFix + (((CGFloat(col) + 5.725) * (gap + hWidth)) + gap),
                      y: (CGFloat(row + 1) * (gap + vHeight)) + gap)
            .multilineTextAlignment(TextAlignment.center)
    }
    
    private func renderCircle() -> some View {
        return Circle()
            .offset(x: (sck.getWidth(factor: 1.0/3.0) - sck.getWidth(factor: self.circleRadius)) * 0.5,
                    y: (sck.getHeight(factor: 1) - sck.getWidth(factor: self.circleRadius)) * 0.5)
            .size(width: sck.getWidth(factor: self.circleRadius),
                  height: sck.getWidth(factor: self.circleRadius))
            .fill(Color.init(red: 255/255, green: 180/255, blue: 222/255))
    }
    
    private func renderSelectElementButton() -> some View {
        return Button("Select Elements", role: ButtonRole.cancel, action: {
            if (self.elementScale == 0.0) {
                self.growCircle(newSize: 0.0)
            }
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
    
    private func renderCloseButton(xPos:CGFloat, yPos:CGFloat) -> some View {
        return Button("X", role: ButtonRole.cancel, action: {
            self.shrinkElementScale(elementScale: 1.0 - 0.04)
        })
            .font(SwiftUI.Font.system(size: sck.getHeight(factor: 0.05 * self.elementScale),
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .frame(width: sck.getHeight(factor: self.elementScale * 0.1),
                   height: sck.getHeight(factor: self.elementScale * 0.1),
                   alignment: Alignment.center)
            .background(Color.init(red:1, green:0, blue:0))
            .foregroundColor(Color.white)
            .overlay(RoundedRectangle(cornerRadius: self.sck.getHeight(factor: 0.2)).stroke(Color.white, lineWidth: self.sck.getHeight(factor: 0.01)))
            .cornerRadius(sck.getHeight(factor: 0.1))
            .position(x: xPos, y:yPos)
    }
    
    var body: some View {
        let gap:CGFloat = sck.getHeight(factor: 0.0075)
        let verticalHeight:CGFloat = (sck.getHeight(factor: 1) - (gap * 12)) / 11
        let horizontalSpace:CGFloat = sck.getHeight(factor: 1) * 4.0 / 3.0
        let horizontalWidth:CGFloat = (horizontalSpace - (gap * 19)) / 18
        let horizontalFix:CGFloat = ((sck.getWidth(factor: 1) - horizontalSpace) * 0.5)
        var data:[[String:String]] = ElementsData.shared.getTheRealData()
        ZStack {
            renderSelectElementButton()
            renderCircle()
            renderCloseButton(xPos:horizontalFix + horizontalWidth + (gap), yPos:verticalHeight * 10)
                ForEach(0..<11) { row in // rows
                    ForEach(0..<18) { col in // columns
                        if (row > 0 && row != 8) { // Build element button
                            if (row != 1 || (col == 0 || col == 17)) { // Get rid of period 1 vacant cells
                                if (row != 2 || (col < 2 || col > 11)) { // Get rid of period 2 vacant cells
                                    if (row != 3 || (col < 2 || col > 11)) { // Get rid of period 3 vacant cells
                                        if (row != 9 || (col > 2 && col < 17)) { // Get rid of period 8 vacant cells
                                            if (row != 10 || (col > 2 && col < 17)) { // Get rid of period 9 vacant cells
                                                self.renderElementButton(row: row, col: col, gap: gap, hFix: horizontalFix, hWidth: horizontalWidth, vHeight: verticalHeight, elementData:data.removeFirst())
                                            }
                                        }
                                    }
                                }
                            } else {
                                if (col == 2) {
                                    self.renderElementInfoPane(row: row, col: col, gap: gap, hFix: horizontalFix, hWidth: horizontalWidth, vHeight: verticalHeight)
                                    self.renderLargeElementCell(row: row, col: col, gap: gap, hFix: horizontalFix, hWidth: horizontalWidth, vHeight: verticalHeight)
                                }
                            }
                        }
                    }
                }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                growSelectElementsButton()
            }
        }
    }
}
