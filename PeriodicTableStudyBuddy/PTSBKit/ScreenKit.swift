//
//  ScreenKit.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/10/22.
//

import Foundation
import UIKit

struct ScreenKit {
    static let shared:ScreenKit = ScreenKit()
    private var width:CGFloat!
    private var height:CGFloat!
    private var isLandscape:Bool = true;
    
    public func getWidth(factor:CGFloat) -> CGFloat {
        if (isLandscape) {
            return self.height * factor
        } else {
            return self.width * factor
        }
        
    }
    
    public func getHeight(factor:CGFloat) -> CGFloat {
        if (isLandscape) {
            return self.width * factor
        } else {
            return self.height * factor
        }
    }
    
    private init() {
        let size:CGRect = UIScreen.main.bounds
        self.width = size.width
        self.height = size.height
    }
}

