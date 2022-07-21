//
//  AssessorView.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 3/29/22.
//

import Foundation
import SwiftUI

struct MasteringView: View {
    
    private let sck:ScreenKit = ScreenKit.shared
    
    @State private var buttonsLength:CGFloat = 0.0
    @State private var circleRadius:CGFloat = 0.0
    @State private var elementScale:CGFloat = 0.0
    @State private var nextButtonText:String = "Start"
    @State private var promptLabelText:String = "Start Mastering Elements!"
    @State private var answerFieldText:String = "Enter Answer Here!"
    @State private var showAnswerField:Bool = false
    @State private var answer:String = ""
    @State private var totalQuestions:Int = 0
    @State private var totalCorrect:Int = 0
    
    @StateObject var info:AppStateInfo
    
    /*
     TODO: combine growCircle and shrinkCircle button
     */
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
            info.onHomeScreen = false
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
    
    var circle: some View {
        return Circle()
            .offset(x: (sck.getWidth(factor: 5.0/3.0) - sck.getWidth(factor: self.circleRadius)) * 0.5,
                    y: (sck.getHeight(factor: 1) - sck.getWidth(factor: self.circleRadius)) * 0.5)
            .size(width: sck.getWidth(factor: self.circleRadius),
                  height: sck.getWidth(factor: self.circleRadius))
            .fill(Color.init(red: 255/255, green: 180/255, blue: 222/255))
    }
    
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
        if self.nextButtonText == "Go Back" {
                self.nextButtonText = "Start"
                self.promptLabelText = "Start Mastering Elements"
        }
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
    
    private func renderCloseButton(xPos:CGFloat, yPos:CGFloat) -> some View {
        return Button("X", role: ButtonRole.cancel, action: {
            if (self.elementScale == 1.0) {
                info.onHomeScreen = true
                self.shrinkElementScale(elementScale: 1.0 - 0.04)
            }
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
    
    private var startMasteringButton: some View {
        Button("Start Mastering", role: ButtonRole.cancel, action: {
            if (self.circleRadius == 0.0) {
                print("Start Learning")
                self.growCircle(newSize: self.circleRadius + 0.025)
            }
            
        })
            .font(SwiftUI.Font.system(size: sck.getHeight(factor: 0.045 * (self.buttonsLength / 0.25)),
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .frame(width: sck.getHeight(factor: self.buttonsLength),
                   height: sck.getHeight(factor: self.buttonsLength),
                   alignment: Alignment.center)
            .background(Color.init(red: 255/255, green: 180/255, blue: 222/255))
            .foregroundColor(Color.white)
            .overlay(RoundedRectangle(cornerRadius: self.sck.getHeight(factor: 0.05)).stroke(Color.white, lineWidth: self.sck.getHeight(factor: 0.025)))
            .cornerRadius(sck.getHeight(factor: 0.05))
            .offset(x: sck.getHeight(factor: 0.6),
                    y: sck.getHeight(factor: 0))
    }
    
    private var panel: some View {
        return Text("")
            .frame(width: sck.getHeight(factor: 0.9 * self.elementScale), height: sck.getHeight(factor: 0.9 * self.elementScale), alignment: .center)
            .background(Color.teal)
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: sck.getHeight(factor: 0.1 * self.elementScale)).stroke(Color.white, lineWidth: sck.getWidth(factor: 0.025 * self.elementScale)))
            .cornerRadius(sck.getHeight(factor: 0.1 * self.elementScale))
    }
    
    private func loadQuestionAndAnswer() {
        if (!info.questionAnswer.isEmpty) {
            let questionAndAnswer:[String] = info.questionAnswer.removeFirst()
            self.promptLabelText = questionAndAnswer[0]
            self.answer = questionAndAnswer[1]
            self.nextButtonText = "Submit"
        } else {
            self.showAnswerField = false
            let percentage:Int = Int((CGFloat(self.totalCorrect) / CGFloat(self.totalQuestions)) * 100)
            self.promptLabelText = "Your final score: \(self.totalCorrect)/\(self.totalQuestions) Percentage: \(percentage)%"
            self.nextButtonText = "Go Back"
            self.totalCorrect = 0
        }
    }
    
    private var nextButton: some View {
        return Button(self.nextButtonText) {
            if self.nextButtonText == "Go Back" {
                info.onHomeScreen = true
                self.shrinkElementScale(elementScale: 1.0 - 0.04)
            }
            else if self.nextButtonText == "Submit" {
                if self.answer == self.answerFieldText {
                    self.nextButtonText = "Correct! Next"
                    self.totalCorrect = self.totalCorrect + 1
                } else {
                    self.nextButtonText = "Wrong! Next"
                    self.answerFieldText = self.answer
                }
            }
            else if self.nextButtonText == "Wrong! Next" || self.nextButtonText == "Correct! Next" {
                self.answerFieldText = "Enter Answer Here!"
                loadQuestionAndAnswer()
            }
            else {
                if self.nextButtonText == "Start" {
                    info.questionAnswer = []
                    info.generateSelectedElementsQuestions()
                    totalQuestions = info.questionAnswer.count
                    if info.questionAnswer.count == 0 {
                        self.promptLabelText = "Go back and Select Elements!"
                        self.nextButtonText = "Go Back"
                    } else {
                        self.showAnswerField = true
                        self.nextButtonText = "Submit"
                        
                        loadQuestionAndAnswer()
                    }
                }
            }
        }
        .frame(width: sck.getHeight(factor: 0.3 * self.elementScale), height: sck.getHeight(factor: 0.15 * self.elementScale), alignment: .center)
        .font(SwiftUI.Font.system(size:sck.getHeight(factor: 0.04 * self.elementScale),
                                  weight: Font.Weight.bold,
                                  design: Font.Design.rounded))
        .background(Color.init(red:63/255, green: 224/255, blue:208/255))
        .foregroundColor(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: sck.getHeight(factor: 0.05 * self.elementScale)).stroke(Color.white, lineWidth: sck.getWidth(factor: 0.0125 * self.elementScale)))
        .cornerRadius(sck.getHeight(factor: 0.05 * self.elementScale))
        .offset(x: 0, y: sck.getHeight(factor: 0.325 * self.elementScale))
        
    }
    
    private var promptText:some View {
        return Text(self.promptLabelText)
            .frame(width: sck.getHeight(factor: 0.8 * self.elementScale), height: sck.getHeight(factor: 0.15 * self.elementScale), alignment: .center)
            .font(SwiftUI.Font.system(size: sck.getHeight(factor: 0.04 * self.elementScale),
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .background(Color.init(red:63/255, green: 224/255, blue:208/255))
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: sck.getHeight(factor: 0.05 * self.elementScale)).stroke(Color.white, lineWidth: sck.getWidth(factor: 0.0125 * self.elementScale)))
            .cornerRadius(sck.getHeight(factor: 0.05 * self.elementScale))
            .offset(x: 0, y: -sck.getHeight(factor: 0.325 * self.elementScale))
            .multilineTextAlignment(TextAlignment.center)
    }
    
    private var answerTextField: some View {
        return TextField("", text: self.$answerFieldText, onEditingChanged: { onEditChanged in
            if onEditChanged {
                if self.answerFieldText == "Enter Answer Here!" {
                    self.answerFieldText = ""
                }
            }
        })
            .frame(width: sck.getHeight(factor: 0.6 * self.elementScale), height: sck.getHeight(factor: 0.15 * self.elementScale), alignment: .center)
            .font(SwiftUI.Font.system(size: sck.getHeight(factor: 0.04 * self.elementScale),
                                      weight: Font.Weight.bold,
                                      design: Font.Design.rounded))
            .background(Color.init(red: 255/255, green: 180/255, blue: 222/255))
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: sck.getHeight(factor: 0.05 * self.elementScale)).stroke(Color.white, lineWidth: sck.getWidth(factor: 0.0125 * self.elementScale)))
            .cornerRadius(sck.getHeight(factor: 0.05 * self.elementScale))
            .multilineTextAlignment(TextAlignment.center)
            .disableAutocorrection(true)
    }
    
    var body: some View {
        let gap:CGFloat = sck.getHeight(factor: 0.0075)
        let verticalHeight:CGFloat = (sck.getHeight(factor: 1) - (gap * 12)) / 11
        let horizontalSpace:CGFloat = sck.getHeight(factor: 1) * 4.0 / 3.0
        let horizontalWidth:CGFloat = (horizontalSpace - (gap * 19)) / 18
        let horizontalFix:CGFloat = ((sck.getWidth(factor: 1) - horizontalSpace) * 0.5)
        ZStack {
            self.startMasteringButton
            self.circle
            self.panel
            self.promptText
            if showAnswerField {
                self.answerTextField
            }
            self.nextButton
            renderCloseButton(
                xPos:sck.getWidth(factor: 1.0) - (horizontalFix + horizontalWidth + (gap)),
                yPos:verticalHeight * 10)
            
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                updateButtonsLength()
            }
        }
    }
    
    private func updateButtonsLength() {
        if (self.buttonsLength < 0.25) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.buttonsLength += 0.025
                updateButtonsLength()
            }
        }
    }
}
