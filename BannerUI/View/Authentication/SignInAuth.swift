//
//  SignInAuth.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 28/07/1442 AH.
//

import SwiftUI
import UIKit
import Firebase
import FirebaseAuth

struct SignInAuth: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //self.presentationMode.wrappedValue.dismiss()
    
    
    @ObservedObject var dataRepo: dbRepo
    var LoginVM = LoginViewModel()
    let color = Color.black
    @Binding var any : String?
    @State var email : String = ""
    @State var pass : String = ""
    @State var db = Firestore.firestore()
    @State var visible = false
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            GeometryReader {_ in
                
                VStack {
                    
                    Image("PMU")
                    
                    Text("Banner Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                        .padding(.top, 35)
                    
                    TextField("ID", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Orange") : self.color, lineWidth: 2))
                        .padding(.top, 25)
                    
                    HStack (spacing: 15) {
                        VStack {
                            if self.visible {
                                TextField("Password", text: self.$pass)
                            } else {
                                SecureField("Password", text: self.$pass)
                            }
                        }
                        Button(action: {
                            
                            self.visible.toggle()
                            
                        }) {
                            
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                        }
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Orange") : self.color, lineWidth: 2))
                    .padding(.top, 25)
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("Forget Password")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Blue"))
                        }
                    }
                    .padding(.top, 20)
                    
                    Button(action: {
                        
                        LoginVM.login(email: email, password: pass)
                        //print("Login?")
                        while Auth.auth().currentUser == nil {}
                        dataRepo.authRef = Auth.auth().currentUser!.uid
                        dataRepo.getData()
                        //User data check
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        
                        Text("Sign in")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("Blue"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                }
                .padding(.horizontal, 25)
                
            }
            
        }
        .navigationBarTitle("Something")
        .navigationBarHidden(true)
        
        if self.alert {
            
            ErrorView(alert: self.$alert, error: self.$error)
            
        }
    }
    
}


struct ErrorView : View {
    
    @State var color = Color.black
    @Binding var alert : Bool
    @Binding var error : String
    
    var body : some View {
        
        GeometryReader {_ in
            
            VStack {
                
                HStack {
                    
                    Text("Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action: {
                    
                    self.alert.toggle()
                    
                }) {
                    
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Blue"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}

struct SignInAuth_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
