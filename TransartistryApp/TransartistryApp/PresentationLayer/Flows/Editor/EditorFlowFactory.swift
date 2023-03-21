protocol EditorFlowFactoring {
    func makeEditorModule() -> EditorModule
}

class EditorFlowFactory: EditorFlowFactoring {
    func makeEditorModule() -> EditorModule {
        EditorModuleAssembly.createEditorModule()
    }
}
