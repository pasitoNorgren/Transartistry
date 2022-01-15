//
//  PhotoPickerInteractor.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import Foundation

protocol PhotoPickerInteractorProtocol: AnyObject {
    func makeRequest(request: PhotoPicker.Model.RequestType)
}

protocol PhotoPickerDataStoreProtocol: AnyObject {
    var takenImage: URL? { get set }
}

final class PhotoPickerInteractor: PhotoPickerInteractorProtocol, PhotoPickerDataStoreProtocol {
    
    var presenter: PhotoPickerPresenterProtocol?
    var router: PhotoPickerRouterProtocol?
    
    var takenImage: URL?
    
    func makeRequest(request: PhotoPicker.Model.RequestType) {
        switch request {
        case .saveImageDataLocally(let data):
            takenImage = data
        case .showAlert(let type):
            presenter?.presentAlert(of: type)
        case .navigateToEditorModule:
            router?.navigateToEditor()
        case .shouldShowActivityIndicator(let decision):
            presenter?.shouldDisplayActivityIndicator(decision: decision)
        }
    }
}
