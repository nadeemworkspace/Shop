//
//  TabBarView.swift
//  Shop
//
//  Created by Muhammed Nadeem on 05/01/26.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.primaryColor)
                TabsLayoutView()
            }
            .frame(height: 70, alignment: .center)
            .padding()
        }
        .background {
            Color.black
                .ignoresSafeArea()
        }
    }
}

struct TabsLayoutView: View {
    @State var selectedTab: Tab = .home
    @Namespace var namespace
    
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            
            ForEach(Tab.allCases) { tab in
                TabButton(tab: tab, selectedTab: $selectedTab, namespace: namespace)
                    .frame(width: 65, height: 65, alignment: .center)
                
                Spacer(minLength: 0)
            }
        }
    }
    
    private struct TabButton: View {
        let tab: Tab
        @Binding var selectedTab: Tab
        var namespace: Namespace.ID
        
        var body: some View {
            Button {
                withAnimation {
                    selectedTab = tab
                }
            } label: {
                ZStack {
                    if isSelected {
                        Circle()
                            .fill(Color.primaryColor)
                            .background {
                                Circle()
                                    .stroke(lineWidth: 15)
                                    .foregroundColor(.black)
                            }
                            .offset(y: -40)
                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                            .animation(.spring(), value: selectedTab)
                    }
                    
                    Image(tab.icon)
                        .font(.system(size: 23, weight: .semibold, design: .rounded))
                        .foregroundColor(isSelected ? .init(white: 0.9) : .gray)
                        .scaleEffect(isSelected ? 1 : 0.8)
                        .offset(y: isSelected ? -40 : 0)
                        .animation(isSelected ? .spring(response: 0.5, dampingFraction: 0.3, blendDuration: 1) : .spring(), value: selectedTab)
                }
            }
            .noAnimationButton()
        }
        
        private var isSelected: Bool {
            selectedTab == tab
        }
    }
}

// MARK: PREVIEW
#Preview {
    TabBarView()
}

enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case home, game, apps, movie
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .home:
            return "home"
        case .game:
            return "search"
        case .apps:
            return "cart"
        case .movie:
            return "user"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .game:
            return "Games"
        case .apps:
            return "Apps"
        case .movie:
            return "Movies"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .indigo
        case .game:
            return .pink
        case .apps:
            return .orange
        case .movie:
            return .teal
        }
    }
}
