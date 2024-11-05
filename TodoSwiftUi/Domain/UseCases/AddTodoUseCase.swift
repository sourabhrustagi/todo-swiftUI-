//
//  AddTodoUseCase.swift
//  Todo
//
//  Created by Sourabh Rustagi on 27/10/24.
//

import Foundation

class AddTodoUseCase{
    private let repository: TodoRepository
    
    init(repository: TodoRepository) {
        self.repository = repository
    }
    
    func execute(title: String){
        repository.addTodo(title:title)
    }
}
