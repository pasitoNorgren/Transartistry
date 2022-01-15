//
//  PhotoPickerViewController.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import UIKit
import SnapKit

protocol PhotoPickerViewControllerProtocol: AnyObject {
    func displayAlert(vc: UIViewController)
    func displayActivityIndicator(decision: Bool)
}

final class PhotoPickerViewController: UIViewController {
    
    private enum Constants {
        static let viewBackgroundColor: UIColor = UIColor.photoPickerBackgroundColor
    }
    
    var interactor: PhotoPickerInteractorProtocol?
    
    // MARK: - Private properties
    
    private let photoPickerStackUI: PhotoPickerStackActionReceiverProtocol = PhotoPickerStackView()
    
    private let takePhotoVC: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = false
        return picker
    }()
    
    private let cameraRollPickerVC: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        return picker
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCurrentViewController()
        setupDelegates()
        setupUI()
    }
    
    // MARK: - Private methods
    private func configureCurrentViewController() {
        view.backgroundColor = Constants.viewBackgroundColor
    }
    
    private func setupDelegates() {
        takePhotoVC.delegate = self
        cameraRollPickerVC.delegate = self
        photoPickerStackUI.delegate = self
    }
    private func setupUI() {
        setupStackView()
    }
    
    private func setupStackView() {
        guard let pickerStack = photoPickerStackUI as? UIStackView else {
            return
        }
        view.addSubview(pickerStack)
        pickerStack.snp.makeConstraints { stack in
            stack.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func passChoosenImageToDataStore(data: URL?) {
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
        shouldShowActivityIndicator(decision: false)
        interactor?.makeRequest(request: .showAlert(type: type))
    }
    
    private func navigateToTheNextModule(destination: PhotoPicker.Model.RequestType) {
        interactor?.makeRequest(request: destination)
    }
    
    private func shouldShowActivityIndicator(decision: Bool) {
        interactor?.makeRequest(request: .shouldShowActivityIndicator(decision: decision))
    }
}

// MARK: - PhotoPickerStackActionDelegate

extension PhotoPickerViewController: PhotoPickerStackActionDelegate {
    func buttonTapped(to buttonType: PhotoPicker.Model.ButtonType) {
        presentViewControllerToShowAccording(to: buttonType)
    }
}

// MARK: - PhotoPickerViewControllerProtocol

extension PhotoPickerViewController: PhotoPickerViewControllerProtocol {
    func displayAlert(vc: UIViewController) {
        present(viewController: vc)
    }
    
    func displayActivityIndicator(decision: Bool) {
        photoPickerStackUI.displayActivityIndicator(decision)
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate

extension PhotoPickerViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        interactor?.makeRequest(request: .shouldShowActivityIndicator(decision: false))
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        shouldShowActivityIndicator(decision: true)
        picker.dismiss(animated: true) { [weak self] in
            
            guard let self = self else {
                return
            }
            var imageURL: URL?
            
            if picker.sourceType == .camera {
                let imageManager: CameraImageProcesssor = ImageProcessorManager()
                guard
                    let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
                    let data = image.pngData()
                else {
                    self.presentAlert(of: .defaultAlert)
                    return
                }
                imageURL = imageManager.saveImageAsDataAtTemporaryDirectory(data: data)
            } else if picker.sourceType == .photoLibrary {
                guard let urlImage = info[UIImagePickerController.InfoKey.imageURL] as? URL else {
                    self.presentAlert(of: .defaultAlert)
                    return
                }
                imageURL = urlImage
            }
            self.passChoosenImageToDataStore(data: imageURL)
            self.navigateToTheNextModule(destination: .navigateToEditorModule)
        }
    }
}
