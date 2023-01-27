//
//  AppStyle.swift
//  ViewCodeApp
//
//  Created by Kimberlly Castro on 26/01/23.
//

import UIKit

enum Margin {
    static let horizontal: CGFloat = 24
    static let horizontalSmall: CGFloat = 10
    static let vertical: CGFloat = 14
    static let verticalSmall: CGFloat = 10
    static let verticalLarge: CGFloat = 20
    static let verticalVeryLarge: CGFloat = 34

}

extension UIFont {
    static let title = UIFont.boldSystemFont(ofSize: 28)
    static let body = UIFont.systemFont(ofSize: 15)
    static let button = UIFont.systemFont(ofSize: 15)
}

extension UIColor {
    static let mainBlack = UIColor(named: "mainBlack")!
    static let mediumGray = UIColor(r: 124, g:124, b: 124)
    static let basePurple = UIColor(r: 97, g: 97, b: 255)
    static let ultraLightGray = UIColor(r:251, g:251, b:251)
    
    static let title = mainBlack
    static let body = mediumGray
    static let primaryButton = UIColor(named: "baseColor")
    static let primaryButtonText = systemBackground
    static let secondaryButton = systemBackground
    static let secondayButtonText = mainBlack
    static let secondaryButtonBorder = mainBlack
    static let view = ultraLightGray
}

