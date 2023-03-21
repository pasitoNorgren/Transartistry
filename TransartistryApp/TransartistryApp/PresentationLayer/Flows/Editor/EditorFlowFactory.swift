protocol EditorFlowFactoring {
    func makeEditorModule(configuration: EditorConfigurable) -> EditorModule
}

class EditorFlowFactory: EditorFlowFactoring {
    func makeEditorModule(configuration: EditorConfigurable) -> EditorModule {
        EditorModuleAssembly.createEditorModule(with: configuration)
    }
}
