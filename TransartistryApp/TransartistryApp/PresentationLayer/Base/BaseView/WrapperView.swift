import UIKit
import SnapKit

final class WrapperView<WrappedViewType: UIView>: BaseView {
    
    private let insets: UIEdgeInsets

    let wrappedView = WrappedViewType()
    
    init(insets: UIEdgeInsets) {
        self.insets = insets
        super.init(frame: .zero)
    }
    
    override func configureSubviewsAdding() {
        super.configureSubviewsAdding()

        addSubview(wrappedView)
    }
    
    override func configureLayout() {
        super.configureLayout()

        wrappedView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(insets)
        }
    }
}
