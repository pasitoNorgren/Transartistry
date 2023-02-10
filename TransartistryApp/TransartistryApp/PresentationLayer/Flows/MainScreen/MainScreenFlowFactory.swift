protocol MainScreenModulesFactory: CameraPickerModuleFactory {
    func makeMainScreenModule() -> MainScreenModule
}

struct MainScreenFlowFactory: MainScreenModulesFactory {
    func makeMainScreenModule() -> MainScreenModule {
        MainScreenModuleAssembly.createMainScreenModule()
    }
}
