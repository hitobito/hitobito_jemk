# frozen_string_literal: true

#  Copyright (c) 2012-2023, Jungschar EMK. This file is part of
#  hitobito_jemk and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_jemk.


Rails.application.routes.draw do

  extend LanguageRouteScope

  language_scope do
    # Define wagon routes here

    resources :groups do
      resources :events, only: [] do # do not redefine events actions, only add new ones
        collection do
          get 'camp' => 'events#index', type: 'Event::Camp'
        end
      end
    end

    get 'list_camps' => 'event/lists#camps', as: :list_camps
  end

end
