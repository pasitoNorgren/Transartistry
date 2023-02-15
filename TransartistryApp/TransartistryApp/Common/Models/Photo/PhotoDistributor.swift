enum PhotoPickingError: Error {
    case extracting // photo cannot be extracted
    case converting // photo cannot be converted to data
    case unexpected
}

typealias PhotoResult = Result<Photo, PhotoPickingError>

typealias PhotoDistributor = Distributor<PhotoResult>
