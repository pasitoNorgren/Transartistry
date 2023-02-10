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
        
        module.onOpenCamera = { [weak self] in
            self?.startCameraPickerModule(distributor: $0)
        }
        
        module.onOpenPhotoLibrary = {
            // Open Photo Library
        }
        
        router.push(module)
    }
    
    private func startCameraPickerModule(distributor: PhotoDistributor) {
        let module = mainScreenFactory.makeCameraPickerModule()
        
        module.onClose = { [weak router] in
            router?.dismissModule()
        }
        
        module.onPhotoPicked = { [weak distributor] photo in
            distributor?.publish(photo: photo)
        }
        
        router.present(module)
    }
}
