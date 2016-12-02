//
//  UIView.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 12/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    func constrainTo(_ view: UIView, multiplier: CGFloat = 1){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
        self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
    }
}
