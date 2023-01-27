//
//  CodeView.swift
//  ViewCodeApp
//
//  Created by Kimberlly Castro on 26/01/23.
//

import Foundation

protocol CodeView {
    func setup()
    func setupComponents()
    func setupConstraints()
    func setupExtraConfiguration()
}

extension CodeView {
    func setup() {
        
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
}
