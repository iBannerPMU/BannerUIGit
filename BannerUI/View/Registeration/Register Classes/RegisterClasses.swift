//
//  RegisterClasses.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import SwiftUI
import Firebase

struct RegisterClasses: View {
    
    var courses: [String: Course?]
    var stringArray: [String]
    @ObservedObject var dataRepo : dbRepo
    
    @Binding var Globalcourse: [String: Course]
    @Binding var sections: [String: section?]
    @Binding var tempArray: [String]
    
    var body: some View {
        List {
            Section {
                ForEach(0 ..< stringArray.count) { index in
                    NavigationLink(destination: CourseRegister(course: courses[stringArray[index]]!!, dataRepo: dataRepo, GlobalCourse: $Globalcourse, sections: $sections, tempArray: $tempArray)) {
                        Text(courses[stringArray[index]]!!.name)
                    }.onDisappear{
                        dataRepo.getSections(CourseID: courses[stringArray[index]]!!.id!)
                    }
                }
            }
        }
    }
}
