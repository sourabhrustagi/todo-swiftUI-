//
//  DIContainer.swift
//  TodoSwiftUi
//
//  Created by Sourabh Rustagi on 03/11/24.
//

import Swinject

class DiContainer{
    static let shared = DiContainer()
    let container: Container
    
    private init(){
        container = Container()
        
        container.register(TodoRepository.self){ _ in CoreDataTodoRepository(context: CoreDataStack.shared.context)
        }
        container.register(AddTodoUseCase.self) { r in
            AddTodoUseCase(repository: r.resolve(TodoRepository.self)!)
        }
        container.register(FetchTodosUseCase.self) { r in
            FetchTodosUseCase(repository: r.resolve(TodoRepository.self)!)
        }
        container.register(DeleteTodoUseCase.self) { r in
            DeleteTodoUseCase(repository: r.resolve(TodoRepository.self)!)
        }
        container.register(TodoViewModel.self) { r in
            TodoViewModel(
                addTodoUseCase: r.resolve(AddTodoUseCase.self)!,
                fetchTodosUseCase: r.resolve(FetchTodosUseCase.self)!,
                deleteTodoUseCase: r.resolve(DeleteTodoUseCase.self)!
            )
        }
        
    }
}
