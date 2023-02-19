import RxCocoa

protocol PhotoResultPresentable {
    var photoResultDriver: Driver<PhotoResult> { get }
}
