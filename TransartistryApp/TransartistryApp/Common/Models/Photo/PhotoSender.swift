import RxCocoa

protocol PhotoSender {
    var photoSenderDriver: Driver<Photo?> { get }
}
