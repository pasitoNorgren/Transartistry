import RxCocoa

protocol LeftBarButtonItemActionObserving: BarButtonItemActionObserving {
    func observeLeftBarButtonItemTap() -> ControlEvent<()>?
}

extension LeftBarButtonItemActionObserving where Self: UIViewController {
    
    func observeLeftBarButtonItemTap() -> ControlEvent<()>? {
        observeBarButtonItemTap()
    }
    
    func observeBarButtonItemTap() -> ControlEvent<()>? {
        navigationItem.leftBarButtonItem?.rx.tap
    }
}
