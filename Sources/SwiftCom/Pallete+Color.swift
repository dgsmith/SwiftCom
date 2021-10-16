//
//  Pallete+Color.swift
//  GlucoseGlance WatchKit Extension
//
//  Created by Grayson Smith on 7/3/21.
//

import SwiftUI

public protocol ColorTheme {
    var name: String { get }
    var main: Color { get }
    var highlight: Color { get }
    var inRange: Color { get }
    var aboveRange: Color { get }
    var belowRange: Color { get }
    
    var colors: [Color] { get }
}

public func == (lhs: ColorTheme, rhs: ColorTheme) -> Bool {
    return type(of: lhs) == type(of: rhs)
        && lhs.name == rhs.name
        && lhs.main == rhs.main
        && lhs.highlight == rhs.highlight
        && lhs.inRange == rhs.inRange
        && lhs.aboveRange == rhs.aboveRange
        && lhs.belowRange == rhs.belowRange
        && lhs.colors == rhs.colors
}

public extension ColorTheme {
    var colors: [Color] {
        return [self.main, self.highlight, self.belowRange, self.inRange, self.aboveRange]
    }
}

public struct ColorThemePlain: ColorTheme {
    public let name: String = "Plain"
    
    public let main: Color = .blue
#if os(watchOS)
    public let highlight: Color = .white
#else
    public let highlight: Color = Color(UIColor.label)
#endif

    public let inRange: Color = .green
    public let aboveRange: Color = .yellow
    public let belowRange: Color = .red
    
    public init() {}
}

public struct ColorThemeJamie: ColorTheme {
    public let name: String = "Jamie"
    
    public let main: Color = .yellowCrayola
    public let highlight: Color = .skyBlueCrayola
    public let inRange: Color = .cameoPink
    public let aboveRange: Color = .screaminGreen
    public let belowRange: Color = .shimmeringBlush
    
    public init() {}
}

public struct ColorThemeJamieAlt: ColorTheme {
    public let name: String = "Jamie Alt"

    public let main: Color = .yellow
    public let highlight: Color = .cyan
    public let inRange: Color = .pink
    public let aboveRange: Color = .green
    public let belowRange: Color = .purple

    public init() {}
}

extension Color {
    public static let yellowCrayola = Color("YellowCrayola", bundle: .module)
    public static let candyPink = Color("CandyPink", bundle: .module)
    public static let claret = Color("Claret", bundle: .module)
    public static let palePink = Color("PalePink", bundle: .module)
    public static let queenBlue = Color("QueenBlue", bundle: .module)
    public static let screaminGreen = Color("ScreaminGreen", bundle: .module)
    public static let skyBlueCrayola = Color("SkyBlueCrayola", bundle: .module)
    public static let cameoPink = Color("CameoPink", bundle: .module)
    public static let shimmeringBlush = Color("ShimmeringBlush", bundle: .module)
}
