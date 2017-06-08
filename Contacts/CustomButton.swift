import UIKit

class CustomButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        // Setting the proper style to the button
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor(red: 254/255, green: 41/255, blue: 67/255, alpha: 1.0).cgColor
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        self.layer.cornerRadius = 3.0
        
    }
    
    @IBInspectable var buttonBGColor: Bool = false {
        
        didSet {
            
            switch buttonBGColor {
            case false:
                // Setting the style of cancel's button
                self.setTitleColor(UIColor(red: 254/255, green: 41/255, blue: 67/255, alpha: 1.0), for: UIControlState.normal)
                self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            case true:
                // Setting the style of save's button
                self.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0), for: UIControlState.normal)
                self.backgroundColor = UIColor(red: 254/255, green: 41/255, blue: 67/255, alpha: 1.0)
            }
            
        }
        
    }
    
}
