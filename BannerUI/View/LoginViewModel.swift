import SwiftUI
import FirebaseAuth
import Firebase

class LoginViewModel: ObservableObject{
    
    let db = Firestore.firestore()
    var email = ""
    var password = ""
    var LoggedIn = false
    
    func login(email: String, password: String){
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let e = error {
                print(e)
            } else {
                self.LoggedIn = true
            }
        }
    }
}
