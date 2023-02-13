import RxSwift
import RxCocoa
import RxRelay

final class MainScreenViewModel: BaseViewModel,
                                 DisposeBagHolder,
                                 MainScreenViewModelOutlets {
    
    private let photoPickerManager: PhotoPicking = PhotoPickerManager()
    
    // MARK: - DisposeBagHolder
    
    var disposeBag = DisposeBag()
    
    // MARK: - MainScreenViewModelOutlets
    
    var photoPickerOpenerDriver: Driver<PhotoPickerParameters> {
        photoPickerManager.photoPickerOpenerDriver
    }
    
    func pickPhoto(with source: PhotoPickerSource) {
        photoPickerManager.pickPhoto(with: source)
    }
}
