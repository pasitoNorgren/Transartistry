final class AlertDescription {
    
    let title: String
    let message: String?
    let style: AlertStyle
    let actions: [AlertAction]
    
    let isPresentationAnimated: Bool
    let openingCompilationHandler: VoidClosure?
    
    init(title: String = .errorOccuredTitle,
         message: String? = nil,
         style: AlertStyle = .alert,
         actions: [AlertAction] = [.simpleOKAction(nil)],
         isPresentationAnimated: Bool = true,
         openingCompilationHandler: VoidClosure? = nil) {
        self.title = title
        self.message = message
        self.style = style
        self.actions = actions
        self.isPresentationAnimated = isPresentationAnimated
        self.openingCompilationHandler = openingCompilationHandler
    }
}
