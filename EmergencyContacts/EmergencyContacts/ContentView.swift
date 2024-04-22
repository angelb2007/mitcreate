//
//  ContentView.swift
//  EmergencyContacts
//
//  Created by Sid Dey on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var hospital: String = ""
    @State var phoneNumber: String = ""
    @State var firstNameEnable: Bool = false
    @State var showAlert: Bool = false
    @State var isMessageVisible: Bool = false
    @State var messageOpacity: Bool = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 10) {
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("First Name")
                            .bold()
                    }
                    TextField("First Name", text: $firstName)
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color("rectColor"))
                        }
                        .padding(.top)
                }
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("Last Name")
                            .bold()
                    }
                    TextField("Last Name", text: $lastName)
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color("rectColor"))
                        }
                        .padding(.top)
                }
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("Hospital")
                            .bold()
                    }
                    TextField("Name of Hospital", text: $hospital)
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color("rectColor"))
                        }
                        .padding(.top)
                }
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("Phone Number")
                            .bold()
                    }
                    TextField("Phone #", text: $phoneNumber)
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color("rectColor"))
                        }
                        .padding(.top)
                    Button {
                        if(isEnabled()){
                            clearFields()
                            showAlert.toggle()
                        };label: do {
                            Text("Send")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(isEnabled() ? Color.red.cornerRadius(10) : Color.secondary.cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                                .cornerRadius(10)
                        }
                        .alert(isPresented: $showAlert){
                            getAlert()
                        }
                        .navigationTitle("Add Emergency Contacts")
                    }
                }
            }
        }
    }
    func isEnabled() -> Bool {
        if firstName.count >= 1 && lastName.count >= 1 && phoneNumber.count >= 1 {
            return true
        }
        return false
    }
    func clearFields(){
        firstName = ""
        lastName = ""
        hospital = ""
        phoneNumber = ""
    }
    func getAlert() -> Alert{
        return Alert(
            title: Text("Congratulations! You have another contact!")
        )
    }
}
#Preview {
    ContentView()
}
