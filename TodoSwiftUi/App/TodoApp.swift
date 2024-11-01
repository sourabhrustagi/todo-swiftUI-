//
//  TodoSwiftUiApp.swift
//  TodoSwiftUi
//
//  Created by Sourabh Rustagi on 01/11/24.
//

import SwiftUI

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = InMemoryTodoRepository()
            let addTodoUseCase = AddTodoUseCase(repository: repository)
            let fetchTodosUseCase = FetchTodosUseCase(repository: repository)
            let deleteTodoUseCase = DeleteTodoUseCase(repository: repository)
            let viewModel = TodoViewModel(addTodoUseCase: addTodoUseCase, fetchTodosUseCase: fetchTodosUseCase, deleteTodoUseCase: deleteTodoUseCase)
            TodoListView(viewModel: viewModel)
        }
    }
}
