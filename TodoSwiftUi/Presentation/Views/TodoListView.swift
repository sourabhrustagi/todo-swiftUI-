//
//  ContentView.swift
//  TodoSwiftUi
//
//  Created by Sourabh Rustagi on 01/11/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoViewModel
    
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
                        HStack{
                            Text(todo.title)
                            Spacer()
                            Button(action: {
                                viewModel.deleteTodoById(todo.id)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }.navigationBarTitle("To-Do List")
        }
    }
}
