//
//  InMemoryTodoRepository.swift
//  Todo
//
//  Created by Sourabh Rustagi on 27/10/24.
//

import Foundation

class InMemoryTodoRepository: TodoRepository{
    private var todos: [Todo] = []
    
    func addTodo(_ todo: Todo){
        todos.append(todo)
    }
    
    func fetchTodos() -> [Todo] {
        return todos
    }
    
    func deleteTodoById(_ id: UUID) {
        todos.removeAll{ $0.id == id}
    }
}
