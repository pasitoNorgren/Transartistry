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
            case saveImageDataLocally(data: Data)
            case showAlert(type: AlertType)
        }
        
        enum ButtonType {
            case takePhoto
            case choosePhoto
        }
    }
}
