import Foundation

struct InkingTool {
    let inkType: InkTypeModel
    let color: InkColor
    let width: CGFloat
    
    init(inkType: InkTypeModel = .marker, color: InkColor = .white, width: CGFloat = 25) {
        self.inkType = inkType
        self.color = color
        self.width = width
    }
}
