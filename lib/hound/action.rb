module Hound
  class Action < ActiveRecord::Base
    self.table_name = 'hound_actions'
    attr_accessible :action, :actionable_id, :actionable_type
    belongs_to :actionable, polymorphic: true
    belongs_to :user, class_name: Hound.config.user_class.name

    scope :created,   -> { where(action: 'create')  }
    scope :updated,   -> { where(action: 'update')  }
    scope :destroyed, -> { where(action: 'destroy') }
  end
end