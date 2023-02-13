import UIKit

final class PhotoPickerController: UIImagePickerController, PhotoPickerModule {
    
    // MARK: - PhotoPickerModule
    
    var onClose: VoidClosure?
    var onPhotoPicked: ParameterClosure<Photo>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    private func closeModule() {
        onClose?()
    }
    
    private func didFinishPicking(image: UIImage?) {
        onPhotoPicked?(Photo(image: image))
    }
}

extension PhotoPickerController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        closeModule()
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        closeModule()
        
        guard picker.sourceType == .camera || picker.sourceType == .photoLibrary else {
            didFinishPicking(image: nil)
            return
        }
        
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            self?.didFinishPicking(image: originalImage)
        }
    }
}
