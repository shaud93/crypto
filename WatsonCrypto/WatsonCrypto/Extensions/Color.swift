//
//  Color.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/18/24.
//

import Foundation
import SwiftUI

extension Color {
    
    // color.theme.redcolor
    static let theme = ColorTheme()
}

// all colors from asset folder
struct ColorTheme{
    
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("BackgroundColor")
    let greenColor = Color("GreenColor")
    let redColor = Color("RedColor")
    let secondaryTextColor = Color("SecondaryTextColor")
}
