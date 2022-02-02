//
//  ContentView.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 27.01.2022.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject private var viewModel: ContentViewModel
  
  init(viewModel: ContentViewModel = .init()) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    List{
      ForEach(viewModel.results, id: \.url) { item in
        VStack {
          Text(item.name)
        }
      }
    }
    .task {
      await viewModel.fetchData()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


