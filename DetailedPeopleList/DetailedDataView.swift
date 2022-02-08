//
//  DetailedDataView.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 01.02.2022.
//
import SwiftUI

struct DetailedDataView: View {
    
    @ObservedObject private var viewModel: DetailedDataViewModel
//    @State var shouldPresentError = false
    
    init(viewModel: DetailedDataViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if let person = viewModel.person {
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
                } else {
                    
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
//            .alert("Something goes wrong", isPresented: $viewModel.shouldPresentError) {
//                Button("Cancel", role: .cancel) {}
//            }
        }.task {
            await viewModel.fetchPerson()
        }
        
    }
    
}

struct DetailedDataView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedDataView(viewModel: .init(url: URL(string: "")!))
    }
}

