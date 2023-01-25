protocol ViewLayerConfigurable: Bindable, AnyObject {
    func configureSubviewsAdding()
    func configureLayout()
    func configureAppearance()
    func configureLocalization()
}

extension ViewLayerConfigurable {
    func initializeViewLayerBaseConfiguration() {
        configureSubviewsAdding()
        configureLayout()
        configureAppearance()
        configureLocalization()
        bindComponents()
    }
}
