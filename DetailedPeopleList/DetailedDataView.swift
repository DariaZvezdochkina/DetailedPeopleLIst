//
//  DetailedDataView.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 01.02.2022.
//
import SwiftUI

struct DetailedDataView: View {
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    var body: some View {
        VStack{
            List{
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
        
    }
    
}

struct DetailedDataView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedDataView(
            person: Person(
                name: "Luke",
                height: "n/a",
                mass: "n/a",
                hairColor: "n/a",
                skinColor: "n/a",
                eyeColor: "n/a",
                birthYear: "n/a",
                gender: .male,
                homeworld: "n/a",
                films: [],
                species: [],
                vehicles: [],
                starships: [],
                created: "n/a",
                edited: "n/a",
                url: "n/a"
            )
        )
    }
}

