//
//  ContentView.swift
//  MemoClone
//
//  Created by Reze on 5/12/26.
//

import SwiftUI

struct Memo: Identifiable {
    let id = UUID()
    var content: String
    let created = Date()
}

struct ContentView: View {
    @State var memos: [Memo] = [
        .init(content: "Hello world\nafwewf"),
        .init(content: "안녕하세용")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("메모")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(String(memos.count) + "개의 메모")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.padding()
            
            List {
                ForEach($memos) { $memo in
                    NavigationLink {
                        MemoView(memo: $memo)
                    } label: {
                        VStack(alignment: .leading, spacing: 2) {
                            let content =  memo.content;
                            let title = content.split(separator: "\n")
                            
                            Text(title[0])
                                .foregroundStyle(.black)
                                .bold()
                                .font(.title3)
                            
                            Text(memo.created.formatted(
                                    .dateTime.year().month().day()
                                    .locale(Locale(identifier: "ko_KR"))
                                )
                            )
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
        }
    }
}

struct MemoView: View {
    @Binding var memo: Memo
    
    var body: some View {
        TextEditor(text: $memo.content)
            .padding()
    }
}

#Preview {
    ContentView()
}
