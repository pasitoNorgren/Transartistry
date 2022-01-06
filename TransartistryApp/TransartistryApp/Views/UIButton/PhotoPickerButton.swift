//
//  PhotoPickerButton.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 03.01.2022.
//

import UIKit

class PhotoPickerButton: UIButton {
    
    private enum Constants {
        static let roundingMultiplier: CGFloat = 4
        static let numberOfLines: Int = 1
        static let minimumScaleFactor: CGFloat = 0.25
        static let fontSize: CGFloat  = 17
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners()
    }
    
    private func configureButton() {
        clipsToBounds = true
        
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.numberOfLines = Constants.numberOfLines
        titleLabel?.minimumScaleFactor = Constants.minimumScaleFactor
        
        setTitleColor(.white, for: .normal)
        setTitleColor(.gray, for: .highlighted)
        
        titleLabel?.font = .boldSystemFont(ofSize: Constants.fontSize)
    }
    
    private func roundCorners() {
        layer.cornerRadius = frame.height/Constants.roundingMultiplier
    }
}
