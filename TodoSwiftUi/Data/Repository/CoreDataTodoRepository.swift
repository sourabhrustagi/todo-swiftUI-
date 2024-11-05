//
//  CoreDataTodoRepository.swift
//  TodoSwiftUi
//
//  Created by Sourabh Rustagi on 05/11/24.
//

import Foundation
import CoreData

class CoreDataTodoRepository: TodoRepository{
    private let context: NSManagedObjectContext
   
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func addTodo(title: String) {
        let entity = TodoEntity(context: context)
        entity.id = UUID()
        entity.title = title
    }
    
    func fetchTodos() -> [Todo] {
        let request: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
        
        do{
            let entities = try context.fetch(request)
            return entities.map{Todo(id: $0.id ?? UUID(), title: $0.title ?? "")}
        }catch{
            print("Failed to fetch todos: \(error)")
            return []
        }
    }
    
    func deleteTodoById(_ id: UUID) {
        let request: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do{
            let entities = try context.fetch(request)
            entities.forEach{context.delete($0)}
            saveContext()
        }
        catch{
            print("Failed to delete todo: \(error)")
        }
    }
    
    private func saveContext(){
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("Failed to save context: \(error)")
            }
        }
    }
    
    
}
