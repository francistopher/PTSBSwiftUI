//
//  PeriodicTableStudyBuddyApp.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/9/22.
//

import SwiftUI

@main
struct PeriodicTableStudyBuddyApp: App {
    let persistenceController = PersistenceController.shared
    let sk:ScreenKit = ScreenKit.shared
    
    var body: some Scene {
        WindowGroup {
            //            ContentView()
            //                .environment(\.managedObjectContext,
            //                              persistenceController.container.viewContext)
            //                .frame(width: sk.getWidth(factor: 1),
            //                       height: sk.getHeight(factor: 1),
            //                       alignment: Alignment.center)
            ZStack {
                IntroView()
                HomeView()
                ElementsView()
            }
        }
    }
}

