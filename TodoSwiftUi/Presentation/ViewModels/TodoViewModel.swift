//
//  TodoViewModel.swift
//  Todo
//
//  Created by Sourabh Rustagi on 27/10/24.
//

import Foundation

class TodoViewModel: ObservableObject{
    @Published var todos: [Todo] = []
    @Published var newTodoTitle: String = ""
    
    private let addTodoUseCase: AddTodoUseCase
    private let fetchTodosUseCase: FetchTodosUseCase
    private let deleteTodoUseCase: DeleteTodoUseCase
    
    init(addTodoUseCase: AddTodoUseCase, fetchTodosUseCase: FetchTodosUseCase, deleteTodoUseCase: DeleteTodoUseCase) {
        self.addTodoUseCase = addTodoUseCase
        self.fetchTodosUseCase = fetchTodosUseCase
        self.deleteTodoUseCase = deleteTodoUseCase
        fetchTodos()
    }
    
    func fetchTodos(){
        todos = fetchTodosUseCase.execute()
    }
    
    func addTodo(){
        guard !newTodoTitle.isEmpty else {return}
        addTodoUseCase.execute(title: newTodoTitle)
        newTodoTitle = ""
        fetchTodos()
    }
    
    func deleteTodoById(_ id: UUID){
        deleteTodoUseCase.execute(id: id)
        fetchTodos()
    }
}
