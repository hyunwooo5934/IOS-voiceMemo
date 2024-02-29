//
//  PathType.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/21.
//


enum PathType : Hashable {
    case homeView
    case todoView
    case memoView(isCreateMode: Bool, memo: Memo?)
}
