//
//  ContentView.swift
//  VolunteerHours
//
// 
//

import SwiftUI

// TODO: (Model 4) Copy new ContentView here

// TODO: (Model 4) Rename ContentView
struct ContentView: View {
    @StateObject var volunteer = Volunteer(name: "", age: 0)
    @State var name: String = ""
    @State var age: String = ""
    @State var message: String = ""
    
    // TODO: (Model 4) Add EnvironmentObject
    var body: some View {
        // TODO: (Model 3) Surround the entire VStack with a NavigationView
        
        /* Model 3 start of code block */
        VStack {
            Text("Volunteer Form")
                .font(.headline)
            VStack {
                HStack {
                    Text("Name:")
                        .modifier(TextLabel())
                    TextField("Name", text: $name)
                        .modifier(TextBox())
                    Spacer()
                }
                HStack {
                    Text("Age:")
                        .modifier(TextLabel())
                    TextField("Age", text: $age)
                        .modifier(TextBox())
                    Spacer()
                }
            }
            .modifier(RoundedBackground())
            .padding(.bottom, 30)
            
            HStack {
                Button(action: {
                    if let validAge = Int(age) {
                        volunteer.name = name
                        volunteer.age = validAge
                        if volunteer.maxHours > 0 {
                            message = " is eligible to work up to \(volunteer.maxHours) hours."
                        } else {
                            message = "is not yet eligible to work."
                        }
                        
                    } else {
                        message = " does not have a valid age."
                    }
                }){
                    Text("Validate")
                        .bold()
                        .modifier(RoundedBackground())
                        .foregroundColor(Color.white)
                }
            }
            .padding(.bottom, 30)
            // TODO: (Model 3) Copy NavigationLink code here
            
            // TODO: (Model 2) Replace the whole code block below
            /* Model2 Start of code block */
            HStack {
                // We can use an if statement to control what View to display
                if !message.isEmpty {
                    Text("\(volunteer.name) (age \(volunteer.age))")
                    Text(message)
                }
            }
            /* Model 2 End of code block */
            Spacer()
            // TODO: (Model 4) Insert Add Volunteer button code below
        }
        /* Model 3 end of code block */
    }
}

// TODO: (Model 2) Copy Report structure here

// TODO: (Model 3) Copy VolunteerDetails structure here

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
