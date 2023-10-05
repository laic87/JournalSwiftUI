import SwiftUI

/*
 Eget arbete:
 
 I PopupView ska man kunna lägga in en ny anteckning i våran dagbok.
 
 Man ska även kunna klicka på en enskild anteckning och läsa alla detaljer som finns om den i en ny sida.
 
 Valfritt: Kunna ta bort en anteckning
 */

struct ContentView: View {
    
    @StateObject var myJournal = Journal()
    
    @State var showPopup = false
    
    var body: some View {
        ZStack {
            ListView(myJournal: myJournal, showPopup: $showPopup)
            
            if showPopup {
                PopupView(journal: myJournal, showPopup: $showPopup).shadow(color: .brown,radius: 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
