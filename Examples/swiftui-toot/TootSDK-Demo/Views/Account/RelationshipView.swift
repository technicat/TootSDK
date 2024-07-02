//
//  RelationshipView.swift
//  SwiftUI-Toot
//
//  Created by dave on 21/12/22.
//

import SwiftUI
import TootSDK

struct RelationshipView: View {
    @EnvironmentObject var tootManager: TootManager

    @State var relationship: Relationship
    @State var showingReblogs: Bool = false
    @State var notifying: Bool = false
    @State var muting: Bool = false
    @State var blocking: Bool = false

    @State var followNotify: Bool = false
    @State var followShowingReblogs: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            AccountItemView(description: "Following", value: "\(relationship.following ?? false)")
                .frame(alignment: .leading)
            Toggle("Showing Boosts:", isOn: $showingReblogs)
            Toggle("Notifying:", isOn: $notifying)
            Toggle("Muting:", isOn: $muting)
            Toggle("Blocking:", isOn: $blocking)

            buttons()
        }
        .onAppear {
            self.updateTogglesWith(self.relationship)
        }
        .onChange(of: relationship) { newValue in
            self.updateTogglesWith(newValue)
        }
        .onChange(of: showingReblogs) { newValue in
            self.refreshAccount()
        }
        .onChange(of: notifying) { newValue in
            self.refreshAccount()
        }
        .onChange(of: muting) { newValue in
            if let id = relationship.id {
            Task {
                    if muting {
                        self.relationship = try await tootManager.currentClient.muteAccount(by: id)
                    } else {
                        self.relationship = try await tootManager.currentClient.unmuteAccount(by: id)
                    }
                }
            }
        }
        .onChange(of: blocking) { newValue in
            if let id = relationship.id {
                Task {
                    
                    if blocking {
                        self.relationship = try await tootManager.currentClient.blockAccount(by: id)
                    } else {
                        self.relationship = try await tootManager.currentClient.unblockAccount(by: id)
                    }
                }
            }
        }
    }

    func updateTogglesWith(_ value: Relationship) {
        showingReblogs = value.showingReposts ?? false
        notifying = value.notifying ?? false
        muting = value.muting ?? false
        blocking = value.blocking ?? false
    }

    @ViewBuilder func buttons() -> some View {
        if let id = relationship.id {
            if relationship.following == true {
                ButtonView(text: "Unfollow") {
                    self.relationship = try await tootManager.currentClient.unfollowAccount(by: id)
                }
            } else {
                HStack {
                    ButtonView(text: "Follow") {
                        self.relationship = try await tootManager.currentClient.followAccount(
                            by: id,
                            params: FollowAccountParams(
                                reposts: followShowingReblogs,
                                notify: followNotify))
                    }
                    
                    Spacer()
                    
                    Toggle("Show Boosts", isOn: $followShowingReblogs)
                    Toggle("Show Notify", isOn: $followNotify)
                }
            }
        }
    }

    func refreshAccount() {
        if let id = relationship.id {
            Task {
                self.relationship = try await tootManager.currentClient.followAccount(
                    by: id, params: FollowAccountParams(reposts: showingReblogs, notify: notifying))
            }
        }
    }
}
