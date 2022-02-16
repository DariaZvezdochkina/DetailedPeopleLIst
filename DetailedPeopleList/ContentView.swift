//
//  ContentView.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 27.01.2022.
//

import SwiftUI
import ComposableArchitecture

struct AppState: Equatable {
    var results: IdentifiedArrayOf<Person> = []
}

enum AppAction: Equatable {
    case fetchingData
    case fetched(People)
    
}

struct AppEnvironment {
    let peopleFetcher = PeopleFetcherService()
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
    case .fetchingData:
        return Effect<People, Never>.future { completion in
            Task {
                let people = try! await environment.peopleFetcher.fetch()
                completion(.success(people))
            }
        }
        .map(AppAction.fetched)
        .receive(on: DispatchQueue.main)
        .eraseToEffect()
        
    case .fetched(let people):
        state.results = IdentifiedArrayOf(uniqueElements: people.results)
        return .none
    }
}

struct ContentView: View {
    let store: Store<AppState, AppAction>
    
    init(store: Store<AppState, AppAction>) {
        self.store = store
    }
    
    var body: some View {
        NavigationView {
            WithViewStore(store) { viewStore in
                List {
                    ForEach(viewStore.results) { item in
                        NavigationLink(destination: DetailedPeopleDataView(viewModel: .init(url: URL(string: item.url)!))) {
                            VStack {
                                Text(item.name)
                            }
                        }
                        
                    }
                }
                .onAppear {
                    viewStore.send(.fetchingData)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: .init(initialState: .init(), reducer: appReducer, environment: .init()))
    }
}



