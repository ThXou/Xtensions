//
//  String+Additions.swift
//
//  Copyright © 2018 Luis Cardenas. All rights reserved.
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

extension String {
    
    // MARK: - NSString
    public var x_lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    
    public var x_pathExtension: String {
        return (self as NSString).pathExtension
    }
    
    public var x_deletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }
    
    public var x_deletingPathExtension: String {
        return (self as NSString).deletingPathExtension
    }
    
    public var x_pathComponents: [String] {
        return (self as NSString).pathComponents
    }
    
    public func x_appendingPath(component: String) -> String {
        return (self as NSString).appendingPathComponent(component)
    }
    
    public func x_appendingPath(extension ext: String) -> String? {
        return (self as NSString).appendingPathExtension(ext)
    }
    
}
