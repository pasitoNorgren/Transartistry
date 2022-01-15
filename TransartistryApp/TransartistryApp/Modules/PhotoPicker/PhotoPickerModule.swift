//
//  PhotoPickerModule.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import UIKit

final class PhotoPickerModuleAssembly: Presentable {

    func configureModule() -> UIViewController {
        let viewController = PhotoPickerViewController()
        let interactor = PhotoPickerInteractor()
        let presenter = PhotoPickerPresenter()
        let router = PhotoPickerRouter()

        viewController.interactor = interactor

        interactor.presenter = presenter
        interactor.router = router

        presenter.viewController = viewController
        
        router.dataStore = interactor
        
        return viewController
    }
}
