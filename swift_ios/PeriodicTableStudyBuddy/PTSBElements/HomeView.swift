//
//  HomeView.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/17/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    let sck:ScreenKit = ScreenKit.shared
    @State private var ptsbRotation:Double = 0.0
    @State private var hydrogenLength:CGFloat = 0.0
    @State private var buttonsLength:CGFloat = 0.0
    var body: some View {
        ZStack {
            Image("hydrogen")
                .resizable()
                .scaledToFit()
                .frame(width: sck.getHeight(factor: hydrogenLength),
                       height: sck.getHeight(factor: hydrogenLength),
                       alignment: Alignment.center)
            Image("ptsb")
                .resizable()
                .scaledToFit()
                .frame(width: sck.getHeight(factor: hydrogenLength),
                       height: sck.getHeight(factor: hydrogenLength),
                       alignment: Alignment.center)
                .rotationEffect(.degrees(ptsbRotation))
            
            Button("Start Learning", role: ButtonRole.cancel, action: {
                print("Start Learning")
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
        .onAppear {
            func updateButtonsLength() {
                if (self.buttonsLength < 0.25) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        self.buttonsLength += 0.025
                        updateButtonsLength()
                    }
                }
            }
            func updatePtsbRotation() {
                if (self.ptsbRotation < 360) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.015) {
                        self.ptsbRotation += 1
                        updatePtsbRotation()
                    }
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.015) {
                        self.ptsbRotation = 0
                        updatePtsbRotation()
                    }
                }
                
            }
            func updateHydrogenLength() {
                if (self.hydrogenLength < 0.5) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        self.hydrogenLength += 0.025
                        updateHydrogenLength()
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.33) {
                updateHydrogenLength()
                updatePtsbRotation()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.17) {
                    updateButtonsLength()
                }
            }
        }
    }
}
