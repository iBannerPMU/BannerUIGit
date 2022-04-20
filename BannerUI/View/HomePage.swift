import SwiftUI
import FirebaseAuth

struct HomePage: View {
    
    @ObservedObject var dataRepo : dbRepo
    @State var showView : String? = nil
    
    var body: some View {
        
        NavigationView{
            VStack (alignment: .center, spacing: 20) {
                NavigationLink(destination: Information(dataRepo: dataRepo)){
                    Text("Information")
                }
                if((dataRepo.student) != nil){
                    NavigationLink(destination: Registeration(dataRepo: dataRepo)){
                        Text("Registeration")
                    }
                    NavigationLink(destination: ClassSchedule(dataRepo: dataRepo)){
                        Text("Schedule")
                    }
                }
                if((dataRepo.admin) != nil){
                    NavigationLink(destination: CreateStudent(repo: dataRepo)){
                        Text("Create Student")
                    }
                    NavigationLink(destination: CreateFaculty(repo: dataRepo)){
                        Text("Create Faculty")
                    }
                    NavigationLink(destination: CreateCourse(dataRepo: dataRepo)){
                        Text("Create Course")
                    }
                    NavigationLink(destination: CreateSections(repo: dataRepo)){
                        Text("Create Sections")
                    }
                }
                if((dataRepo.faculty) != nil){
                    NavigationLink(destination: courseGrading(repo: dataRepo)){
                        Text("Course Grading")
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
            }.navigationTitle("Home Page")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            if Auth.auth().currentUser == nil {
                self.showView = "Login"
            } else {
                if((dataRepo.student) != nil || (dataRepo.admin) != nil || (dataRepo.faculty) != nil ){
                    print("Data existed, Logged in")
                }
                else {
                    print("Getting Data")
                }
            }
        }
    }
}
