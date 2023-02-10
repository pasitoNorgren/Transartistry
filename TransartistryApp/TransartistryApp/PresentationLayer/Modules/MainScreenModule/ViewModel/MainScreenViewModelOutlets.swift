import RxCocoa

protocol MainScreenViewModelOutlets: ViewModelOutlets {
    var cameraPickerDriver: Driver<PhotoDistributor> { get }
    
    func cameraPickerButtonTapped()
}
