//
//  PlanetsView.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 16.02.2022.
//

import Foundation
import SwiftUI
import IdentifiedCollections
import ComposableArchitecture

struct PlanetsState: Equatable {
    var planetsResult: IdentifiedArrayOf<Planet> = []
}

enum PlanetsAction: Equatable {
    case fetchingData
    case fetched(Planets)
}

struct PlanetsEnvironment {
    let planetsFetcher = PlanetsFetcherService()
}

let planetsReducer = Reducer <PlanetsState, PlanetsAction, PlanetsEnvironment> { state, action, environment in
    
    switch action {
    case .fetchingData:
        return Effect<Planets, Never>.future { completion in
            Task {
                let planets = try! await environment.planetsFetcher.fetchPlanets()
                completion(.success(planets))
            }
        }
        .map(PlanetsAction.fetched)
        .receive(on: DispatchQueue.main.eraseToAnyScheduler())
        .eraseToEffect()
    
        
    case .fetched(let planets):
        state.planetsResult = IdentifiedArrayOf(uniqueElements: planets.results)
        return .none
    }
}

struct PlanetsView: View {
    let store: Store<PlanetsState, PlanetsAction>
    
    init(store: Store<PlanetsState, PlanetsAction>) {
        self.store = store
    }
    
    var body: some View {
        NavigationView {
            WithViewStore(store) { viewStore in
                List {
                    ForEach(viewStore.planetsResult) { item in
                        NavigationLink(destination: DetailedPlanetsDataView(viewModel: .init(url: URL(string: item.url)!))) {
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

struct PlanetsView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsView(store: .init(initialState: .init(), reducer: planetsReducer, environment: .init()))
    }
}
