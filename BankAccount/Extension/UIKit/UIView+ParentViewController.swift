//
//  UIView+ParentViewController.swift
//  Infoscope
//
//  Created by Eugene Syrtcov on 2/23/20.
//  Copyright © 2020 Infoscope. All rights reserved.
//

import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
