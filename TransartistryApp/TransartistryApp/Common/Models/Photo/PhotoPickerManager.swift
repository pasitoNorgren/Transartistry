import RxSwift
import RxCocoa

class PhotoPickerManager: BaseViewModel, DisposeBagHolder, PhotoPicking, PhotoResultPresentable {
    
    private let photoDistributor = PhotoDistributor()
    
    private let activityRelay = PublishRelay<PhotoPickerSource>()
    
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
    
    func pickPhoto(with source: PhotoPickerSource) {
        activityRelay.accept(source)
    }
    
    // MARK: - PhotoResultPresentable
    
    var photoResultDriver: Driver<PhotoResult> {
        photoDistributor.distributionDriver
    }
    
    override func bindComponents() {
        super.bindComponents()
        
        activityDriver
            .drive(with: self, onNext: { owner, sourceType in
                owner.openPhotoPicker(source: sourceType)
            })
            .disposed(by: disposeBag)
    }
    
    private func openPhotoPicker(source: PhotoPickerSource) {
        photoPickerRelay.accept((photoDistributor, source))
    }
}
