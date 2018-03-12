//
//  UIColor+Create.swift
//  Xtensions
//
//  Copyright (c) 2018 Luis Cárdenas
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(r: Double, g: Double, b: Double) {
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    convenience init(hexRed: Int, hexGreen: Int, hexBlue: Int) {
        assert(hexRed >= 0 && hexRed <= 255, "Invalid red component")
        assert(hexGreen >= 0 && hexGreen <= 255, "Invalid green component")
        assert(hexBlue >= 0 && hexBlue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(hexRed) / 255.0, green: CGFloat(hexGreen) / 255.0, blue: CGFloat(hexBlue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hexRGB: Int) {
        self.init(hexRed: (hexRGB >> 16) & 0xFF, hexGreen: (hexRGB >> 8) & 0xFF, hexBlue: hexRGB & 0xFF)
    }
    
}
