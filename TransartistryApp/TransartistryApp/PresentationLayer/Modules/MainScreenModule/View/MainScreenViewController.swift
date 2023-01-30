final class MainScreenViewController<VM: ViewModelOutlets>: BaseCustomViewController<MainScreenView, VM>, MainScreenModule {
    override func configureAppearance() {
        super.configureAppearance()

        navigationController?.navigationBar.isHidden = true
    }
}
