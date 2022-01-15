//
//  PhotoPickerRouter.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import UIKit
import SnapKit

protocol PhotoPickerRouterProtocol: AnyObject {
    func navigateToEditor()
}

final class PhotoPickerRouter: PhotoPickerRouterProtocol {
    
    private enum Constants {
        static let animationDuration: TimeInterval = 0.3
    }
    
    weak var dataStore: PhotoPickerDataStoreProtocol?
    
    func navigateToEditor() {
        let editorAssembly = EditorModuleAssembly()
        let editorVC = editorAssembly.configureModule()
        
        guard let datastore = dataStore else {
            return
        }

        editorAssembly.passChosenImageToEditor(data: datastore.takenImage)
        
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let window = appDelegate.window
        else {
            return
        }

        window.rootViewController = editorVC

        UIView.transition(
            with: window,
            duration: Constants.animationDuration,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
}
