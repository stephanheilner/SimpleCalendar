//
// Created by Paul Peelen
// Copyright © 2023 AppTrix AB. All rights reserved.
//

import SwiftUI
import SimpleCalendar

struct SelectiveDates: View {
    @Binding var events: [any CalendarEventRepresentable]
    @Binding var selectedDate: Date

    var body: some View {
        let day: Double = (60 * 60) * 24
        let availableDates = [
            Date(timeIntervalSinceNow: day),
            Date(timeIntervalSinceNow: day * 2),
            Date(timeIntervalSinceNow: day * 3),
            Date(timeIntervalSinceNow: day * 4)
        ]

        NavigationStack {
            SimpleCalendarView(
                events: $events,
                selectedDate: $selectedDate,
                selectionAction: .none,
                dateSelectionStyle: .selectedDates(availableDates),
                hourHeight: 50,
                hourSpacing: 48,
                startHourOfDay: 0
                endHourOfDay: 24
            )
            .navigationTitle("+10 days from now")
        }
        .onAppear {
            selectedDate = Date(timeIntervalSinceNow: (24 * 3600) * 10)
        }
    }
}
