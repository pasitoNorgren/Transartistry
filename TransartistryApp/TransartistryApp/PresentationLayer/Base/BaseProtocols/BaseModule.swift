import TICoordinatorKit

protocol BaseModule: Presentable {
    var onClose: VoidClosure? { get set }
}
