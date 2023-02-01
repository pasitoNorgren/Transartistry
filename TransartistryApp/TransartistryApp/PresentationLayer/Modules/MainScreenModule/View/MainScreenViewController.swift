import RxSwift

final class MainScreenViewController<VM: MainScreenViewModelOutlets>: BaseCustomViewController<MainScreenView, VM>,
                                                                      DisposeBagHolder,
                                                                      MainScreenModule {
    // MARK: - DisposeBagHolder
    var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - MainScreenModule
    var onOpenCamera: VoidClosure?
    var onOpenPhotoLibrary: VoidClosure?
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func bindComponents() {
        super.bindComponents()
        
        customView.rx.cameraPickerButtonTap
            .asObservable()
            .throttle(.seconds(2), scheduler: MainScheduler.instance)
            .subscribe(with: viewModel, onNext: { owner, _ in
                owner.cameraPickerButtonTapped()
            })
            .disposed(by: disposeBag)
        
        customView.rx.photoPickerButtonTap
            .asObservable()
            .throttle(.seconds(2), scheduler: MainScheduler.instance)
            .subscribe(with: viewModel, onNext: { owner, _ in
                owner.photoPickerButtonTapped()
            })
            .disposed(by: disposeBag)
        
        viewModel
            .cameraPickerDriver
            .drive(with: self, onNext: { owner, _ in
                owner.onOpenCamera?()
            })
            .disposed(by: disposeBag)
        
        viewModel
            .photoPickerDriver
            .drive(with: self, onNext: { owner, _ in
                owner.onOpenPhotoLibrary?()
            })
            .disposed(by: disposeBag)
    }
}
