# frozen_string_literal: true

module CommentMe
  module ActsAsCommentable
    extend ActiveSupport::Concern

    ModelCommentable = Module.new do
      extend ActiveSupport::Concern

      included do
        has_many :comments, -> { includes :comments }, as: :entity, dependent: :destroy
        accepts_nested_attributes_for :comments
      end
    end

    class_methods do
      def comment_me
        include ModelCommentable
      end
    end
  end
end

# => including the method in ActiveRecord
ActiveRecord::Base.include CommentMe::ActsAsCommentable
