# frozen_string_literal: true

#  Copyright (c) 2023-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

class Event::Camp < Event
  self.used_attributes += [:waiting_list]

  self.supports_applications = true

  def tentative_application_possible?
    false
  end
end
