import RxSwift
import RxCocoa

final class EditorViewController<VM: EditorViewModelOutlets>: BaseCustomViewController<EditorView, VM>,
                                                              EditorModule,
                                                              DisposeBagHolder,
                                                              RoundedBackBarButtonItemSetting {
    // MARK: - DisposeBagHolder
    
    var disposeBag = DisposeBag()
    
    // MARK: - EditorModule
    
    var onClose: VoidClosure?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRoundedBarButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewWillAppear()
    }
    
    // MARK: - ViewLayerConfigurable
    
    override func bindComponents() {
        super.bindComponents()
        
        viewModel.canvasConfigurationDriver
            .drive(customView.rx.canvasConfiguration)
            .disposed(by: disposeBag)
    }
}
