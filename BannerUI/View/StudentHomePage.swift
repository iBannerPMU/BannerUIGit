import SwiftUI
import FirebaseAuth

struct StudentHomePage: View {
    
    @ObservedObject var dataRepo : dbRepo
    @State var showView : String? = nil

    var body: some View {
        
        NavigationView{
            VStack (alignment: .center, spacing: 40) {
                NavigationLink(destination: Information(dataRepo: dataRepo)){
                    Text("Information")
                }
                if((dataRepo.student) != nil){
                NavigationLink(destination: Registeration(dataRepo: dataRepo)){
                    Text("Registeration")
                }
                NavigationLink(destination: StudentAccounts(dataRepo: dataRepo)) {
                    Text("Student Accounts")
                }
                NavigationLink(destination: StudentRecords()){
                    Text("Student Records")
                    }
                }
                if((dataRepo.admin) != nil){
                NavigationLink(destination: CreateStudent(repo: dataRepo)){
                    Text("Create Student")
                    }
                }
                NavigationLink(destination: SignInAuth(dataRepo: dataRepo, any: $showView), tag:"Login", selection: $showView) {
                }
                
                Button(action: {
                    do {
                        try Auth.auth().signOut()
                    } catch let signOutError as NSError {
                        print ("Error signing out: %@", signOutError)
                    }
                    dataRepo.clear()
                    self.showView = "Login"
                }) {
                    Text("Logout")
                }
            }
        }
        .onAppear() {
            if Auth.auth().currentUser == nil {
                self.showView = "Login"
            } else {
                if((dataRepo.student) != nil || (dataRepo.admin) != nil ){
                    print("Data existed, Logged in")
                }
                else {
                    print("Getting Data")
                    dataRepo.getData()
                }
            }
        }
    }
}
