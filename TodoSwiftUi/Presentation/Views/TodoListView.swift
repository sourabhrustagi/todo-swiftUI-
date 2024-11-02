//
//  ContentView.swift
//  TodoSwiftUi
//
//  Created by Sourabh Rustagi on 01/11/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoViewModel
    @State private var showAlert = false
    @State private var todoToDelete: Todo?
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("New To-Do", text: $viewModel.newTodoTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        viewModel.addTodo()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                    .padding()
                }
                List {
                    ForEach(viewModel.todos){todo in
                            Text(todo.title)
                    }.onDelete(perform: deleteTodo)
                }
            }
            .navigationBarTitle("To-Do List")
            .alert(isPresented: $showAlert){
                    Alert(
                        title: Text("Delete To-Do"),
                        message: Text("Are you sure you want to delete this item?"),
                        primaryButton: .destructive(Text("Delete")){
                            if let todo = todoToDelete{
                                viewModel.deleteTodoById(todo.id)
                            }
                        },
                        secondaryButton: .cancel()
                    )
            }
            
        }
    }
    
    private func deleteTodo(at offsets: IndexSet){
        offsets.forEach{ index in
            todoToDelete = viewModel.todos[index]
            showAlert = true
        }
    }
}
