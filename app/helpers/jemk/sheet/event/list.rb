# frozen_string_literal: true

#  Copyright (c) 2023-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.

module Jemk::Sheet::Event::List
  extend ActiveSupport::Concern

  included do
    alias_method_chain :render_left_nav, :camps
  end

  def render_left_nav_with_camps
    if view.nav_left == 'camps'
      view.render 'nav_left_events'
    else
      render_left_nav_without_camps
    end
  end

end
