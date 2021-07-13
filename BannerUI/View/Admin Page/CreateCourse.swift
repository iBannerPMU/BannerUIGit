//
//  CreateCourse.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 13/07/2021.
//

import SwiftUI

struct CreateCourse: View {
    @ObservedObject var repo: dbRepo
    
    @State var name : String = ""
    @State var CreditHour : String = ""
    @State var Major : String = ""
    @State var hasPreRequisite : Bool = false
    @State var elective : Bool = false
    @State var PreReqName : String = ""
 
    
    var body: some View {
        
        VStack {
            Form {
                TextField("Name", text: $name)
                TextField("Credit Hours", text: $CreditHour)
                TextField("Major", text: $Major)
                TextField("Pre Requisite Course", text: $PreReqName)
            }
        }.padding()
        Button(action: {
            
            let course = Course(name: name, CreditHour: CreditHour, Major: Major, PreReqName: PreReqName)
            repo.addCourseData(course: course)
        }) {
            
            Text("Register")
    
        }
    }
}
