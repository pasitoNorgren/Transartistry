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
            $0.top.equalTo(safeArea).inset(Constants.inset8)
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
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(Constants.generalWidthMultiplier)
            $0.height.equalTo(Constants.defaultButtonHeight48)
            $0.bottom.equalTo(safeArea).inset(Constants.inset32)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .whiteLM
        
        logoImageView.tintColor = .blackLM
        logoImageView.contentMode = .scaleAspectFit
        
        temporaryRouteButtonView.wrappedView.backgroundColor = .blackLM
        temporaryRouteButtonView.wrappedView.layer.cornerRadius = Constants.cornerRadius10
        temporaryRouteButtonView.wrappedView.titleLabel?.font = .boldFont(of: Constants.routeButtonFont)
        temporaryRouteButtonView.wrappedView.setTitleColor(.whiteLM, for: .normal)
        temporaryRouteButtonView.wrappedView.setTitleColor(.purple, for: .highlighted)
    }
    
    override func configureLocalization() {
        super.configureLocalization()
        
        appNameLabel.wrappedView.attributedText = .mainScreenAppNameAttributed(string: .appName)
        
        temporaryRouteButtonView.wrappedView.setTitle(.routeToEditorString, for: .normal)
    }
}

private extension Constants {
    static let generalWidthMultiplier: CGFloat = 0.7
    static let logoImageViewHeightMultiplier: CGFloat = 0.5
    static let appNameLabelHeightMultiplier: CGFloat = 0.2
    static let routeButtonFont: CGFloat = 16
}
