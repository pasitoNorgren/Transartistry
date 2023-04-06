import PencilKit.PKCanvasView

extension PKCanvasView {
    
    func convert(from model: InkingTool) -> PKInkingTool {
        
        let inkType = convertInkType(with: model.inkType)
        let color = convertInkColor(with: model.color)
        let width = model.width
        
        return .init(inkType, color: color, width: width)
    }
    
    private func convertInkType(with inkType: InkTypeModel) -> PKInkingTool.InkType {
        switch inkType {
        case .marker:
            return .marker
        case .pencil:
            return .pencil
        case .pen:
            return .pen
        }
    }
    
    private func convertInkColor(with color: InkColor) -> UIColor {
        switch color {
        case .white:
            return .white
        }
    }
}
