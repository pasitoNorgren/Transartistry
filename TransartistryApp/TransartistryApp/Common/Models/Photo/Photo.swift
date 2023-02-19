import UIKit.UIImage

struct Photo {
    
    let imageData: Data
    
    init(imageData: Data) {
        self.imageData = imageData
    }
    
    init(image: UIImage) throws {
        
        guard let data = image.convertToData() else {
            throw PhotoPickingError.converting
        }
        
        imageData = data
    }
}
