import RxCocoa

protocol MainScreenViewModelOutlets: ViewModelOutlets {
    var cameraPickerDriver: Driver<PhotoDistributor> { get }
    var photoPickerDriver: Driver<Void> { get }
    
    func cameraPickerButtonTapped()
    func photoPickerButtonTapped()
}
