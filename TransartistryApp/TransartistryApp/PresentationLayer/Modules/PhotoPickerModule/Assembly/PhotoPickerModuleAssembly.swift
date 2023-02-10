protocol PhotoPickerModule: BaseModule {
    var onPhotoPicked: ParameterClosure<Photo>? { get set }
}

enum PhotoPickerModuleAssembly {
    
    static func createPhotoPickerModule() -> PhotoPickerModule {
        let view = PhotoPickerController()
        view.sourceType = .camera
        view.allowsEditing = false
        return view
    }
}
