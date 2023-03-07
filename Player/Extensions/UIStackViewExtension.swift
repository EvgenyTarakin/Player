//
//  UIStackViewExtension.swift
//  Player
//
//  Created by Евгений Таракин on 07.03.2023.
//

import UIKit

extension UIStackView {
    func setupStackViewParameters(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, aligment: UIStackView.Alignment = .fill) {
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = aligment
    }
}
