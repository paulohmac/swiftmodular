//
//  MainView.swift
//  XcUiTest
//
//  Created by Paulo H.M. on 26/08/23.
//

import SwiftUI
import Dependencie


struct MainView: View {

    @StateObject var customers = CustomerViewModel()

    var body: some View {
        VStack {
            List (customers.customerList ?? []) { customer in
                Section(content: {
                    CustomerView(showMessageBox: false, customer: customer)
                })
            }
            .shadow(color: Color.gray, radius: 2, x: 0, y: 0) //=====> add this
            ReloadButton() {
                Task {
                    await loadData()
                }
            }
        }
        .padding()
        .task {
          await loadData()
        }
    }
    
    
    func loadData() async{
        await customers.getCustomerList()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
