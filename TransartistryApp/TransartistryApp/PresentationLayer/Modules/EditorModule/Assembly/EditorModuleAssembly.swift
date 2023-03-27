protocol EditorModule: BaseModule {}

enum EditorModuleAssembly {
    
    static func createEditorModule(with config: EditorConfigurable) -> EditorModule {
        let viewModel = EditorViewModel(configuration: config)
        let view = EditorViewController(viewModel: viewModel)
        return view
    }
}
