//
//  ContentView.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 2/9/22.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    private var sk:ScreenKit = ScreenKit.shared
    
    var body: some View {
        ZStack {
            let textVOffset:CGFloat = 50
            let textHOffset:CGFloat = 50 * 0.85
            Color(UIColor.magenta)
            let textLetters:[String] = ["D", "B", "C", "F"]
            let textOffsetDirections = [
                (x:-1, y:-1),
                (x:1, y:-1),
                (x:-1, y:1),
                (x:1, y:1)
            ]
            
            ForEach(0..<4) { i in
                Text(textLetters[i])
                    .offset(
                        x: CGFloat(textOffsetDirections[i].x) * textHOffset,
                        y: CGFloat(textOffsetDirections[i].y) * textVOffset)
                    .font(SwiftUI.Font.system(size: sk.getHeight(factor: 0.25), weight: Font.Weight.bold, design: Font.Design.rounded))
                    .foregroundColor(Color.white)
            }
        }
        
        
//                NavigationView {
//        //            List {
//        //                ForEach(items) { item in
//        //                    NavigationLink {
//        //                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//        //                    } label: {
//        //                        Text(item.timestamp!, formatter: itemFormatter)
//        //                    }
//        //                }
//        //                .onDelete(perform: deleteItems)
//        //            }
//        //            .toolbar {
//        //                ToolbarItem(placement: .navigationBarTrailing) {
//        //                    EditButton()
//        //                }
//        //                ToolbarItem {
//        //                    Button(action: addItem) {
//        //                        Label("Add Item", systemImage: "plus")
//        //                    }
//        //                }
//        //            }
//                }
    }
    
    //    private func addItem() {
    //        withAnimation {
    //            let newItem = Item(context: viewContext)
    //            newItem.timestamp = Date()
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
    //
    //    private func deleteItems(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { items[$0] }.forEach(viewContext.delete)
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
