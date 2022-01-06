//
//  PhotoPickerStackView.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 03.01.2022.
//

import UIKit
import SnapKit

protocol PhotoPickerStackActionDelegate: AnyObject {
    func buttonTapped(to buttonType: PhotoPicker.Model.ButtonType)
}

class PhotoPickerStackView: UIStackView {
    
    private enum Constants {
        
        static let viewBackgroundColor: UIColor = UIColor.photoPickerBackgroundColor
        
        enum Button {
            static let takePhotoTitle: String = "takeAPhoto".localized()
            static let choosePhotoTitle: String = "chooseAPhoto".localized()
        }
        
        enum Label {
            static let numberOfLines: Int = 1
            static let appNameTitle: String = "TRANSARTISTRY"
            static let spacingBetweenLetters: Double = 10
            static let titleLabelFontSize: CGFloat = 25
            static let minimumScaleFactor: CGFloat = 0.25
            static let textColor: UIColor = UIColor.logoTintColor
        }
        
        enum StackView {
            static let spacingBetweenParts: CGFloat = 30
        }
        
        enum ImageView {
            static let logoImage: UIImage? = UIImage(systemName: "pencil")
            static let imageTintColor: UIColor = UIColor.logoTintColor
        }
        
        enum Constraints {
            static let imageViewHeightMultiplier: CGFloat = 0.5
            static let imageViewWidthMultiplier: CGFloat = 0.5
            
            static let logoLabelHeightMultiplier: CGFloat = 0.1
            static let logoLabelWidthMultiplier: CGFloat = 0.9
            
            static let buttonStackViewHeightMultiplier: CGFloat = 0.5
            static let buttonStackViewWidthMultiplier: CGFloat = 0.5
        }
    }
    
    // MARK: - Delegate
    weak var delegate: PhotoPickerStackActionDelegate?
    
    // MARK: - Private properties
    private let takePhotoButton: PhotoPickerButton = {
        let button = PhotoPickerButton()
        button.backgroundColor = .gray
        button.setTitle(Constants.Button.takePhotoTitle, for: .normal)
        return button
    }()
    
    private let cameraRollButton: PhotoPickerButton = {
        let button = PhotoPickerButton()
        button.backgroundColor = .purple
        button.setTitle(Constants.Button.choosePhotoTitle, for: .normal)
        return button
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = Constants.StackView.spacingBetweenParts
        return stackView
    }()
    
    private let logoWithImageViewAndLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.ImageView.logoImage
        imageView.tintColor = Constants.ImageView.imageTintColor
        return imageView
    }()
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = Constants.Label.appNameTitle
        label.textColor = Constants.Label.textColor
        label.numberOfLines = Constants.Label.numberOfLines
        label.minimumScaleFactor = Constants.Label.minimumScaleFactor
        label.setTextSpacingBy(value: Constants.Label.spacingBetweenLetters)
        label.font = .boldSystemFont(ofSize: Constants.Label.titleLabelFontSize)
        return label
    }()
    
    private let viewForLogoStackView: UIView = UIView()
    private let viewForButtonsStackView: UIView = UIView()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    // MARK: - Private methods
    private func configureUI() {
        configureMainStackViewProperties()
        configurePartsOfMainStackView()
        setTargetsForButtons()
    }
    
    private func configureMainStackViewProperties() {
        backgroundColor = Constants.viewBackgroundColor
        distribution = .fillEqually
        axis = .vertical
    }
    
    private func configurePartsOfMainStackView() {
        addArrangedSubviewForMainStackView()
        configureLogoView()
        configureButtonsStackView()
    }
    
    private func addArrangedSubviewForMainStackView() {
        addArrangedSubview(logoWithImageViewAndLabelStackView)
        addArrangedSubview(viewForButtonsStackView)
    }
    
    private func configureLogoView() {
        logoWithImageViewAndLabelStackView.addArrangedSubview(viewForLogoStackView)
        logoWithImageViewAndLabelStackView.addArrangedSubview(logoLabel)
        
        configureLogoImageView()
        
        logoLabel.snp.makeConstraints { label in
            label.height.equalToSuperview().multipliedBy(Constants.Constraints.logoLabelHeightMultiplier)
            label.width.equalToSuperview().multipliedBy(Constants.Constraints.logoLabelWidthMultiplier)
        }
    }
    
    private func configureLogoImageView() {
        viewForLogoStackView.addSubview(logoImageView)
        
        viewForLogoStackView.snp.makeConstraints { view in
            view.top.equalToSuperview()
            view.leading.equalToSuperview()
            view.trailing.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { imageView in
            imageView.height.equalToSuperview().multipliedBy(Constants.Constraints.imageViewHeightMultiplier)
            imageView.width.equalToSuperview().multipliedBy(Constants.Constraints.imageViewWidthMultiplier)
            imageView.center.equalToSuperview()
        }
    }
    
    private func configureButtonsStackView() {
        viewForButtonsStackView.addSubview(buttonsStackView)
        buttonsStackView.snp.makeConstraints { buttonStackView in
            buttonStackView.height.equalToSuperview().multipliedBy(Constants.Constraints.buttonStackViewHeightMultiplier)
            buttonStackView.width.equalToSuperview().multipliedBy(Constants.Constraints.buttonStackViewWidthMultiplier)
            buttonStackView.center.equalToSuperview()
        }
        addButtonsToStackView()
    }
    
    private func addButtonsToStackView() {
        buttonsStackView.addArrangedSubview(takePhotoButton)
        buttonsStackView.addArrangedSubview(cameraRollButton)
    }
    
    private func setTargetsForButtons() {
        takePhotoButton.addTarget(nil, action: #selector(takePhotoButtonTapped), for: .touchUpInside)
        cameraRollButton.addTarget(nil, action: #selector(cameraRollButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Objc methods
    
    @objc private func takePhotoButtonTapped(sender: UIButton) {
        delegate?.buttonTapped(to: .takePhoto)
    }
    
    @objc private func cameraRollButtonTapped(sender: UIButton) {
        delegate?.buttonTapped(to: .choosePhoto)
    }
}
