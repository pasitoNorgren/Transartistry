import RxSwift

extension UIViewController {
    var deviceOrientationHandler: Observable<Notification> {
        NotificationCenter.default.rx
            .notification(UIDevice.orientationDidChangeNotification)
            .asObservable()
    }
}
