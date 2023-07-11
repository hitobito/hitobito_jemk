# frozen_string_literal: true

#  Copyright (c) 2023-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

require 'spec_helper'

describe Group::Dachverband do
  it 'supports events' do
    expect(described_class.event_types).to include(Event)
  end

  it 'supports courses' do
    expect(described_class.event_types).to include(Event::Course)
  end
end
