//
//  TodoRepository.swift
//  Todo
//
//  Created by Sourabh Rustagi on 27/10/24.
//

import Foundation

protocol TodoRepository{
    func addTodo(_ todo: Todo)
    func fetchTodos() -> [Todo]
    func deleteTodoById(_ id: UUID)
}
