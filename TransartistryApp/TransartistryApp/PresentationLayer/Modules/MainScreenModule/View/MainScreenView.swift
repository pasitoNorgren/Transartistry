import UIKit
import SnapKit

final class MainScreenView: BaseView {
    
    private let logoImageView = UIImageView(image: .mainScreenLogo)
    private let appNameLabel = WrapperView<UILabel>(insets: .zero)
    private let temporaryRouteButtonView = WrapperView<UIButton>(insets: .zero)
    
    override func configureSubviewsAdding() {
        super.configureSubviewsAdding()
        
        addSubviews(logoImageView, appNameLabel, temporaryRouteButtonView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeArea).inset(Constants.logoImageViewTopInset)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(Constants.generalWidthMultiplier)
            $0.height.equalToSuperview().multipliedBy(Constants.logoImageViewHeightMultiplier)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(Constants.appNameLabelHeightMultiplier)
        }
        
        temporaryRouteButtonView.snp.makeConstraints {
            $0.top.equalTo(appNameLabel.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(Constants.generalWidthMultiplier)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .whiteLM
        
        logoImageView.tintColor = .blackLM
        logoImageView.contentMode = .scaleAspectFit
    }
    
    override func configureLocalization() {
        super.configureLocalization()
        
        appNameLabel.wrappedView.attributedText = .mainScreenAppNameAttributed(string: .appName)
    }
}

private enum Constants {
    static let generalWidthMultiplier: CGFloat = 0.7
    static let logoImageViewTopInset: CGFloat = 8
    static let logoImageViewHeightMultiplier: CGFloat = 0.5
    static let appNameLabelHeightMultiplier: CGFloat = 0.2
}
