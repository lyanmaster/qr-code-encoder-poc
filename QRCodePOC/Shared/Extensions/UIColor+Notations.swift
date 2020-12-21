//
//  UIColor+Notations.swift
//  PlaygroundSimulator
//
//  Created by Lyan Masterson on 13/11/20.
//

import UIKit

public extension UIColor {
    convenience init(hex: Int, alpha: Int = 0xFF) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255,
            A: CGFloat((alpha >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: components.A)
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
        var hexInt = UInt64()
        Scanner(string: hex).scanHexInt64(&hexInt)
        self.init(hex: Int(hexInt))
    }
    
    func getContrastColor() -> UIColor {
        let ciColor = CIColor(color: self)
        let luminance = (0.299 * ciColor.red + 0.587 * ciColor.green + 0.114 * ciColor.blue) / 255
        if luminance > 0.5 {
            return .black
        } else {
            return .white
        }
    }
}
