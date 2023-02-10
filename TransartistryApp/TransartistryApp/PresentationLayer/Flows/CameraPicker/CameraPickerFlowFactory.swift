protocol CameraPickerModuleFactory {
    func makeCameraPickerModule() -> CameraPickerModule
}

extension CameraPickerModuleFactory {
    func makeCameraPickerModule() -> CameraPickerModule {
        CameraPickerModuleAssembly.createCameraPickerModule()
    }
}
