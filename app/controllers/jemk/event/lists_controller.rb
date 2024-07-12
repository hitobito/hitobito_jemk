# frozen_string_literal: true

#  Copyright (c) 2023-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

module Jemk::Event::ListsController
  def camps
    authorize!(:list_available, Event::Camp)

    @grouped_events = grouped(upcoming_user_events_of_type(Event::Camp))
    render :events
  end

  def events
    authorize!(:list_available, Event)

    @grouped_events = grouped(upcoming_user_events_of_type(Event, allow_null: true))
  end

  private

  def upcoming_user_events
    Event
      .upcoming
      .in_hierarchy(current_user)
      .includes(:dates, :groups, :events_groups)
      .order("event_dates.start_at ASC")
  end

  def upcoming_user_events_of_type(type, allow_null: false)
    condition = OrCondition.new
    condition.or("events.type = ?", type)
    condition.or("events.type IS NULL") if allow_null

    upcoming_user_events.where(condition.to_a)
  end
end
