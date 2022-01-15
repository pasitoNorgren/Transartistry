//
//  PhotoPickerModels.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import Foundation

enum PhotoPicker {
    enum Model {
        enum RequestType {
            case saveImageDataLocally(data: URL?)
            case showAlert(type: AlertType)
            case navigateToEditorModule
            case shouldShowActivityIndicator(decision: Bool)
        }
        
        enum ButtonType {
            case takePhoto
            case choosePhoto
        }
    }
}
