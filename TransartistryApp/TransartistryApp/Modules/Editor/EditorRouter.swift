//
//  EditorRouter.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 07.01.2022.
//

import UIKit

protocol EditorRouterProtocol {
    func navigateToPhotoPicker()
}

class EditorRouter: EditorRouterProtocol {
    
    private enum Constants {
        static let animationDuration: TimeInterval = 0.3
    }
    
    weak var dataStore: EditorDataStoreProtocol?
    
    func navigateToPhotoPicker() {
        let photoPickerAssembly: Presentable = PhotoPickerModuleAssembly()
        let photoPickerVC = photoPickerAssembly.configureModule()
        
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let window = appDelegate.window
        else {
            return
        }

        window.rootViewController = photoPickerVC
        
        UIView.transition(
            with: window,
            duration: Constants.animationDuration,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
}
