protocol PhotoPickerModule: BaseModule {
    var onPhotoPicked: ParameterClosure<PhotoResult>? { get set }
    var onCloseWithCondition: VoidClosure? { get set }
}

enum PhotoPickerModuleAssembly {
    
    static func createCameraPickerModule() -> PhotoPickerModule {
        let view = PhotoPickerController()
        view.sourceType = .camera
        return view
    }
    
    static func createLibraryImagePickerModule() -> PhotoPickerModule {
        let view = PhotoPickerController()
        view.sourceType = .photoLibrary
        return view
    }
}
