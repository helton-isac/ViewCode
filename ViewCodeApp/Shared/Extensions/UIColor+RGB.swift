//
//  UIColor+RGB.swift
//  ViewCodeApp
//
//  Created by Helton Isac Torres Galindo on 13/10/20.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
