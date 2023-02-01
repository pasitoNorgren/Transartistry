import RxSwift
import RxCocoa
import RxRelay

final class MainScreenViewModel: BaseViewModel,
                                 MainScreenViewModelOutlets {
    
    private let cameraPickerRelay = PublishRelay<Void>()
    private let photoPickerRelay = PublishRelay<Void>()
    
    var cameraPickerDriver: Driver<Void> {
        cameraPickerRelay.asDriver(onErrorDriveWith: .never())
    }
    
    var photoPickerDriver: Driver<Void> {
        photoPickerRelay.asDriver(onErrorDriveWith: .never())
    }
    
    func cameraPickerButtonTapped() {
        cameraPickerRelay.accept(())
    }
    
    func photoPickerButtonTapped() {
        photoPickerRelay.accept(())
    }
}
