//
//  DeleteTodoUseCase.swift
//  Todo
//
//  Created by Sourabh Rustagi on 27/10/24.
//

import Foundation

class DeleteTodoUseCase{
    private let repository: TodoRepository
    
    init(repository: TodoRepository) {
        self.repository = repository
    }
    
    func execute(id: UUID){
        repository.deleteTodoById(id)
    }
}
