//
//  AppButton.swift
//  ViewCodeApp
//
//  Created by Kimberlly Castro on 26/01/23.
//

import UIKit

class AppButton: UIButton {

    enum Style {
        case primary, secondary
    }
    
    var style: Style = .primary
    var title: String = ""
    
    convenience init(style: Style, title: String) {
        self.init(frame: .zero)
        self.style = style
        self.title = title
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        
        let bgColor: UIColor?
        let titleColor: UIColor
        
        switch style {
        case .primary:
            bgColor = .primaryButton
            titleColor = .primaryButtonText
        case .secondary:
            bgColor = .secondaryButton
            titleColor = .secondayButtonText
            layer.borderWidth = 2
            layer.borderColor = UIColor.secondaryButtonBorder.cgColor
        }
        
            setTitle(title, for: .normal)
            titleLabel?.font = .button
            backgroundColor = bgColor
            setTitleColor(titleColor, for: .normal)
            layer.cornerRadius = 25
            clipsToBounds = true
            translatesAutoresizingMaskIntoConstraints = false
            
        }
        
    }

