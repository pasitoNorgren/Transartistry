//
//  EditorInteractor.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 07.01.2022.
//

import Foundation

protocol EditorInteractorProtocol {
    func makeRequest(request: Editor.Model.RequestType)
    func setupChosenData(data: URL?)
}

protocol EditorDataStoreProtocol: AnyObject {
    var bussinesImage: URL? { get set }
}

class EditorInteractor: EditorInteractorProtocol, EditorDataStoreProtocol {
    
    var presenter: EditorPresenterProtocol?
    var router: EditorRouterProtocol?
    
    var bussinesImage: URL?
    
    func makeRequest(request: Editor.Model.RequestType) {
        switch request {
        case .navigateToPhotoPickerModule:
            router?.navigateToPhotoPicker()
        }
    }

    func setupChosenData(data: URL?) {
        bussinesImage = data
    }
}
