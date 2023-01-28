import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private lazy var applicationCoordinator = ApplicationCoordinator(router: ApplicationRouter(window: appWindow))

    private(set) lazy var appWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        return window
    }()

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        applicationCoordinator.start()
        return true
    }
}
