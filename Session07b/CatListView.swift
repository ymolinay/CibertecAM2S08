//
//  CatListView.swift
//  Session07b
//
//  Created by DAMII on 16/12/24.
//

import SwiftUI

struct CatListView : View {
    @StateObject private var viewModel = CatViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando gatitos...")
                } else if let errorMessage = viewModel.messageError {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.cats) { cat in
                        NavigationLink(destination: CatDetailView(cat: cat)) {
                            VStack(alignment: .leading) {
                                Text(cat.name)
                                    .font(.headline)
                                Text("Origen: \(cat.origin)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Gatos")
            .onAppear {
                viewModel.fetchCats()
            }
        }
    }
}
