import UIKit.NSAttributedString

extension NSAttributedString {
    convenience init(
        string: String,
        font: UIFont = .regularFont(of: 15),
        color: UIColor = .black,
        alingment: NSTextAlignment = .left,
        breakMode: NSLineBreakMode = .byTruncatingTail) {
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = breakMode
            paragraphStyle.alignment = alingment
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: paragraphStyle,
                .font: font,
                .foregroundColor: color
            ]
            
            self.init(string: string, attributes: attributes)
        }
    
    static func mainScreenAppNameAttributed(string: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string,
                                                         font: .boldFont(of: 25),
                                                         color: .blackLM,
                                                         alingment: .center)
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: 8,
            range: NSRange(location: .zero, length: attributedString.length - 1)
        )
        
        return attributedString
    }
}
