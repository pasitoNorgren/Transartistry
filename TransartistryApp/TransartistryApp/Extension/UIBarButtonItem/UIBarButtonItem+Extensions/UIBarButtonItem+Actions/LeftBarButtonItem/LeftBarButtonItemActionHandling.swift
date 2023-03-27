import RxSwift

protocol LeftBarButtonItemActionHandling: LeftBarButtonItemActionObserving {
    func handleLeftBarButtonItemAction()
    func processLeftBarButtonItemTap()
}

extension LeftBarButtonItemActionHandling where Self: DisposeBagHolder {
    
    func processLeftBarButtonItemTap() {
        
        observeLeftBarButtonItemTap()?
            .subscribe(with: self, onNext: { owner, _ in
                owner.handleLeftBarButtonItemAction()
            })
            .disposed(by: disposeBag)
    }
}
