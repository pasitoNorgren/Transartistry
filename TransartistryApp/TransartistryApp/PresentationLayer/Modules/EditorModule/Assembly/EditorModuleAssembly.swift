protocol EditorModule: BaseModule {}

enum EditorModuleAssembly {
    
    static func createEditorModule() -> EditorModule {
        let viewModel = EditorViewModel()
        let view = EditorViewController(viewModel: viewModel)
        return view
    }
}
