import RxSwift
import RxCocoa
import RxRelay

final class MainScreenViewModel: BaseViewModel,
                                 DisposeBagHolder,
                                 MainScreenViewModelOutlets {
    
    private let photoPickerManager: PhotoPicking & PhotoResultPresentable = PhotoPickerManager()
    
    private let animationActivityDistributor = Distributor<Bool>()
    private let interactionActivityDistributor = Distributor<Bool>()
    private let alertPresentationDistributor = Distributor<AlertDescription>()
    
    private var lastPickedSourceType: PhotoPickerSource = .camera
    private var onRepickPhoto: VoidClosure?
    
    // MARK: - DisposeBagHolder
    
    var disposeBag = DisposeBag()
    
    // MARK: - MainScreenViewModelOutlets
    
    var alertPresentationDriver: Driver<AlertDescription> {
        alertPresentationDistributor.distributionDriver
    }
    
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
        trackIndicatingActvity(true)
        
        lastPickedSourceType = source
        photoPickerManager.pickPhoto(with: source)
    }
    
    override func bindComponents() {
        super.bindComponents()
        
        onRepickPhoto = { [weak self] in
            self?.pickPhoto(with: self?.lastPickedSourceType ?? .imageLibrary)
        }
        
        photoPickerManager.photoResultDriver
            .drive(with: self, onNext: { owner, result in
                owner.handle(result: result)
            })
            .disposed(by: disposeBag)
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
    
    private func handle(result: PhotoResult) {
        
        trackIndicatingActvity(false)
        
        switch result {
        case .success:
            // handle success case later
            return
            
        case .failure(let error):
            handlePhotoPickingResult(error: error)
        }
    }
    
    private func handlePhotoPickingResult(error: PhotoPickingError) {
        
        let alertDescription: AlertDescription
        
        switch error {
        case .extracting:
            alertDescription = makePhotoPickingErrorAlertDescription(with: .extractingErrorAlertTitle)
            
        case .converting:
            alertDescription = makePhotoPickingErrorAlertDescription(with: .convertingErrorAlertTitle)
            
        case .unexpected:
            alertDescription = makePhotoPickingErrorAlertDescription(with: .fixingErrorTitle)
            
        default:
            return
        }
        
        alertPresentationDistributor.publish(item: alertDescription)
    }
}

private extension MainScreenViewModel {
    
    func makePhotoPickingErrorAlertDescription(with title: String) -> AlertDescription {
        .init(message: title,
              actions: [
                .simpleCancelAction(nil),
                .init(title: .repickTitle, style: .basic, closure: onRepickPhoto)
              ])
    }
}
