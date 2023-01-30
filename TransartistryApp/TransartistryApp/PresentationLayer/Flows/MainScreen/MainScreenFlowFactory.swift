protocol MainScreenModulesFactory {
    func makeMainScreenModule() -> MainScreenModule
}

struct MainScreenFlowFactory: MainScreenModulesFactory {
    func makeMainScreenModule() -> MainScreenModule {
        MainScreenModuleAssembly.createMainScreenModule()
    }
}
