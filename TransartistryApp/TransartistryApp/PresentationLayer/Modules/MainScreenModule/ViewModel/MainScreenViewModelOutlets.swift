import RxCocoa

protocol MainScreenViewModelOutlets: ViewModelOutlets {
    var cameraPickerDriver: Driver<Void> { get }
    var photoPickerDriver: Driver<Void> { get }
    
    func cameraPickerButtonTapped()
    func photoPickerButtonTapped()
}
