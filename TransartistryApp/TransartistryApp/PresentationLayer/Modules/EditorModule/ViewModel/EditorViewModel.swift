import RxCocoa

final class EditorViewModel: BaseViewModel, EditorViewModelOutlets {
    
    // MARK: - Private properties
    
    private let photo: Photo
    
    private let canvasConfigurationDistributor = Distributor<ImageCanvasConfigurable>()
    
    // MARK: - EditorViewModelOutlets
    
    var canvasConfigurationDriver: Driver<ImageCanvasConfigurable> {
        canvasConfigurationDistributor.distributionDriver
    }
    
    // MARK: - Initialization
    
    init(configuration: EditorConfigurable) {
        self.photo = configuration.photo
        super.init()
    }
    
    // MARK: - LifeCycleOutlets
    
    func viewWillAppear() {
        setupBasicCanvasConfiguration()
    }
    
    // MARK: - Private methods
    
    private func setupBasicCanvasConfiguration() {
        let configuration = EditorCanvasConfiguration(image: photo, inkingTool: InkingTool())
        canvasConfigurationDistributor.publish(item: configuration)
    }
}
