final class AlertAction {
    
    let title: String
    let style: AlertActionStyle
    let closure: VoidClosure?
    
    init(title: String, style: AlertActionStyle, closure: VoidClosure?) {
        self.title = title
        self.style = style
        self.closure = closure
    }
    
    static func simpleOKAction(_ closure: VoidClosure?) -> AlertAction {
        .init(title: .okAlertTitle,
              style: .basic,
              closure: closure)
    }
    
    static func simpleCancelAction(_ closure: VoidClosure?) -> AlertAction {
        .init(title: .cancelTitle,
              style: .cancel,
              closure: closure)
    }
}
