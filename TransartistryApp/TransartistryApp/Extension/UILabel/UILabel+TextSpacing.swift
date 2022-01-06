//
//  UILabel+TextSpacing.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 04.01.2022.
//

import UIKit

extension UILabel {
    func setTextSpacingBy(value: Double) {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(
                NSAttributedString.Key.kern,
                value: value,
                range: NSRange(location: .zero, length: attributedString.length - 1)
            )
            attributedText = attributedString
        }
    }
}
