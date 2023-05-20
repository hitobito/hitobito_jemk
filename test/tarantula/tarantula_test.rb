# frozen_string_literal: true

require 'test_helper'
require 'relevance/tarantula'
require 'tarantula/tarantula_config'

class TarantulaTest < ActionDispatch::IntegrationTest
  # Load enough test data to ensure that there's a link to every page in your
  # application. Doing so allows Tarantula to follow those links and crawl
  # every page.  For many applications, you can load a decent data set by
  # loading all fixtures.

  reset_fixture_path File.expand_path('../../../spec/fixtures', __FILE__)

  include TarantulaConfig

  # Crawls the application with admin permissions
  # to cover as many actions as possible.
  def test_tarantula_as_admin
    crawl_as(people(:admin))
  end

  # Crawls the application in the most common administrative role
  # on the base layer as an intermediate user.
  def test_tarantula_as_leader
    crawl_as(people(:leader))
  end

  # Crawls the application with almost no permissions in the
  # the most common member role to check the public pages and
  # the absence of links to permission denied actions.
  def test_tarantula_as_member
    crawl_as(people(:member))
  end

  private

  def configure_urls_with_hitobito_jemk(t, person)
    configure_urls_without_hitobito_jemk(t, person)

    # Wagon specific urls configuration here
  end
  alias_method_chain :configure_urls, :hitobito_jemk

end
