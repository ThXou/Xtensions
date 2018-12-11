//
//  UIView+Frame.swift
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
import UIKit

extension UIView {
    
    // This extension has been ported from the Objective-C version of FrameAccessor
    // by Alexey Denisov at https://github.com/AlexDenisov/FrameAccessor
    
    // MARK: - Frame origin
    public var x_origin: CGPoint {
        get {
            return frame.origin
        }
        set(newOrigin) {
            var newFrame = frame
            newFrame.origin = newOrigin
            frame = newFrame
        }
    }
    
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newX) {
            var newFrame = frame
            newFrame.origin.x = newX
            frame = newFrame
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newY) {
            var newFrame = frame
            newFrame.origin.y = newY
            frame = newFrame
        }
    }
    
    
    // MARK: - Frame size
    public var x_size: CGSize {
        get {
            return frame.size
        }
        set(newSize) {
            var newFrame = frame
            newFrame.size = newSize
            frame = newFrame
        }
    }
    
    public var x_height: CGFloat {
        get {
            return frame.size.height
        }
        set(newHeight) {
            var newFrame = frame
            newFrame.size.height = newHeight
            frame = newFrame
        }
    }
    
    public var x_width: CGFloat {
        get {
            return frame.size.width
        }
        set(newWidth) {
            var newFrame = frame
            newFrame.size.width = newWidth
            frame = newFrame
        }
    }
    
    
    // MARK: - Frame borders
    public var x_left: CGFloat {
        get { return x }
        set(newValue) { x = newValue }
    }
    
    public var x_right: CGFloat {
        get { return frame.origin.x + frame.size.width }
        set(newValue) { x = newValue - x_width }
    }
    
    public var x_top: CGFloat {
        get { return y }
        set(newValue) { y = newValue }
    }
    
    public var x_bottom: CGFloat {
        get { return frame.origin.y + frame.size.height }
        set(newValue) { y = newValue - x_height }
    }
    
    
    // MARK: - Center point
    public var x_centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    public var x_centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            center = CGPoint(x: center.x, y: newValue)
        }
    }
    
    
    // MARK: - Middle point
    public var x_middlePoint: CGPoint {
        return CGPoint(x: x_middleX, y: x_middleY)
    }
    
    public var x_middleX: CGFloat {
        return x_width / 2
    }
    
    public var x_middleY: CGFloat {
        return x_height / 2
    }
    
}
