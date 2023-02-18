import RxSwift
import RxCocoa
import RxRelay

final class MainScreenViewModel: BaseViewModel,
                                 DisposeBagHolder,
                                 MainScreenViewModelOutlets {
    
    private let photoPickerManager: PhotoPicking = PhotoPickerManager()
    
    private let animationActivityDistributor = Distributor<Bool>()
    private let interactionActivityDistributor = Distributor<Bool>()
    
    // MARK: - DisposeBagHolder
    
    var disposeBag = DisposeBag()
    
    // MARK: - MainScreenViewModelOutlets
    
    var animationIndicationActivityDriver: Driver<Bool> {
        animationActivityDistributor.distributionDriver
    }
    
    var interactionIndicationActivityDriver: Driver<Bool> {
        interactionActivityDistributor.distributionDriver
    }
    
    var photoPickerOpenerDriver: Driver<PhotoPickerParameters> {
        photoPickerManager.photoPickerOpenerDriver
    }
    
    func pickPhoto(with source: PhotoPickerSource) {
        photoPickerManager.pickPhoto(with: source)
    }
    
    private func trackIndicatingActvity(_ isStart: Bool) {
        trackAnimationActivity(isStart)
        trackInteractionActivity(!isStart)
    }
    
    private func trackAnimationActivity(_ isActive: Bool) {
        animationActivityDistributor.publish(item: isActive)
    }
    
    private func trackInteractionActivity(_ isEnabled: Bool) {
        interactionActivityDistributor.publish(item: isEnabled)
    }
}
