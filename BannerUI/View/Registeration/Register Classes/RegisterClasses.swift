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
    var dataRepo : dbRepo
    
    var body: some View {
        List {
            Section {
                ForEach(0 ..< stringArray.count) { index in
                    NavigationLink(destination: CourseRegister(course: courses[stringArray[index]]!!, dataRepo: dataRepo)) {
                        Text(courses[stringArray[index]]!!.name)
                    }
                }
            }
        }
    }
}
