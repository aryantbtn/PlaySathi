//
//  SignUpViewController.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 27/02/25.
//

import UIKit
import Auth

class SignUpViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet weak var contactNumberTextField: UITextField!
    @IBOutlet var signupPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPasswordTextField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // This will dismiss the keyboard
    }

    // Dismiss the keyboard when the "Return" button is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard
        return true
    }
    
    private func setupPasswordTextField() {
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
            
        signupPasswordTextField.rightView = eyeButton
        signupPasswordTextField.rightViewMode = .always
        signupPasswordTextField.isSecureTextEntry = true
    }
        
    @objc private func togglePasswordVisibility(_ sender: UIButton) {
        signupPasswordTextField.isSecureTextEntry.toggle()
        let imageName = signupPasswordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
        
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let contactString = contactNumberTextField.text, !contactString.isEmpty,
              let password = signupPasswordTextField.text, !password.isEmpty else {
            
            showAlert(message: "Please fill in all fields.")
            print("The fields were empty")
            return
        }
        print("No fields were empty")
        
        guard let contactNumber = Double(contactString) else {
            showAlert(message: "Invalid contact number. Please enter a valid numeric value.")
            return
        }
        
        signUp(name: name, email: email, contactNumber: String(contactNumber), password: password)
        
    }
        
    func insertNewUser(id:UUID,name: String, email:String, contactNumber: String) async {
        await PlayerDataController.shared.insertUser(newUser: Profile(id: id, name: name, email: email, contactNumber: contactNumber))
    }
    
    func signUp(name: String, email: String, contactNumber: String, password: String) {
        Task {
            do {
                
                SupabaseAuthanticationManager.shared.signUp(email: email, password: password, name: name, contactNumber: contactNumber) { result in
                    switch result {
                    case .success(let authResponse):
                        print("New user created with ID: \(authResponse.user.id.uuidString)")
                        
                        DispatchQueue.main.async {
                            self.showAlert(message: "Signup successful! Please login.")
                            self.navigationController?.popViewController(animated: true)
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            self.showAlert(message: "Signup failed: \(error.localizedDescription)")
                        }
                        print("Signup error: \(error.localizedDescription)")
                    }
                }
//                print("New user created with ID: \(SupabaseAuthenticationManager.shared.user.id.uuidString)")
                
            } catch {
                DispatchQueue.main.async {
                    self.showAlert(message: "Signup failed: \(error.localizedDescription)")
                }
                print("Signup error: \(error.localizedDescription)")
            }
        }
    }
        
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
        
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
