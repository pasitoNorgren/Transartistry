import TICoordinatorKit

protocol MainScreenModule: Presentable {
    var onOpenPhotoPicker: ParameterClosure<PhotoPickerParameters>? { get set }
}

enum MainScreenModuleAssembly {
    static func createMainScreenModule() -> MainScreenModule {
        let viewModel = MainScreenViewModel()
        let view = MainScreenViewController(viewModel: viewModel)
        return view
    }
}
