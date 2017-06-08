import UIKit

class CustomTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Setting border and background style
        // self.borderStyle = UITextBorderStyle.none;
        // self.frame.size.height = 50
        self.layer.cornerRadius = 3.0
        self.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        
        // Setting left padding
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.size.height))
        self.leftViewMode = .always
        
        // Setting right padding
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
        self.rightViewMode = .always
    }
    
}
