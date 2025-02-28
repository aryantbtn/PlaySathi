//
//  LoginViewController.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 27/02/25.
//

import UIKit
import Supabase
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPasswordTextField()
    }
    
    
    func loadUserProfile(completion:((Profile?)->Void)) async{
        let user = await PlayerDataController.shared.loadUserProfiles()
        completion(user)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // This will dismiss the keyboard
    }

    // Dismiss the keyboard when the "Return" button is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    private func setupPasswordTextField() {
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        passwordTextField.rightView = eyeButton
        passwordTextField.rightViewMode = .always
        passwordTextField.isSecureTextEntry = true
    }
    
    
    @objc private func togglePasswordVisibility(_ sender:UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Please fill in all fields.")
            return
        }
        Task {
            await login(email: email, password: password)
        }
    }
    
    
    @IBAction func forgetButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(
                title: "Reset Password",
                message: "Enter your email to reset your password.",
                preferredStyle: .alert
            )
            alertController.addTextField { textField in
                textField.placeholder = "Enter your email"
                textField.keyboardType = .emailAddress
            }
                
            let sendAction = UIAlertAction(title: "Send", style: .default) { _ in
                if let email = alertController.textFields?.first?.text, !email.isEmpty {
                    // Call Supabase to send a password reset email
                    self.sendPasswordReset(email: email)
                } else {
                    self.showAlert(title: "Error", message: "Please enter a valid email.")
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
            alertController.addAction(sendAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
        }
    
    // Password reset function
        private func sendPasswordReset(email: String) {
            do {
                Task {
                    do {
                        try await SupabaseAuthanticationManager.shared.getClient().auth.resetPasswordForEmail(email)
                        DispatchQueue.main.async {
                            self.showAlert(title: "Success", message: "A password reset email has been sent to \(email). Please check your inbox.")}
                    } catch {
                        DispatchQueue.main.async {
                            self.showAlert(title: "Error", message: "Failed to send password reset email. Error: \(error.localizedDescription)")
                        }
                    }
                }
            }
            catch {
                DispatchQueue.main.async {
                    self.showAlert(title: "Error", message: "Initialization error: \(error.localizedDescription)")
                }
            }
        }
     
        private func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    
        @IBAction func googleSignInTapped(_ sender: UIButton) {
            // Initialize Google Sign-In
            GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
                guard let result = signInResult else {return}
                let user = result.user
                
                let id = user.userID
                let name = user.profile?.name
                let email = user.profile?.email
                
                print(id!)
                print(name!)
                print(email!)
            }
        }

    func login(email: String, password: String) async {
        do {
            // Authenticate the user with Supabase Auth
            let authResponse = try await SupabaseAuthanticationManager.shared.getClient().auth.signIn(email: email, password: password)
            
            // If login is successful
            let userId = authResponse.user.id  // No need for optional unwrapping
            print("Login successful! User ID: \(userId)")
            
            // Navigate to the home page or next screen
            DispatchQueue.main.async {
                self.showAlertWithNavigation(message: "Login successful!")
            }
        } catch {
            // Handle login failure
            DispatchQueue.main.async {
                self.showAlert(message: "Login error: \(error.localizedDescription)")
            }
            print("Login error: \(error.localizedDescription)")
        }
    }
       
    func signIn(sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
        }
    }

    private func showAlertWithNavigation(message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Navigate to the home page or next screen
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController = storyboard.instantiateViewController(withIdentifier: "main") as! MainTabBarController
            self.navigationController?.pushViewController(homeViewController, animated: true)
            self.navigationController?.navigationBar.isHidden = true
             
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
        
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }

}
