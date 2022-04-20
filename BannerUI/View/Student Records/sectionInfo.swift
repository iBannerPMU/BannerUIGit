//
//  sectionInfo.swift
//  BannerUI
//
//  Created by M on 14/07/2021.
//

import SwiftUI

struct sectionInfo: View {
    
    var SectionDetails: section
    var course: Course
    
    var body: some View {
        VStack {
            Form {
                Text("CRN: " + SectionDetails.CRN).bold()
                Text("Instructor: " + SectionDetails.Instructor).bold()
                Text("Section Number: " + SectionDetails.sectionNumber).bold()
                Text("Section Semester: " + SectionDetails.Semester).bold()
                Text("Section Year: " + SectionDetails.year).bold()
                Text("Start Time: " + SectionDetails.startTime).bold()
                Text("End Time: " + SectionDetails.endTime).bold()
            }
        }.padding()
    }
}
