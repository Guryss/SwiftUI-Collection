//
//  DiarySearchView.swift
//  SearchBarPractice
//
//  Created by Seoyeon Choi on 11/18/24.
//

import SwiftUI

struct DiarySearchView: View {
    @State private var showSearchView: Bool = false
    @State private var searchText: String = ""
    @FocusState private var textFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(.systemGray6).ignoresSafeArea()
                VStack {
                    Spacer()
                    Button {
                        withAnimation(.easeIn(duration: 0.2)) {
                            showSearchView.toggle()
                            textFocused = true
                        }
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
                if showSearchView {
                    Color.diaryBackground.ignoresSafeArea()
                    
                    SearchBackgroundView()
                    
                    SearchTopModalView(showSearchView: $showSearchView,
                                       searchText: $searchText,
                                       textFocused: $textFocused)
                    .transition(.move(edge: .top))
                    .ignoresSafeArea(edges: .top)
                    .zIndex(1)
                }
            }
            .ignoresSafeArea(edges: .top)
            .ignoresSafeArea(.keyboard)
            .navigationTitle(showSearchView ? "" : "일기")
        }
    }
    
    private struct SearchTopModalView: View {
        @Binding var showSearchView: Bool
        @Binding var searchText: String
        var textFocused: FocusState<Bool>.Binding
        
        var body: some View {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.white)
                    .frame(height: 105)
                    .overlay {
                        VStack {
                            Spacer()
                            HStack(spacing: 0) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(height: 33)
                                    .padding(.trailing, 10)
                                    .overlay {
                                        HStack(spacing: 0) {
                                            Image(systemName: "magnifyingglass")
                                                .padding(.horizontal, 4)
                                            TextField("검색", text: $searchText)
                                                .padding(.horizontal, 4)
                                                .padding(.vertical, 5)
                                                .focused(textFocused)
                                        }
                                    }
                                
                                Button{
                                    withAnimation(.easeIn(duration: 0.2)) {
                                        showSearchView.toggle()
                                        textFocused.wrappedValue = false
                                    }
                                } label: {
                                    Text("취소")
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 15)
                        }
                    }
            }
        }
    }
    
    private struct SearchBackgroundView: View {
        var body: some View {
            VStack(spacing: 0) {
                Spacer()
                Text("카테고리")
                    .font(.system(size: 17, weight: .medium))
                
                Label("전체", image: "photo")
                    .font(.system(size: 14, weight: .regular))
                
                Label("녹음된 오디오", image: "photo")
                    .font(.system(size: 14, weight: .regular))
                
                Label("텍스트만", image: "photo")
                    .font(.system(size: 14, weight: .regular))
                Spacer()
            }
        }
    }
}

#Preview {
    DiarySearchView()
}
