import TICoordinatorKit

protocol MainScreenModule: Presentable {
    var onOpenCamera: ParameterClosure<PhotoDistributor>? { get set }
    var onOpenPhotoLibrary: VoidClosure? { get set }
}

enum MainScreenModuleAssembly {
    static func createMainScreenModule() -> MainScreenModule {
        let viewModel = MainScreenViewModel()
        let view = MainScreenViewController(viewModel: viewModel)
        return view
    }
}
