//
//  UINavigationController+Transitions.swift
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


enum AnimationType: String {
    case fade   = "fade"
    case moveIn = "moveIn"
    case push   = "push"
    case reveal = "reveal"
}


extension UINavigationController {
    
    private static var defaultAnimationDuration = 0.3
    
    
    // MARK: - Helpers
    private func defaultTransition(type: AnimationType, duration: Double = defaultAnimationDuration) -> CATransition {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: "easeInEaseOut")
        transition.type = type.rawValue
        return transition
    }
    
    private func addDefaultTransitionToLayer(type: AnimationType, duration: Double = defaultAnimationDuration) {
        view.layer.add(defaultTransition(type: type, duration: duration), forKey: nil)
    }
    
    
    // MARK: - Push animations
    func pushFadeViewController(_ viewController: UIViewController, duration: Double = defaultAnimationDuration) {
        pushViewController(viewController, duration: duration, animation: .fade)
    }
    
    func pushViewController(_ viewController: UIViewController, duration: Double = defaultAnimationDuration, animation type: AnimationType = .fade) {
        addDefaultTransitionToLayer(type: type, duration: duration)
        pushViewController(viewController, animated: false)
    }
    
    
    // MARK: - Pop animations
    func popFadeViewController(duration: Double = 0.3) {
        addDefaultTransitionToLayer(type: .fade, duration: duration)
        popViewController(animated: false)
    }
    
    func popFadeToRootViewController(duration: Double = 0.3) {
        addDefaultTransitionToLayer(type: .fade, duration: duration)
        popToRootViewController(animated: false)
    }
    
    
    // MARK: - Reset animations
    func resetRootViewController(_ viewController: UIViewController, shouldFade: Bool = false) {
        viewControllers.insert(viewController, at: 0)
        setViewControllers(viewControllers, animated: false)
        
        if shouldFade {
            popFadeToRootViewController()
        }
    }
    
    
    // MARK: - Replace
    func replaceCurrent(with viewController: UIViewController, duration: Double = defaultAnimationDuration) {
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