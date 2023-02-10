import UIKit.UIImage

struct Photo {
    let imageData: Data?
    
    init(imageData: Data?) {
        self.imageData = imageData
    }
    
    init(image: UIImage? = nil) {
        imageData = image?.convertToData()
    }
}
