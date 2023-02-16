import RxCocoa

typealias PhotoPickerParameters = (distributor: PhotoDistributor, source: PhotoPickerSource)

enum PhotoPickerSource {
    case camera
    case imageLibrary
}

protocol PhotoPicking {
    var photoPickerOpenerDriver: Driver<PhotoPickerParameters> { get }
    var indicatingActivityDriver: Driver<Bool> { get }
    
    func pickPhoto(with source: PhotoPickerSource)
}
