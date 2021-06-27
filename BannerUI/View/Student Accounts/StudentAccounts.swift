//
//  StudentAccounts.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 28/07/1442 AH.
//

import SwiftUI

struct StudentAccounts: View {
    
    var dataRepo: dbRepo
    @State var selection = 0
    private let items: [String] = ["Account Summery", "Account Information"]
    
        var body: some View {
            ZStack {
                VStack {
                        Picker(selection: $selection, label: Text("")) {
                            ForEach(0..<items.count, id: \.self) { index in
                                Text(self.items[index]).tag(index)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        if selection == 0 {
                            AccountSummery(user: dataRepo)
                        } else {
                            AccountInformation(user: dataRepo)
                        }
                        Spacer(minLength: 0)
                    }
                .padding()
            }//.navigationBarHidden(true)
        }
    }
