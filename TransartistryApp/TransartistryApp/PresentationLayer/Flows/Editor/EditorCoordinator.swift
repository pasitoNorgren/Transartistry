import TICoordinatorKit

final class EditorCoordinator: BaseCoordinator {
    
    private let router: RootRoutable
    
    private let factory: EditorFlowFactoring
    
    init(router: RootRoutable, factory: EditorFlowFactoring = EditorFlowFactory()) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        startEditorModule()
    }
    
    private func startEditorModule() {
        
        let module = factory.makeEditorModule()
        
        module.onClose = { [weak router] in
            router?.popModule()
        }
        
        router.push(module)
    }
}
