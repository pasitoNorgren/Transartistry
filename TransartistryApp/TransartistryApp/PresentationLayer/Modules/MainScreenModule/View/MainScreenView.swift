import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class MainScreenView: BaseView {
    
    private let logoImageView = UIImageView(image: .mainScreenLogo)
    private let appNameLabel = WrapperView<UILabel>(insets: .zero)
    private let containerView = UIStackView()
    
    fileprivate let cameraPickerButtonView = WrapperView<UIButton>(insets: .zero)
    fileprivate let imagePickerButtonView = WrapperView<UIButton>(insets: .zero)
    
    override func configureSubviewsAdding() {
        super.configureSubviewsAdding()
        
        containerView.addArrangedSubviews(cameraPickerButtonView, imagePickerButtonView)
        
        addSubviews(logoImageView, appNameLabel, containerView)
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
        
        containerView.snp.makeConstraints {
            $0.bottom.equalTo(safeArea).inset(Constants.inset32)
            $0.width.equalToSuperview().multipliedBy(Constants.generalWidthMultiplier)
            $0.centerX.equalToSuperview()
        }
        
        [cameraPickerButtonView, imagePickerButtonView].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(Constants.defaultButtonHeight48)
            }
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .whiteLM
        
        logoImageView.tintColor = Constants.logoImageViewTintColor
        logoImageView.contentMode = .scaleAspectFit
        
        containerView.axis = .vertical
        containerView.spacing = Constants.inset16
        
        cameraPickerButtonView.wrappedView.backgroundColor = .whiteLM
        cameraPickerButtonView.wrappedView.setTitleColor(.blackLM, for: .normal)
        cameraPickerButtonView.wrappedView.layer.borderColor = UIColor.purple.cgColor
        cameraPickerButtonView.wrappedView.layer.borderWidth = 1
        
        imagePickerButtonView.wrappedView.backgroundColor = .blackLM
        imagePickerButtonView.wrappedView.setTitleColor(.whiteLM, for: .normal)
        
        [cameraPickerButtonView.wrappedView, imagePickerButtonView.wrappedView].forEach {
            $0.layer.cornerRadius = Constants.cornerRadius10
            $0.titleLabel?.font = .boldFont(of: Constants.actionButtonFontSize)
            $0.setTitleColor(.purple, for: .highlighted)
            $0.setTitleColor(.gray, for: .disabled)
        }
    }
    
    override func configureLocalization() {
        super.configureLocalization()
        
        appNameLabel.wrappedView.attributedText = .mainScreenAppNameAttributed(string: .appName)
        
        cameraPickerButtonView.wrappedView.setTitle(.cameraPickerButtonTitle, for: .normal)
        imagePickerButtonView.wrappedView.setTitle(.imagePickerButtonTitle, for: .normal)
    }
    
    fileprivate func configureButtonsAvailability(with isEnabled: Bool) {
        cameraPickerButtonView.wrappedView.isEnabled = isEnabled
        imagePickerButtonView.wrappedView.isEnabled = isEnabled
    }
}

private extension Constants {
    static let generalWidthMultiplier: CGFloat = 0.7
    static let logoImageViewHeightMultiplier: CGFloat = 0.5
    static let appNameLabelHeightMultiplier: CGFloat = 0.2
    static let actionButtonFontSize: CGFloat = 16
    
    static let logoImageViewTintColor: UIColor = .blackLM
}

extension Reactive where Base: MainScreenView {
    var cameraPickerButtonTap: ControlEvent<Void> {
        base.cameraPickerButtonView.wrappedView.rx.tap
    }
    
    var imagePickerButtonTap: ControlEvent<Void> {
        base.imagePickerButtonView.wrappedView.rx.tap
    }
    
    var isAnimating: Binder<Bool> {
        Binder(self.base) { base, shouldStartAnimation in
            base.animate(with: shouldStartAnimation)
        }
    }
    
    var isButtonInteractionEnabled: Binder<Bool> {
        Binder(self.base) { base, isEnabled in
            base.configureButtonsAvailability(with: isEnabled)
        }
    }
}

// MARK: - Animation

extension MainScreenView {
    
    func animate(with shouldStartAnimation: Bool) {
        shouldStartAnimation
            ? startAnimation()
            : stopAnimation()
    }
    
    private func startAnimation() {
        UIView.animate(withDuration: 1, delay: .zero, options: [.autoreverse, .repeat, .curveEaseIn]) { [weak self] in
            self?.logoImageView.tintColor = .random()
        }
    }
    
    private func stopAnimation() {
        UIView.animate(withDuration: 1, delay: .zero, options: [.beginFromCurrentState]) { [weak self] in
            self?.logoImageView.tintColor = Constants.logoImageViewTintColor
        }
    }
}
