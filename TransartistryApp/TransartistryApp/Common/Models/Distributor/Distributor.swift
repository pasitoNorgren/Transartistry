import RxCocoa

class Distributor<T> {
    
    private let distributionRelay = PublishRelay<T>()
    
    var distributionDriver: Driver<T> {
        distributionRelay.asDriver(onErrorDriveWith: .never())
    }
    
    func publish(item: T) {
        distributionRelay.accept(item)
    }
}
