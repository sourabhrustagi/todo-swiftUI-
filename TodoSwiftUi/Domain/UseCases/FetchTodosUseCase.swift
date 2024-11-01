//
//  FetchTodosUseCase.swift
//  Todo
//
//  Created by Sourabh Rustagi on 27/10/24.
//

import Foundation

class FetchTodosUseCase{
    private let repository: TodoRepository
    
    init(repository: TodoRepository){
        self.repository = repository
    }
    
    func execute()-> [Todo]{
        return repository.fetchTodos()
    }
}
