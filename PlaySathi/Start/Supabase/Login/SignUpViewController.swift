//
//  SignUpViewController.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 27/02/25.
//

import UIKit
import Auth

struct SignUpData {
    let id: UUID
    let email: String
    let name: String
    let contactNumber: String
}
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
                return
            }
            
            guard let contactNumber = Double(contactString) else {
                showAlert(message: "Invalid contact number. Please enter a valid numeric value.")
                return
            }
            
            Task {
                do {
                    // Single signup call to Supabase
                    let authResponse = try await SupabaseAuthanticationManager.shared.getClient().auth.signUp(email: email, password: password)
                    print("Auth signup successful with ID: \(authResponse.user.id.uuidString)")
                    
                    // Navigate to WeeklyAvailabilityViewController
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        if let weeklyVC = storyboard.instantiateViewController(withIdentifier: "week") as? WeeklyAvailabilityViewController {
                            weeklyVC.userData = SignUpData(id: authResponse.user.id,
                                                         email: email,
                                                         name: name,
                                                         contactNumber: String(contactNumber))
                            self.navigationController?.pushViewController(weeklyVC, animated: true)
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.showAlert(message: "Signup failed: \(error.localizedDescription)")
                    }
                    print("Signup error: \(error.localizedDescription)")
                }
            }
        }
//        signUp(name: name, email: email, contactNumber: String(contactNumber), password: password,playerImage:playerImage ,location: location,availableTime:availableTime )
//        
//    }
//        
//    func insertNewUser(id:UUID,name: String, email:String, contactNumber: String,playerImage:String,location:String,availableTime:String) async {
//        await PlayerDataController.shared.insertUser(newUser: Profile(id: id, email: email, name: name, contactNumber: contactNumber
//                                                                      , playerImage: playerImage, location: location, availableTime: availableTime))
//    }
    
//    func signUp(name: String, email: String, contactNumber: String, password: String,playerImage:String,location:String,availableTime:String) {
//        Task {
//            do {
//                
//                SupabaseAuthanticationManager.shared.signUp(email: email, password: password) { result in
//                    switch result {
//                    case .success(let authResponse):
//                        print("New user created with ID: \(authResponse.user.id.uuidString)")
//                        
//                        DispatchQueue.main.async {
//                            self.showAlert(message: "Signup successful! Please login.")
//                            self.navigationController?.popViewController(animated: true)
//                        }
//                    case .failure(let error):
//                        DispatchQueue.main.async {
//                            self.showAlert(message: "Signup failed: \(error.localizedDescription)")
//                        }
//                        print("Signup error: \(error.localizedDescription)")
//                    }
//                }
////                print("New user created with ID: \(SupabaseAuthenticationManager.shared.user.id.uuidString)")
//                
//            } catch {
//                DispatchQueue.main.async {
//                    self.showAlert(message: "Signup failed: \(error.localizedDescription)")
//                }
//                print("Signup error: \(error.localizedDescription)")
//            }
//        }
//    }
        
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
        
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
