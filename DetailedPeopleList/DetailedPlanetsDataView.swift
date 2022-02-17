//
//  DetailedPlanetsDataView.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 17.02.2022.
//

import Foundation
import SwiftUI

struct DetailedPlanetsDataView: View {
    @ObservedObject private var viewModel: DetailedPlanetViewModel
    
    init(viewModel: DetailedPlanetViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if let planet = viewModel.planet {
            ScrollView {
                LazyVStack {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(planet.name)
                    }
                    HStack {
                        Text("Climate")
                        Spacer()
                        Text(planet.climate)
                    }
                    HStack {
                        Text("Population")
                        Spacer()
                        Text(planet.population)
                    }
                    HStack {
                        Text("Rotation Period")
                        Spacer()
                        Text(planet.rotationPeriod)
                    }
                }
            }
            .padding(.horizontal)
            .alert("Something goes wrong", isPresented: $viewModel.presentedError) {
                Button("Cancel", role: .cancel) {}
            }
        } else {
            ProgressView()
                .progressViewStyle(.circular)
                .padding()
                .task {
                    await viewModel.fetchPlanet()
                }
        }
    }
}

struct DetailedPlanetsDataView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedPeopleDataView(viewModel: .init(url: URL(string: "https://swapi.dev/api/planets/3/")!))
    }
}

