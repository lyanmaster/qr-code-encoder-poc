//
//  CodeView.swift
//  PlaygroundSimulator
//
//  Created by Lyan Masterson on 12/11/20.
//

import Foundation

/// Protocol used to implement ViewCode
public protocol CodeView {
    func setupComponents()
    func setupConstraints()
    func setupExtraConfiguration()
    func setup()
}

extension CodeView {
    public func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
}
