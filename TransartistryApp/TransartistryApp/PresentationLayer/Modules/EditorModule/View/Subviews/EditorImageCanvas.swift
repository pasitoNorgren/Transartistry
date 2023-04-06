import UIKit.UIImageView

final class EditorImageCanvas: BaseImageCanvas<EditorCanvasConfiguration> {
    
    // MARK: - ViewLayerConfigurable
    
    override func configureAppearance() {
        super.configureAppearance()
        
        minimumZoomScale = Constants.canvasViewMinimumZoolScale
        maximumZoomScale = Constants.canvasViewMaximumZoolScale
    }
    
    override func setupConfiguration(to imageView: UIImageView) {
        super.setupConfiguration(to: imageView)
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
    }
}

// MARK: - Constants extension

private extension Constants {
    static let canvasViewMinimumZoolScale: CGFloat = 1
    static let canvasViewMaximumZoolScale: CGFloat = 10
}
