protocol MainScreenModulesFactory: PhotoPickerModuleFactory {
    func makeMainScreenModule() -> MainScreenModule
}

struct MainScreenFlowFactory: MainScreenModulesFactory {
    func makeMainScreenModule() -> MainScreenModule {
        MainScreenModuleAssembly.createMainScreenModule()
    }
}
