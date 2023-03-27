import RxSwift

final class EditorViewController<VM: EditorViewModelOutlets>: BaseCustomViewController<EditorView, VM>,
                                                              EditorModule,
                                                              DisposeBagHolder,
                                                              RoundedBackBarButtonItemSetting {
    // MARK: - DisposeBagHolder
    var disposeBag = DisposeBag()
    
    // MARK: - EditorModule
    var onClose: VoidClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRoundedBarButtonItem()
    }
}
