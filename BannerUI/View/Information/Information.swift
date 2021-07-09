//
//  Information.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import SwiftUI


struct Information: View {
    
    var dataRepo: dbRepo
    
    @State var selection = 0
    private let items: [String] = ["Personal", "College"]
    
    var body: some View {
        ZStack {
            VStack {
                Picker(selection: $selection, label: Text("")) {
                    ForEach(0..<items.count, id: \.self) { index in
                        Text(self.items[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                if selection == 0 {
                    PersonalTab(dataRepo: dataRepo)
                } else {
                    CollegeTab(dataRepo: dataRepo)
                }
                Spacer(minLength: 0)
            }
            .padding()
        }//.navigationBarHidden(true)
    }
}
