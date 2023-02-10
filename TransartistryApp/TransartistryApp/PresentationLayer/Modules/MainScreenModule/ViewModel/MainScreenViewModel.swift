import RxSwift
import RxCocoa
import RxRelay

final class MainScreenViewModel: BaseViewModel,
                                 DisposeBagHolder,
                                 MainScreenViewModelOutlets {
    
    private let cameraPickerRelay = PublishRelay<PhotoDistributor>()
    private let photoPickerRelay = PublishRelay<Void>()
    
    private let cameraActivityRelay = PublishRelay<Void>()
    
    private let photoDistributor = PhotoDistributor()
    
    // MARK: - DisposeBagHolder
    
    var disposeBag = DisposeBag()
    
    // MARK: - MainScreenViewModelOutlets
    
    var cameraPickerDriver: Driver<PhotoDistributor> {
        cameraPickerRelay.asDriver(onErrorDriveWith: .never())
    }
    
    var photoPickerDriver: Driver<Void> {
        photoPickerRelay.asDriver(onErrorDriveWith: .never())
    }
    
    func cameraPickerButtonTapped() {
        cameraActivityRelay.accept(())
    }
    
    func photoPickerButtonTapped() {
        photoPickerRelay.accept(())
    }
    
    override func bindComponents() {
        super.bindComponents()
        
        cameraActivityRelay.asObservable()
            .subscribe(with: self, onNext: { owner, _ in
                owner.openCameraPicker()
            })
            .disposed(by: disposeBag)
    }
    
    private func openCameraPicker() {
        photoDistributor.reset()
        cameraPickerRelay.accept(photoDistributor)
    }
}
