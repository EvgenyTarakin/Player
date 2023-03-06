//
//  UILabelExtension.swift
//  Player
//
//  Created by Евгений Таракин on 06.03.2023.
//

import UIKit

extension UILabel {
    func setupLabelParameters(text: String, size: CGFloat, textAligment: NSTextAlignment = .left) {
        self.text = text
        self.font = .systemFont(ofSize: size)
        self.textColor = .black
        self.textAlignment = textAligment
    }
}
