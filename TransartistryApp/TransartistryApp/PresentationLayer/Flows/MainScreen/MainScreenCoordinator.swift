import TICoordinatorKit

final class MainScreenCoordinator: BaseCoordinator {
    
    private let router: RootRoutable
    
    private let mainScreenFactory: MainScreenModulesFactory
    
    init(router: RootRoutable, factory: MainScreenModulesFactory = MainScreenFlowFactory()) {
        self.router = router
        self.mainScreenFactory = factory
    }
    
    override func start() {
        startMainScreenModule()
    }
    
    private func startMainScreenModule() {
        let module = mainScreenFactory.makeMainScreenModule()
        
        module.onOpenPhotoPicker = { [weak self] in
            self?.startPhotoPickerModule(with: $0)
        }
        
        module.onOpenEditor = { [weak self] in
            self?.startEditorFlow(with: $0)
        }
        
        router.push(module)
    }
    
    private func startPhotoPickerModule(with parameters: PhotoPickerParameters) {
        
        let module = mainScreenFactory.makePhotoPickerModule(with: parameters.source)
        
        let onCloseModule: VoidClosure? = { [weak router] in
            router?.dismissModule()
        }
        
        module.onClose = onCloseModule
        
        module.onCloseWithCondition = { [weak distributor = parameters.distributor] in
            onCloseModule?()
            distributor?.publish(item: .failure(.void))
        }
        
        module.onPhotoPicked = { [weak distributor = parameters.distributor] photo in
            distributor?.publish(item: photo)
        }
        
        router.present(module)
    }
    
    private func startEditorFlow(with photo: Photo) {
        let editorConfiguration = EditorConfiguration(photo: photo)
        
        let coordinator = EditorCoordinator(router: router)
        bindTo(coordinator).start(with: editorConfiguration)
    }
}
