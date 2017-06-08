import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastNameTextField: CustomTextField!
    @IBOutlet weak var companyTextField: CustomTextField!
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    
    let maxHeight: CGFloat = 440
    var textFieldPosition: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        companyTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func viewTapped() {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        companyTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    // Calculating the distance from the top up to the end of the text field + some extra space
    func calculateTextFieldInitialPosition(textFieldYPosition: CGFloat, textFieldHeight: CGFloat) -> CGFloat {
        return textFieldYPosition + textFieldHeight + 16
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldPosition = calculateTextFieldInitialPosition(textFieldYPosition: textField.layer.position.y, textFieldHeight: textField.frame.size.height)
        
        if textFieldPosition > maxHeight {
            scrollView.setContentOffset(CGPoint(x: 0, y: textFieldPosition - maxHeight), animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldPosition = calculateTextFieldInitialPosition(textFieldYPosition: textField.layer.position.y, textFieldHeight: textField.frame.size.height)
        
        textField.resignFirstResponder()
        
        if textFieldPosition > maxHeight {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        
        // Switching focus to the next text field
        if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            companyTextField.becomeFirstResponder()
        } else if textField == companyTextField {
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField {
            emailTextField.becomeFirstResponder()
        }
        
        return true
    }
    
    func setDefaultBackgroundColor(textField: CustomTextField) {
        textField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    func setErrorBackgroundColor(textField: CustomTextField) {
        textField.backgroundColor = UIColor(red: 255/255, green: 210/255, blue: 210/255, alpha: 1.0)
    }
    
    func cleanTextFields() {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        companyTextField.text = ""
        phoneTextField.text = ""
        emailTextField.text = ""
    }
    
    func validateTextFields(textField: CustomTextField) -> Bool {
        if textField.text == "" {
            setErrorBackgroundColor(textField: textField)
            return false
        }
        else {
            setDefaultBackgroundColor(textField: textField)
            return true
        }
    }
    
    @IBAction func cancel(_ sender: CustomButton) {
        let alert = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .actionSheet)
        
        let noAction = UIAlertAction(title: "No way", style: .cancel) {
            (action) in
        }
        
        let yesAction = UIAlertAction(title: "Yes, I'm sure", style: .default) {
            (action) in
            self.cleanTextFields()
        }
        
        alert.addAction(noAction)
        alert.addAction(yesAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: CustomButton) {
        let textField1 = validateTextFields(textField: firstNameTextField)
        let textField2 = validateTextFields(textField: lastNameTextField)
        let textField3 = validateTextFields(textField: companyTextField)
        let textField4 = validateTextFields(textField: phoneTextField)
        let textField5 = validateTextFields(textField: emailTextField)
        
        if textField1 == false || textField2 == false || textField3 == false || textField4 == false || textField5 == false {
            let alertController = UIAlertController(title: "Error", message: "All fields must be completed", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            let alertController = UIAlertController(title: "New contact saved", message: "\(firstNameTextField.text!) is now a contact", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            cleanTextFields()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
