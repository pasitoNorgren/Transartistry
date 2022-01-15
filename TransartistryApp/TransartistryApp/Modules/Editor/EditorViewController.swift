//
//  EditorViewController.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 07.01.2022.
//

import UIKit

protocol EditorViewControllerProtocol: AnyObject {
}

class EditorViewController: UIViewController {
    
    var interactor: EditorInteractorProtocol?
    
    //temporary button implementation
    private let closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.frame = CGRect(x: 60, y: 60, width: 60, height: 60)
        button.addTarget(self, action: #selector(closeEditorVC), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(closeButton)
    }
    
    @objc private func closeEditorVC() {
        interactor?.makeRequest(request: .navigateToPhotoPickerModule)
    }
}

extension EditorViewController: EditorViewControllerProtocol {
}
