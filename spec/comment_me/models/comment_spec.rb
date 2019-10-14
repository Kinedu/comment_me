require 'rails_helper'

RSpec.describe Comment, type: :model do
  let :article do
    Article.create
  end

  let :comment do
    article.comments.create emitter: 'Armando', message: "lo que sea"
  end

  subject { comment }

  it { should respond_to(:entity_type) }
  it { should respond_to(:entity_id) }
  it { should respond_to(:emitter) }
  it { should respond_to(:message) }
  it { should respond_to(:comment_id) }

  context 'validations' do
    it { should validate_presence_of(:emitter) }
    it { should validate_presence_of(:message) }
    it { should be_valid }
  end

  context 'associations' do
    it { should belong_to(:entity).optional }
    it { should belong_to(:comment).optional }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe '#entity_exist?' do
    it { expect(subject.entity_exist?).to be_truthy }
  end

  describe '#entity_instance' do
    it { expect(comment.entity_instance.class).to eq(Article) }
  end
end