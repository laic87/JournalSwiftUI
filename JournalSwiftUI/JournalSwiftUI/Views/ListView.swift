import SwiftUI

struct ListView: View {
    
    var myJournal: Journal
    
    @Binding var showPopup: Bool
    
    var body: some View {
        
        VStack {
            
            Text("My journal").font(.title).bold()
            
            List {
                ForEach(myJournal.getEntries()) { entry in
                    Text(entry.title)
                }
            }
            
            Button(action: {
                withAnimation(.easeIn(duration: 1)) {
                    showPopup = true
                }
                
            }, label: {
                Text("Add entry").bold().padding().background(.brown).foregroundColor(.white).cornerRadius(7)
            })
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(myJournal: Journal(), showPopup: .constant(false))
    }
}

/*
 
 Om vi har en view som tar in en parameter som är en binding, så kan vi i våran Preview ge den ett värde med hjälp av .constant
 
 */
