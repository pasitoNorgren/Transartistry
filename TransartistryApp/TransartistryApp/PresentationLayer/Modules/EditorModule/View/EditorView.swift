import SnapKit
import RxSwift

final class EditorView: BaseView {
    
    // MARK: - Private properties
    
    fileprivate let imageCanvas = EditorImageCanvas()
    
    // MARK: - ViewLayerConfigurable
    
    override func configureSubviewsAdding() {
        super.configureSubviewsAdding()
        
        addSubview(imageCanvas)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        imageCanvas.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeArea)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .whiteLM
    }
}

// MARK: - Reactive extension

extension Reactive where Base: EditorView {
    var canvasConfiguration: Binder<ImageCanvasConfigurable> {
        Binder(self.base) { base, configuration in
            if let config = configuration as? EditorImageCanvas.ModelType {
                base.imageCanvas.configure(with: config)
            }
        }
    }
}
