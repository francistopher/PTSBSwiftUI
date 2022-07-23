//
//  HomeView.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/17/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
//    let sck:ScreenKit = ScreenKit.shared
    private let sck:ScreenKitObjC = ScreenKitObjC.sharedScreenKit() as! ScreenKitObjC
    
    @State private var ptsbRotation:Double = 0.0
    @State private var hydrogenLength:CGFloat = 0.0
    @StateObject var info:AppStateInfo
    
    func getImage(imageName:String) -> some View {
        return Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: sck.getHeight(self.hydrogenLength),
                   height: sck.getHeight(self.hydrogenLength),
                   alignment: Alignment.center)
    }
    
    var body: some View {
        ZStack {
            self.getImage(imageName: "hydrogen")
            self.getImage(imageName: "ptsb")
                .rotationEffect(.degrees(self.ptsbRotation))
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.33) {
                updateHydrogenLength()
                updatePtsbRotation()
            }
        }
    }
    
    private func updatePtsbRotation() {
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
    
    private func updateHydrogenLength() {
        if (self.hydrogenLength < 0.5) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.hydrogenLength += 0.025
                updateHydrogenLength()
            }
        }
    }
}
