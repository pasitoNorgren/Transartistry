import RxCocoa

protocol EditorViewModelOutlets: ViewModelOutlets, LifeCycleOutlets {
    var canvasConfigurationDriver: Driver<ImageCanvasConfigurable> { get }
}
