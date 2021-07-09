//
//  BrowseClasses.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import SwiftUI

struct BrowseClasses: View {
    
    var courses: [String: Course?]
    var stringArray: [String]
    var dataRepo: dbRepo
    
    var body: some View {
        
        List {
            Section {
                ForEach(0 ..< stringArray.count, id: \.self) { index in
                    NavigationLink(destination: courseInfo(course: courses[stringArray[index]]!!, dataRepo: dataRepo)) {
                        Text(courses[stringArray[index]]!!.name)
                    }
                }
            }
        }
    }
}
