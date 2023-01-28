protocol ViewModelConfigurable: Bindable {
    func configureComponents()
}

extension ViewModelConfigurable {
    func initializeViewModelBaseConfiguration() {
        configureComponents()
        bindComponents()
    }
}
