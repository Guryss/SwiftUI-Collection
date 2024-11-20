//
//  ContentView.swift
//  SearchBarPractice
//
//  Created by Seoyeon Choi on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSearchView: Bool = false
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    
                    Button {
                        showSearchView.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.system(size: 30, weight: .semibold))
                            .imageScale(.large)
                            .foregroundStyle(.gray)
                    }
                    
                    Text("나타나라 얍!")
                        .font(.system(size: 30, weight: .semibold))
                        .padding()
                    
                    Spacer()
                }
                
                // 검색 화면
                if showSearchView {
                    VStack {
                        Color(.systemGray)
                            .ignoresSafeArea(edges: .bottom)
                    }
                    .searchable(text: $searchText,
                                isPresented: $showSearchView,
                                placement: .navigationBarDrawer,
                                prompt: "검색")
                    
                }
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    ContentView()
}
