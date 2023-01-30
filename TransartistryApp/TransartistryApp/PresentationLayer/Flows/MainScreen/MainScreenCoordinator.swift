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
        router.push(module)
    }
}
