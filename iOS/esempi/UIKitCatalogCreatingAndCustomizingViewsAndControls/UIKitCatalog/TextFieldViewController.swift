/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view controller that demonstrates how to use `UITextField`.
*/

import UIKit

class TextFieldViewController: UITableViewController {
    // MARK: - Properties

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tintedTextField: UITextField!
    
    @IBOutlet weak var secureTextField: UITextField!
    
    @IBOutlet weak var specificKeyboardTextField: UITextField!
    
    @IBOutlet weak var customTextField: UITextField!

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextField()
        configureTintedTextField()
        configureSecureTextField()
        configureSpecificKeyboardTextField()
        configureCustomTextField()
    }
    
    // MARK: - Configuration

    func configureTextField() {
        textField.placeholder = NSLocalizedString("Placeholder text", comment: "")
        textField.autocorrectionType = .yes
        textField.returnKeyType = .done
        textField.clearButtonMode = .never
    }

    func configureTintedTextField() {
        tintedTextField.tintColor = UIColor(named: "Tint_Blue_Color")
        tintedTextField.textColor = UIColor(named: "Tint_Green_Color")

        tintedTextField.placeholder = NSLocalizedString("Placeholder text", comment: "")
        tintedTextField.returnKeyType = .done
        tintedTextField.clearButtonMode = .never
    }

    func configureSecureTextField() {
        secureTextField.isSecureTextEntry = true

        secureTextField.placeholder = NSLocalizedString("Placeholder text", comment: "")
        secureTextField.returnKeyType = .done
        secureTextField.clearButtonMode = .always
    }

    /**	There are many different types of keyboards that you may choose to use.
        The different types of keyboards are defined in the `UITextInputTraits` interface.
        This example shows how to display a keyboard to help enter email addresses.
    */
    func configureSpecificKeyboardTextField() {
        specificKeyboardTextField.keyboardType = .emailAddress

        specificKeyboardTextField.placeholder = NSLocalizedString("Placeholder text", comment: "")
        specificKeyboardTextField.returnKeyType = .done
    }

    func configureCustomTextField() {
        // Text fields with custom image backgrounds must have no border.
        customTextField.borderStyle = .none

        customTextField.background = UIImage(named: "text_field_background")

        // Create a purple button that, when selected, turns the custom text field's text color to purple.
        let purpleImage = UIImage(named: "text_field_purple_right_view")!
        let purpleImageButton = UIButton(type: .custom)
        purpleImageButton.bounds = CGRect(x: 0, y: 0, width: purpleImage.size.width, height: purpleImage.size.height)
        purpleImageButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        purpleImageButton.setImage(purpleImage, for: .normal)
        purpleImageButton.addTarget(self, action: #selector(TextFieldViewController.customTextFieldPurpleButtonClicked), for: .touchUpInside)
        customTextField.rightView = purpleImageButton
        customTextField.rightViewMode = .always

        // Add an empty view as the left view to ensure the proper inset between the text and the bounding rectangle.
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        leftPaddingView.backgroundColor = UIColor.clear
        customTextField.leftView = leftPaddingView
        customTextField.leftViewMode = .always

        customTextField.placeholder = NSLocalizedString("Placeholder text", comment: "")
        customTextField.autocorrectionType = .no
        customTextField.returnKeyType = .done
    }
	
    // MARK: - Actions
    
    @objc
    func customTextFieldPurpleButtonClicked() {
        customTextField.textColor = UIColor(named: "Tint_Purple_Color")

        print("The custom text field's purple right view button was clicked.")
    }
}

// MARK: - UITextFieldDelegate

extension TextFieldViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}
