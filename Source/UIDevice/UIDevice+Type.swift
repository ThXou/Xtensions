//
//  UIDevice+Type.swift
//
//  Copyright © 2018 Jesús Solé. All rights reserved.
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

import UIKit

public enum Model: String {
    case simulator        = "simulator/sandbox"
    case iPod1            = "iPod 1"
    case iPod2            = "iPod 2"
    case iPod3            = "iPod 3"
    case iPod4            = "iPod 4"
    case iPod5            = "iPod 5"
    case iPad2            = "iPad 2"
    case iPad3            = "iPad 3"
    case iPad4            = "iPad 4"
    case iPhone4          = "iPhone 4"
    case iPhone4S         = "iPhone 4S"
    case iPhone5          = "iPhone 5"
    case iPhone5S         = "iPhone 5S"
    case iPhone5C         = "iPhone 5C"
    case iPadMini1        = "iPad Mini 1"
    case iPadMini2        = "iPad Mini 2"
    case iPadMini3        = "iPad Mini 3"
    case iPadAir1         = "iPad Air 1"
    case iPadAir2         = "iPad Air 2"
    case iPadPro9_7       = "iPad Pro 9.7"
    case iPadPro9_7_cell  = "iPad Pro 9.7 cellular"
    case iPadPro12_9      = "iPad Pro 12.9"
    case iPadPro12_9_cell = "iPad Pro 12.9 cellular"
    case iPhone6          = "iPhone 6"
    case iPhone6plus      = "iPhone 6 Plus"
    case iPhone6S         = "iPhone 6S"
    case iPhone6Splus     = "iPhone 6S Plus"
    case iPhoneSE         = "iPhone SE"
    case iPhone7          = "iPhone 7"
    case iPhone7plus      = "iPhone 7 Plus"
    case iPhone8          = "iPhone 8"
    case iPhone8plus      = "iPhone 8 Plus"
    case iPhoneX          = "iPhone X"
    case iPhoneXS         = "iPhone XS"
    case iPhoneXSMax      = "iPhone XS Max"
    case iPhoneXR         = "iPhone XR"
    case unrecognized     = "?unrecognized?"
}

public extension UIDevice {
    public var x_type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String(validatingUTF8: ptr)
            }
        }
        
        if let model = modelCode, let modelString = String(validatingUTF8: model) {
            switch modelString {
            case "i386", "x86_64"                               : return .simulator
            case "iPod1,1"                                      : return .iPod1
            case "iPod2,1"                                      : return .iPod2
            case "iPod3,1"                                      : return .iPod3
            case "iPod4,1"                                      : return .iPod4
            case "iPod5,1"                                      : return .iPod5
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"     : return .iPad2
            case "iPad2,5", "iPad2,6", "iPad2,7"                : return .iPadMini1
            case "iPhone3,1", "iPhone3,2", "iPhone3,3"          : return .iPhone4
            case "iPhone4,1"                                    : return .iPhone4S
            case "iPhone5,1", "iPhone5,2"                       : return .iPhone5
            case "iPhone5,3", "iPhone5,4"                       : return .iPhone5C
            case "iPad3,1", "iPad3,2", "iPad3,3"                : return .iPad3
            case "iPad3,4", "iPad3,5", "iPad3,6"                : return .iPad4
            case "iPhone6,1", "iPhone6,2"                       : return .iPhone5S
            case "iPad4,1"                                      : return .iPadAir1
            case "iPad4,2"                                      : return .iPadAir2
            case "iPad4,4", "iPad4,5", "iPad4,6"                : return .iPadMini2
            case "iPad4,7", "iPad4,8", "iPad4,9"                : return .iPadMini3
            case "iPad6,3", "iPad6,11"                          : return .iPadPro9_7
            case "iPad6,4", "iPad6,12"                          : return .iPadPro9_7_cell
            case "iPad6,7"                                      : return .iPadPro12_9
            case "iPad6,8"                                      : return .iPadPro12_9_cell
            case "iPhone7,1", "iPhone8,2"                       : return .iPhone6plus
            case "iPhone7,2"                                    : return .iPhone6
            case "iPhone8,1"                                    : return .iPhone6S
            case "iPhone8,4"                                    : return .iPhoneSE
            case "iPhone9,1", "iPhone9,3"                       : return .iPhone7
            case "iPhone9,2", "iPhone9,4"                       : return .iPhone7plus
            case "iPhone10,1", "iPhone10,4"                     : return .iPhone8
            case "iPhone10,2", "iPhone10,5"                     : return .iPhone8plus
            case "iPhone10,3", "iPhone10,6"                     : return .iPhoneX
            case "iPhone11,2"                                   : return .iPhoneXS
            case "iPhone11,4"                                   : return .iPhoneXSMax
            case "iPhone11,8"                                   : return .iPhoneXR
            default: return .unrecognized
            }
        }
        return .unrecognized
    }
    
    public var x_modelName: String { return x_type.rawValue }
}

