//
//  PhotoPickerInteractor.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import Foundation

protocol PhotoPickerInteractorProtocol {
    func makeRequest(request: PhotoPicker.Model.RequestType)
}

protocol PhotoPickerDataStoreProtocol {
    var takenImage: Data? { get set }
}

class PhotoPickerInteractor: PhotoPickerInteractorProtocol, PhotoPickerDataStoreProtocol {
    
    var presenter: PhotoPickerPresenterProtocol?
    var router: PhotoPickerRouterProtocol?
    
    var takenImage: Data?
    
    func makeRequest(request: PhotoPicker.Model.RequestType) {
        switch request {
        case .saveImageDataLocally(let data):
            takenImage = data
        case .showAlert(let type):
            presenter?.presentAlert(of: type)
        }
    }
}
