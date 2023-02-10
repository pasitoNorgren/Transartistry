protocol PhotoPickerModuleFactory {
    func makePhotoPickerModule() -> PhotoPickerModule
}

extension PhotoPickerModuleFactory {
    func makePhotoPickerModule() -> PhotoPickerModule {
        PhotoPickerModuleAssembly.createPhotoPickerModule()
    }
}
