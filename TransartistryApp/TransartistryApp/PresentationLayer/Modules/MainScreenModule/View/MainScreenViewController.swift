import RxSwift

final class MainScreenViewController<VM: MainScreenViewModelOutlets>: BaseCustomViewController<MainScreenView, VM>,
                                                                      DisposeBagHolder,
                                                                      MainScreenModule {
    // MARK: - DisposeBagHolder
    
    var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - MainScreenModule
    
    var onOpenPhotoPicker: ParameterClosure<PhotoPickerParameters>?
    
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
                owner.pickPhoto(with: .camera)
            })
            .disposed(by: disposeBag)
        
        customView.rx.imagePickerButtonTap
            .asObservable()
            .throttle(.seconds(2), scheduler: MainScheduler.instance)
            .subscribe(with: viewModel, onNext: { owner, _ in
                owner.pickPhoto(with: .imageLibrary)
            })
            .disposed(by: disposeBag)
        
        viewModel.photoPickerOpenerDriver
            .drive(with: self, onNext: { owner, parameters in
                owner.onOpenPhotoPicker?(parameters)
            })
            .disposed(by: disposeBag)
        
        // logo image view animation activity
        viewModel.animationIndicationActivityDriver
            .drive(customView.rx.isAnimating)
            .disposed(by: disposeBag)
        
        // camera/photo library buttons are isEnabled or not
        viewModel.interactionIndicationActivityDriver
            .drive(customView.rx.isButtonInteractionEnabled)
            .disposed(by: disposeBag)
        
        viewModel.alertPresentationDriver
            .drive(self.rx.alertPresentation)
            .disposed(by: disposeBag)
        
        deviceOrientationHandler
            .observe(on: MainScheduler.instance)
            .map { _ in Void() }
            .subscribe(customView.rx.orientationHandler)
            .disposed(by: disposeBag)
    }
}
