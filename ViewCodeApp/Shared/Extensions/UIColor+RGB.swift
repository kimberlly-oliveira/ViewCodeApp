//
//  UIColor+RGB.swift
//  ViewCodeApp
//
//  Created by Kimberlly Castro on 26/01/23.
//

import UIKit

extension UIColor{
    convenience init(r:CGFloat, g:CGFloat, b: CGFloat, alpha:CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}


