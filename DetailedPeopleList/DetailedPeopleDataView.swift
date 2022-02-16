//
//  DetailedDataView.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 01.02.2022.
//
import SwiftUI

struct DetailedPeopleDataView: View {
    
    @ObservedObject private var viewModel: DetailedPeopleDataViewModel
    @State var shouldPresentError = false
    
    init(viewModel: DetailedPeopleDataViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if let person = viewModel.person {
            ScrollView {
                LazyVStack {
                    HStack{
                        Text("Name")
                        Spacer()
                        Text(person.name)
                    }
                    HStack{
                        Text("Height")
                        Spacer()
                        Text(person.height)
                    }
                    HStack{
                        Text("Hair Color")
                        Spacer()
                        Text(person.hairColor)
                    }
                    HStack{
                        Text("Skin Color")
                        Spacer()
                        Text(person.skinColor)
                    }
                }
            }
            .padding(.horizontal)
            .alert("Something goes wrong", isPresented: $viewModel.shouldPresentError) {
                Button("Cancel", role: .cancel) {}
            }
        } else {
            ProgressView()
                .progressViewStyle(.circular)
                .padding()
                .task {
                    await viewModel.fetchPerson()
                }
        }
    }
}

struct DetailedPeopleDataView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedPeopleDataView(viewModel: .init(url: URL(string: "https://swapi.dev/api/people/1/")!))
    }
}

