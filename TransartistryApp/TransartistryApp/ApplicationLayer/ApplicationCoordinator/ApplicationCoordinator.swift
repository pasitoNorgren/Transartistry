import TICoordinatorKit

class ApplicationCoordinator: BaseCoordinator {
    
    private let router: ApplicationRouter
    
    init(router: ApplicationRouter) {
        self.router = router
    }

    override func start() {
        startMainScreenFlow()
    }

    private func startMainScreenFlow() {
        let coordinator = MainScreenCoordinator(router: router.setupRootRouter())
        bindTo(coordinator).start()
    }
}
