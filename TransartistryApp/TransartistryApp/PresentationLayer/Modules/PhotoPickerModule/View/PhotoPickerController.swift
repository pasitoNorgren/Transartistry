import UIKit

final class PhotoPickerController: UIImagePickerController, PhotoPickerModule {
    
    // MARK: - PhotoPickerModule
    
    var onClose: VoidClosure?
    var onPhotoPicked: ParameterClosure<PhotoResult>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    private func closeModule() {
        onClose?()
    }
    
    private func didFinishPicking(image: UIImage?) {
        guard let image = image else {
            handlePickingResult(with: .failure(.extracting))
            return
        }
        
        do {
            let originalImage = try Photo(image: image)
            handlePickingResult(with: .success(originalImage))
        } catch let error as PhotoPickingError {
            handlePickingResult(with: .failure(error))
        } catch {
            handlePickingResult(with: .failure(.unexpected))
        }
    }
    
    private func handlePickingResult(with result: PhotoResult) {
        onPhotoPicked?(result)
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
