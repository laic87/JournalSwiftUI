import Foundation

class Journal: ObservableObject {
    
    @Published private var entries: [JournalEntry]
    
    init() {
        self.entries = [JournalEntry]()
        
        self.entries.append(JournalEntry(title: "Test1", description: "Hej", date: Date()))
        self.entries.append(JournalEntry(title: "Test2", description: "Hej", date: Date()))
        self.entries.append(JournalEntry(title: "Test3", description: "Hej", date: Date()))
    }
    
    
    func getEntries() -> [JournalEntry] {
        return entries
    }
    
    func addEntrie(journalEntry: JournalEntry) -> Void {
        entries.append(journalEntry)
    }
    
}
