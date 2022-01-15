//
//  EditorModule.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 07.01.2022.
//

import UIKit

protocol EditorModuleProtocol {
//    func passChosenImageToEditor(data: Data?)
    func passChosenImageToEditor(data: URL?)
}

class EditorModuleAssembly: Presentable, EditorModuleProtocol {
    
    private var interactor: EditorInteractor?
    
    func configureModule() -> UIViewController {
        let viewController = EditorViewController()
        interactor = EditorInteractor()
        let presenter = EditorPresenter()
        let router = EditorRouter()
        
        viewController.interactor = interactor
        
        interactor?.presenter = presenter
        interactor?.router = router
        
        presenter.viewController = viewController
        
        router.dataStore = interactor
        
        return viewController
    }
    
    func passChosenImageToEditor(data: URL?) {
        interactor?.setupChosenData(data: data)
    }
}
