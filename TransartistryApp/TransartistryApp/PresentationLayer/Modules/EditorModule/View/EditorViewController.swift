final class EditorViewController<VM: EditorViewModelOutlets>: BaseCustomViewController<EditorView, VM>, EditorModule {
    var onClose: VoidClosure?
}
