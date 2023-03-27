protocol BackBarButtonItemActionHandling: LeftBarButtonItemActionHandling {}

extension BackBarButtonItemActionHandling where Self: BaseModule {
    
    func handleLeftBarButtonItemAction() {
        onClose?()
    }
}
