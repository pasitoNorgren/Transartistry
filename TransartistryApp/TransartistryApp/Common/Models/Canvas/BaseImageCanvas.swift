import SnapKit
import PencilKit
import UIKit.UIImageView

class BaseImageCanvas<Model: ImageCanvasConfigurable>: PKCanvasView,
                                                       ViewLayerConfigurable,
                                                       ConfigurableView {
    
    // MARK: - Private properties
    
    private let imageView = UIImageView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeViewLayerBaseConfiguration()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewLayerConfigurable
    
    func configureSubviewsAdding() {
        let contentView = subviews[.zero]
        contentView.insertSubview(imageView, at: .zero)
    }
    
    func configureLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureAppearance() {
        isScrollEnabled = false
        backgroundColor = .clear
        drawingPolicy = .anyInput
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        setupConfiguration(to: imageView)
    }
    
    func configureLocalization() {
        // override in subclass
    }
    
    func bindComponents() {
        // override in subclass
    }
    
    func setupConfiguration(to imageView: UIImageView) {
        // override in subclass if needed
    }
    
    // MARK: - ConfigurableView
    
    func configure(with model: Model) {
        configureImage(with: model.image)
        configureInkTool(with: model.inkingTool)
    }
    
    func configureImage(with photo: Photo?) {
        if let data = photo?.imageData {
            imageView.image = data.convertIntoUIImage()
        }
    }
    
    func configureInkTool(with model: InkingTool?) {
        if let inkTool = model {
            tool = convert(from: inkTool)
        }
    }
}
