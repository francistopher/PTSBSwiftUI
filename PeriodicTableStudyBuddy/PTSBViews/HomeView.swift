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
    @StateObject var info:AppStateInfo
    
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
            
        }
        .onAppear {
            func updatePtsbRotation() {
                if (self.ptsbRotation < 360) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.015) {
                        if (info.onHomeScreen) {
                            self.ptsbRotation += 1
                        }
                        updatePtsbRotation()
                    }
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.015) {
                        if (info.onHomeScreen) {
                            self.ptsbRotation = 0
                        }
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
            }
        }
    }
}
