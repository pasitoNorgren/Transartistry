import UIKit

final class PhotoPickerController: UIImagePickerController, PhotoPickerModule {
    
    // MARK: - PhotoPickerModule
    
    var onClose: VoidClosure?
    var onCloseWithCondition: VoidClosure?
    var onPhotoPicked: ParameterClosure<PhotoResult>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    private func closeModule() {
        onClose?()
    }
    
    private func closeModuleWithCondition() {
        onCloseWithCondition?()
    }
    
    private func didFinishPicking(image: UIImage?) {
        guard let image = image else {
            handlePickingResult(with: .failure(.extracting))
            return
        }
        
        let result: PhotoResult
        
        do {
            let originalImage = try Photo(image: image)
            result = .success(originalImage)
        } catch let error as PhotoPickingError {
            result = .failure(error)
        } catch {
            result = .failure(.unexpected)
        }
        
        handlePickingResult(with: result)
    }
    
    private func handlePickingResult(with result: PhotoResult) {
        onPhotoPicked?(result)
    }
}

extension PhotoPickerController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        closeModuleWithCondition()
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        closeModule()
        
        guard picker.sourceType == .camera || picker.sourceType == .photoLibrary else {
            didFinishPicking(image: nil)
            return
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            self.didFinishPicking(image: originalImage)
        }
    }
}
