import SwiftUI

struct PopupView: View {
    
    // Vi vill att våran popupview ska vara i storleken 80% av widthen på dess parent
    // och kanske 60% av höjden på dess parent
    
    @State var txtTitle = ""
    @State var txtDescription = ""
    
    @ObservedObject var journal: Journal
    @Binding var showPopup: Bool
    
    var body: some View {
        GeometryReader { geometry in
        
        VStack {
            Text("Add entry").font(.title).bold().foregroundColor(.white).padding()
            
            VStack(alignment: .leading) {
                Text("Ange titel").foregroundColor(.white)
                TextField("", text: $txtTitle).textFieldStyle(.roundedBorder)
                
                Text("Ange beskrivning").foregroundColor(.white)
                TextEditor(text: $txtDescription).cornerRadius(9)
            }.padding()
            
            VStack(spacing: 20) {
                Button(action: {
                    journal.addEntrie(journalEntry: JournalEntry(title: txtTitle, description: txtDescription, date: Date()))
                }, label: {
                    Text("Save").padding().background(.white).foregroundColor(.black).bold().cornerRadius(9)
                })
                
                Button(action: {
                    showPopup = false
                }, label: {
                    Text("Cancel").foregroundColor(.white)
                })
            }.padding()
            
            
            Spacer()
        }
        .background(.brown)
        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.6, alignment: .center)
        .cornerRadius(9)
        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(journal: Journal(), showPopup: .constant(true))
    }
}
