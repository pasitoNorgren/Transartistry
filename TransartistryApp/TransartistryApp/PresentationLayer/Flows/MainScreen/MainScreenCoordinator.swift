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
        
        router.push(module)
    }
    
    private func startPhotoPickerModule(with parameters: PhotoPickerParameters) {
        
        let module = mainScreenFactory.makePhotoPickerModule(with: parameters.source)
        
        module.onClose = { [weak router] in
            router?.dismissModule()
        }
        
        module.onPhotoPicked = { [weak distributor = parameters.distributor] photo in
            distributor?.publish(photo: photo)
        }
        
        router.present(module)
    }
}
