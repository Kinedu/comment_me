class Comment < ActiveRecord::Base

  # => associations
  belongs_to :entity, polymorphic: true, optional: false
  belongs_to :comment, optional: true
  has_many :comments, dependent: :destroy

  # => Validations
  validates_presence_of :emitter, :message
  validate :entity_existence

  private

  def entity_existence
    unless entity_existence?
      errors.add(
        :entity,
        "#{entity_type} doesn't have association with Comment or there's no record in #{entity_type} witn id=#{entity_id}"
      )
    end
  end

  def entity_existence?
    entity_model&.respond_to?(self.class.name.tableize)
  end

  def entity_model
     "#{entity_type}".constantize.find_by(id: entity_id)
  end
end