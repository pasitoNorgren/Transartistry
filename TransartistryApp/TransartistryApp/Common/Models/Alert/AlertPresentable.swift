import RxCocoa

protocol AlertPresentable {
    var alertPresentationDriver: Driver<AlertDescription> { get }
}
