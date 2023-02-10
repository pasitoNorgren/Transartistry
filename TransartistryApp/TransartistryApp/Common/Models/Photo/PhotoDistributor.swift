import RxCocoa

final class PhotoDistributor {
    
    private let photoRelay = PublishRelay<Photo>()
    
    var photoDriver: Driver<Photo> {
        photoRelay.asDriver(onErrorDriveWith: .never())
    }
    
    func publish(photo: Photo) {
        photoRelay.accept(photo)
    }
    
    func reset() {
        photoRelay.accept(Photo())
    }
}
