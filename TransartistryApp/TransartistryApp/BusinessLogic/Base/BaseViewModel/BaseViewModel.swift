class BaseViewModel: ViewModelConfigurable {
    
    init() {
        initializeViewModelBaseConfiguration()
    }

    func configureComponents() {
        // override in subclass
    }

    func bindComponents() {
        // override in subclass
    }
}
