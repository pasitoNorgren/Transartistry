import TICoordinatorKit

protocol MainScreenModule: Presentable {}

enum MainScreenModuleAssembly {
    static func createMainScreenModule() -> MainScreenModule {
        let viewModel = MainScreenViewModel()
        let view = MainScreenViewController(viewModel: viewModel)
        return view
    }
}
