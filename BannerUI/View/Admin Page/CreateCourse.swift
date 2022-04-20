//
//  CreateCourse.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 13/07/2021.
//

import SwiftUI

struct CreateCourse: View {
    @ObservedObject var dataRepo: dbRepo
    
    @State var name : String = ""
    @State var CreditHour : Int = 0
    @State var Major : String = ""
    @State var hasPreRequisite : Bool = false
    @State var elective : Bool = false
    @State var PreReqName : String = ""
    
    var body: some View {
        
        VStack {
            Form {
                TextField("Name", text: $name)
                
                
                Picker(selection: $CreditHour, label: Text("crd")) {
                    ForEach(0 ..< 6) { number in
                        Text("\(number)")
                    }
                }.pickerStyle(WheelPickerStyle())
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
                
                //TextField("Credit Hours", text: $CreditHour)
                TextField("Major", text: $Major)
                TextField("Pre Requisite Course", text: $PreReqName)
            }
        }.navigationTitle("Create Sections")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        Button(action: {
            
            let course = Course(name: name, CreditHour: CreditHour, Major: Major, PreReqName: PreReqName)
            dataRepo.addCourseData(course: course)
            self.name = ""
            self.CreditHour = 0
            self.Major = ""
            self.PreReqName = ""
        }) {
            
            Text("Register")
            
        }.onDisappear {
            dataRepo.courseArray = [:]
            dataRepo.emptyCourseArray = []
            dataRepo.getCourses()
        }
    }
}
