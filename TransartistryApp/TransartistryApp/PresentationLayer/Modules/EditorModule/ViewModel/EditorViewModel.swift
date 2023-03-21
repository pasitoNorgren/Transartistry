final class EditorViewModel: BaseViewModel, EditorViewModelOutlets {
    
    private let photo: Photo
    
    init(configuration: EditorConfigurable) {
        self.photo = configuration.photo
        super.init()
    }
}
