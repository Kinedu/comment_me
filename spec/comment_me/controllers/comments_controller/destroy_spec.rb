require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'DELETE #destroy' do
    let :article do
      Article.create
    end

    let :comment do
      article.comments.create emitter: "Armando Alejandre", message: "Lo que SEA"
    end

    context 'status 200 ok' do
      before do
        delete(
          :show,
          format: :json,
          params: { id: comment }
        )
      end

      it { expect(response).to be_successful }
    end

    context 'status not found' do
      before do
        delete(
          :show,
          format: :json,
          params: { id: 100 }
        )
      end

      it { expect(response).to be_not_found }
    end
  end
end