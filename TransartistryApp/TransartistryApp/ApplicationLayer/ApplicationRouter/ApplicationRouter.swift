import TICoordinatorKit

class ApplicationRouter {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func setupRootRouter() -> RootRoutable {
        let navVC = UINavigationController(nibName: nil, bundle: nil)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        return RootRouter(navVC)
    }
}
