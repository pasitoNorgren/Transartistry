//
//  UIColor+Palette.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 05.01.2022.
//

import UIKit

extension UIColor {
    
    static var logoTintColor: UIColor {
        return UIColor(named: "LogoTintColor") ?? .darkGray
    }
    
    static var photoPickerBackgroundColor: UIColor {
        return  UIColor(named: "PhotoPickerBackgroundColor") ?? .lightGray
    }
}
