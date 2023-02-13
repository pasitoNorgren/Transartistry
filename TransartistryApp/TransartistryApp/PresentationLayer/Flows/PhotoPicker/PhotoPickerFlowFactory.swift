protocol PhotoPickerModuleFactory {
    func makePhotoPickerModule(with source: PhotoPickerSource) -> PhotoPickerModule
}

extension PhotoPickerModuleFactory {
    func makePhotoPickerModule(with source: PhotoPickerSource) -> PhotoPickerModule {
        source == .camera
            ? PhotoPickerModuleAssembly.createCameraPickerModule()
            : PhotoPickerModuleAssembly.createLibraryImagePickerModule()
    }
}
