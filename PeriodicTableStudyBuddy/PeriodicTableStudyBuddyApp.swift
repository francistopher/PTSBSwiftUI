//
//  PeriodicTableStudyBuddyApp.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/9/22.
//

import SwiftUI


@main
struct PeriodicTableStudyBuddyApp: App {
    
    let sk:ScreenKit = ScreenKit.shared
    @StateObject var info = AppStateInfo()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                IntroView()
                HomeView( info: info)
                ElementsView( info: info)
                    .zIndex(info.selectingElements ? 5 : 0)
                LearningView( info: info)
                    .zIndex(info.selectingElements ? 0 : 5)
            }
        }
    }
}

@MainActor class AppStateInfo: ObservableObject {
    @Published var selectingElements:Bool = false
    @Published var onHomeScreen:Bool = true
}
