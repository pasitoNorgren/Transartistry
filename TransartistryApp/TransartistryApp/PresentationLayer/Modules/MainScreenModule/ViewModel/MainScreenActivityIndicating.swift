import RxCocoa

protocol MainScreenActivityIndicating {
    var animationIndicationActivityDriver: Driver<Bool> { get }
    var interactionIndicationActivityDriver: Driver<Bool> { get }
}
