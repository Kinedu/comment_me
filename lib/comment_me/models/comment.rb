class Comment < ActiveRecord::Base

  # => associations
  belongs_to :entity, polymorphic: true
  belongs_to :comment, optional: true
  has_many :comments, dependent: :destroy

  # => Validations
  validates_presence_of :emitter, :message

  # => callback
  after_create :entity_existence

  # => *
  def entity_exist?
    entity_instance&.respond_to?(self.class.name.tableize)
  end

  # => * 
  def entity_instance
    "#{entity_type}".constantize.find_by(id: entity_id)
  end

  private

  # => *
  def entity_existence
    unless entity_exist?
      raise ActiveRecord::Rollback
    end
  end
end