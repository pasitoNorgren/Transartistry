import RxCocoa

protocol BarButtonItemActionObserving: AnyObject {
    func observeBarButtonItemTap() -> ControlEvent<()>?
}
