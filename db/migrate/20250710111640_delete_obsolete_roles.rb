class DeleteObsoleteRoles < ActiveRecord::Migration[7.1]
  OBSOLETE_ROLES = [
    "Group::Ortsjungschar::Leiter",
    "Group::Ortsjungschar::Aktivmitglied",
    "Group::Ortsjungschar::Passivmitglied",
    "Group::OrtsjungscharMitglieder::Leiter",
  ]

  def like_conditions(column)
    OBSOLETE_ROLES.map do |role|
      "#{column} LIKE '%#{role}%'"
    end.join(" OR ")
  end

  def in_condition(column)
    "#{column} IN (" + OBSOLETE_ROLES.map do |role|
      ActiveRecord::Base.connection.quote(role)
    end.join(", ") + ")"
  end

  def up
    execute <<~SQL.squish
      DELETE FROM people_filters WHERE #{like_conditions('filter_chain')}
    SQL

    execute <<~SQL.squish
      DELETE FROM related_role_types WHERE #{in_condition('role_type')}
    SQL

    execute <<~SQL.squish
      DELETE FROM versions
      WHERE item_type = 'Role'
        AND item_id IN (
          SELECT id FROM roles WHERE #{in_condition('type')}
        )
    SQL

    execute <<~SQL.squish
      DELETE FROM versions WHERE #{like_conditions('object_changes')}
    SQL

    execute <<~SQL.squish
      DELETE FROM roles WHERE #{in_condition('type')}
    SQL

    execute <<~SQL.squish
      DELETE FROM subscriptions
      WHERE id IN (
        SELECT s.id
        FROM subscriptions s
        LEFT JOIN related_role_types rrt
          ON rrt.relation_id = s.id AND rrt.relation_type = 'Subscription'
        WHERE rrt.id IS NULL
        AND s.subscriber_type = 'Group'
      );
    SQL
  end

  def down
  end
end
