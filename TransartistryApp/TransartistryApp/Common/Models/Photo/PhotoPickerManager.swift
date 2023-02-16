import RxSwift
import RxCocoa

class PhotoPickerManager: BaseViewModel, DisposeBagHolder, PhotoPicking {
    
    private let photoDistributor = PhotoDistributor()
    
    private let activityRelay = PublishRelay<PhotoPickerSource>()
    
    private let indicatingActivityRelay = PublishRelay<Bool>()
    
    private let photoPickerRelay = PublishRelay<PhotoPickerParameters>()
    
    // activity is about whether the user wants to take/choose a photo
    private var activityDriver: Driver<PhotoPickerSource> {
        activityRelay.asDriver(onErrorDriveWith: .never())
    }
    
    // MARK: - DisposeBagHolder
    
    var disposeBag = DisposeBag()
    
    // MARK: - PhotoPicking
    
    var photoPickerOpenerDriver: Driver<PhotoPickerParameters> {
        photoPickerRelay.asDriver(onErrorDriveWith: .never())
    }
    
    var indicatingActivityDriver: Driver<Bool> {
        indicatingActivityRelay.asDriver(onErrorDriveWith: .never())
    }
    
    func pickPhoto(with source: PhotoPickerSource) {
        activityRelay.accept(source)
    }
    
    override func bindComponents() {
        super.bindComponents()
        
        activityDriver
            .drive(with: self, onNext: { owner, sourceType in
                owner.openPhotoPicker(source: sourceType)
            })
            .disposed(by: disposeBag)
        
        photoDistributor.distributionDriver
            .drive(with: self, onNext: { owner, result in
                owner.handlePhotoDistribution(result: result)
            })
            .disposed(by: disposeBag)
    }
    
    private func openPhotoPicker(source: PhotoPickerSource) {
        trackIndicatingActivity(true)
        
        photoPickerRelay.accept((photoDistributor, source))
    }
    
    private func trackIndicatingActivity(_ isActive: Bool) {
        indicatingActivityRelay.accept(isActive)
    }
    
    private func handlePhotoDistribution(result: PhotoResult) {
        trackIndicatingActivity(false)
    }
}
