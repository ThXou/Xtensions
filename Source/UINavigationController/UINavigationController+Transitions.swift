//
//  UINavigationController+Transitions.swift
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


public enum AnimationType: String {
    case fade   = "fade"
    case moveIn = "moveIn"
    case push   = "push"
    case reveal = "reveal"
}


extension UINavigationController {
    
    public static let defaultAnimationDuration = 0.3
    
    
    // MARK: - Helpers
    private func defaultTransition(type: AnimationType, duration: Double = defaultAnimationDuration) -> CATransition {
        let transition = CATransition()
        transition.duration = duration
#if swift(>=4.2)
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        CATransitionType(rawValue: type.rawValue)
#elseif swift(>=4.1)
        transition.timingFunction = CAMediaTimingFunction(name: "easeInEaseOut")
        switch type {
        case .fade:     transition.type = kCATransitionFade
        case .moveIn:   transition.type = kCATransitionMoveIn
        case .push:     transition.type = kCATransitionPush
        case .reveal:   transition.type = kCATransitionReveal
        }
#endif
        return transition
    }
    
    private func addDefaultTransitionToLayer(type: AnimationType, duration: Double = defaultAnimationDuration) {
        view.layer.add(defaultTransition(type: type, duration: duration), forKey: nil)
    }
    
    
    // MARK: - Push animations
    public func pushFadeViewController(_ viewController: UIViewController, duration: Double = defaultAnimationDuration) {
        pushViewController(viewController, duration: duration, animation: .fade)
    }
    
    public func pushViewController(_ viewController: UIViewController, duration: Double = defaultAnimationDuration, animation type: AnimationType = .fade) {
        addDefaultTransitionToLayer(type: type, duration: duration)
        pushViewController(viewController, animated: false)
    }
    
    
    // MARK: - Pop animations
    public func popFadeViewController(duration: Double = 0.3) {
        addDefaultTransitionToLayer(type: .fade, duration: duration)
        popViewController(animated: false)
    }
    
    public func popFadeToRootViewController(duration: Double = 0.3) {
        addDefaultTransitionToLayer(type: .fade, duration: duration)
        popToRootViewController(animated: false)
    }
    
    public func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({ $0.isKind(of: ofClass) }).last {
            popToViewController(vc, animated: animated)
        }
    }
    
    
    // MARK: - Reset animations
    public func resetRootViewController(_ viewController: UIViewController, shouldFade: Bool = false) {
        viewControllers.insert(viewController, at: 0)
        setViewControllers(viewControllers, animated: false)
        
        if shouldFade {
            popFadeToRootViewController()
        }
    }
    
    
    // MARK: - Replace
    public func replaceCurrent(with viewController: UIViewController, duration: Double = defaultAnimationDuration) {
        replaceControllers(upTo: 1, with: viewController, duration: duration)
    }
    
    private func replaceControllers(upTo: Int, with viewController: UIViewController, duration: Double = defaultAnimationDuration, animation type: AnimationType = .fade) {
        let controllerIndex = max(0, viewControllers.count - upTo)
        viewControllers.insert(viewController, at: controllerIndex)
        setViewControllers(viewControllers, animated: false)
        
        addDefaultTransitionToLayer(type: type)
        popToViewController(viewController, animated: false)
    }
    
}
