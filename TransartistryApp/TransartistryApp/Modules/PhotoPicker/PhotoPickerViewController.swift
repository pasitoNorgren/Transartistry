//
//  PhotoPickerViewController.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import UIKit
import SnapKit
import PhotosUI

protocol PhotoPickerViewControllerProtocol: AnyObject {
    func displayAlert(vc: UIViewController)
}

class PhotoPickerViewController: UIViewController {
    
    private enum Constants {
        static let viewBackgroundColor: UIColor = UIColor.photoPickerBackgroundColor
        
        enum PHPickerController {
            static let photosSelectionLimit: Int = 1
        }
    }
    
    var interactor: PhotoPickerInteractorProtocol?
    var router: PhotoPickerRouterProtocol?
    
    private let photoPickerStackUI = PhotoPickerStackView()
    
    private let takePhotoVC: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = false
        return picker
    }()
    
    private let cameraRollPickerVC: PHPickerViewController = {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.selectionLimit = Constants.PHPickerController.photosSelectionLimit
        configuration.filter = .images
        let vc = PHPickerViewController(configuration: configuration)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCurrentViewController()
        setupDelegates()
        setupUI()
    }
    
    private func configureCurrentViewController() {
        view.backgroundColor = Constants.viewBackgroundColor
    }
    
    private func setupDelegates() {
        cameraRollPickerVC.delegate = self
        takePhotoVC.delegate = self
        photoPickerStackUI.delegate = self
    }
    private func setupUI() {
        setupStackView()
    }
    
    private func setupStackView() {
        view.addSubview(photoPickerStackUI)
        photoPickerStackUI.snp.makeConstraints { stack in
            stack.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func passChoosenImageToDataStore(data: Data) {
        interactor?.makeRequest(request: .saveImageDataLocally(data: data))
    }
    
    private func presentViewControllerToShowAccording(to type: PhotoPicker.Model.ButtonType) {
        switch type {
        case .takePhoto:
            present(viewController: takePhotoVC)
        case .choosePhoto:
            present(viewController: cameraRollPickerVC)
        }
    }
    
    private func presentAlert(of type: AlertType) {
        interactor?.makeRequest(request: .showAlert(type: type))
    }
}

extension PhotoPickerViewController: PhotoPickerStackActionDelegate {
    func buttonTapped(to buttonType: PhotoPicker.Model.ButtonType) {
        presentViewControllerToShowAccording(to: buttonType)
    }
}

extension PhotoPickerViewController: PhotoPickerViewControllerProtocol {
    func displayAlert(vc: UIViewController) {
        present(viewController: vc)
    }
}

extension PhotoPickerViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        picker.dismiss(animated: true, completion: nil)
        
        guard
            let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let pngImage = image.pngData()
        else {
            presentAlert(of: .defaultAlert)
            return
        }
        passChoosenImageToDataStore(data: pngImage)
    }
}

extension PhotoPickerViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] reading, error in
                guard let self = self else {
                    return
                }
                
                asyncOnMainThread {
                    guard
                        let image = reading as? UIImage,
                        let pngImage = image.pngData(),
                        error == nil
                    else {
                        self.presentAlert(of: .defaultAlert)
                        return
                    }
                    self.passChoosenImageToDataStore(data: pngImage)
                }
            }
        }
    }
}
