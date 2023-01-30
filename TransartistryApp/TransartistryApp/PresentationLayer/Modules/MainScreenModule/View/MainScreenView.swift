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
            $0.top.equalTo(safeArea).inset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.7)
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.2)
        }
        
        temporaryRouteButtonView.snp.makeConstraints {
            $0.top.equalTo(appNameLabel.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .white
        
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.tintColor = .black
        
        appNameLabel.wrappedView.text = "transartistry".uppercased()
        appNameLabel.wrappedView.textColor = .black
        appNameLabel.wrappedView.font = .systemFont(ofSize: 25, weight: .bold)
        appNameLabel.wrappedView.textAlignment = .center
    }
}
