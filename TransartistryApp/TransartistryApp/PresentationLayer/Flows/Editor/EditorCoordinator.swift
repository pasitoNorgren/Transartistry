import TICoordinatorKit

final class EditorCoordinator: BaseCoordinator {
    
    private let router: RootRoutable
    
    private let factory: EditorFlowFactoring
    
    init(router: RootRoutable, factory: EditorFlowFactoring = EditorFlowFactory()) {
        self.router = router
        self.factory = factory
    }
    
    @available(*, unavailable)
    override func start() {}
    
    func start(with configuration: EditorConfigurable) {
        startEditorModule(with: configuration)
    }
    
    private func startEditorModule(with configuration: EditorConfigurable) {
        
        let module = factory.makeEditorModule(configuration: configuration)
        
        module.onClose = { [weak self] in
            self?.router.popModule()
            self?.finishFlow()
        }
        
        router.push(module)
    }
}
