//import SwiftUI
//import FirebaseAuth
//
//struct AdminHomePage: View {
//
//    var dataRepo = dbRepo()
//    @State var showView : String? = nil
//
//

//    var body: some View {
//
//        NavigationView{
//            VStack (alignment: .center, spacing: 40) {
//                NavigationLink(destination: Information(dataRepo: dataRepo)){
//                    Text("Information")
//                }
//                NavigationLink(destination: CreateStudent(repo: dataRepo)){
//                    Text("Create Student")
//                }
//                NavigationLink(destination: SignInAuth(dataRepo: dataRepo, any: $showView), tag:"Login", selection: $showView) {
//                }
//
//                Button(action: {
//                    do {
//                        try Auth.auth().signOut()
//                    } catch let signOutError as NSError {
//                        print ("Error signing out: %@", signOutError)
//                    }
//                    dataRepo.clear()
//                    self.showView = "Login"
//                }) {
//                    Text("Logout")
//                }
//            }
//        }
//        .onAppear() {
//            if Auth.auth().currentUser == nil {
//                self.showView = "Login"
//            } else {
//                print("Logged in")
//            }
//        }
//    }
//}