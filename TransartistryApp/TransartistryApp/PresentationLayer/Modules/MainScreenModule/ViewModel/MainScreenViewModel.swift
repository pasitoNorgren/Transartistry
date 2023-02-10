import RxSwift
import RxCocoa
import RxRelay

final class MainScreenViewModel: BaseViewModel,
                                 DisposeBagHolder,
                                 MainScreenViewModelOutlets {
    
    private let cameraPickerRelay = PublishRelay<PhotoDistributor>()
    
    private let cameraActivityRelay = PublishRelay<Void>()
    
    private let photoDistributor = PhotoDistributor()
    
    // MARK: - DisposeBagHolder
    
    var disposeBag = DisposeBag()
    
    // MARK: - MainScreenViewModelOutlets
    
    var cameraPickerDriver: Driver<PhotoDistributor> {
        cameraPickerRelay.asDriver(onErrorDriveWith: .never())
    }
    
    func cameraPickerButtonTapped() {
        cameraActivityRelay.accept(())
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
