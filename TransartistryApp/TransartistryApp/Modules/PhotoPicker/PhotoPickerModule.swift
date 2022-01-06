//
//  PhotoPickerModule.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import UIKit

protocol PhotoPickerModuleProtocol {
    func configureModule() -> UIViewController
}

class PhotoPickerModuleAssembly: PhotoPickerModuleProtocol {

    func configureModule() -> UIViewController {
        let viewController = PhotoPickerViewController()
        let interactor = PhotoPickerInteractor()
        let presenter = PhotoPickerPresenter()
        let router = PhotoPickerRouter()

        viewController.interactor = interactor
        viewController.router = router

        interactor.presenter = presenter
        interactor.router = router

        presenter.viewController = viewController
        
        router.dataStore = interactor
        return viewController
    }
}
