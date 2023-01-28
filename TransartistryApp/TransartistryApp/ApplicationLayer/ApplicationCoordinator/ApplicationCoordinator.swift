import TICoordinatorKit

class ApplicationCoordinator: BaseCoordinator {
    
    private let router: ApplicationRouter
    
    init(router: ApplicationRouter) {
        self.router = router
    }

    override func start() {}
}
