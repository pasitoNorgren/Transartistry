protocol CameraPickerModule: BaseModule {
    var onPhotoPicked: ParameterClosure<Photo>? { get set }
}

enum CameraPickerModuleAssembly {
    
    static func createCameraPickerModule() -> CameraPickerModule {
        let view = CameraPickerController()
        view.sourceType = .camera
        view.allowsEditing = false
        return view
    }
}
