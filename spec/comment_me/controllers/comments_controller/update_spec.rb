require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'PUT #update' do
    let :article do
      Article.create
    end

    let :comment do
      article.comments.create emitter: "Armando Alejandre", message: "Lo que SEA"
    end

    context 'status 200 ok' do
      before do
        put(
          :update,
          format: :json,
          params: {
            id: comment,
            comment: {
              emitter: "Armando Alejandre 3",
              message: "Lo que SEA 3"
            }
          }
        )
      end

      it { expect(response).to be_successful }

      it { expect(response.content_type).to eq("application/json") }
    end

    context 'status unprocessable entity' do
      before do
        put(
          :update,
          format: :json,
          params: {
            id: comment,
            comment: {
              emitter: nil,
              message: nil
            }
          }
        )
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }

      it { expect(response.content_type).to eq("application/json") }
    end

    context 'status not found' do
      before do
        put(
          :update,
          format: :json,
          params: {
            id: 100,
            comment: {
              emitter: "Armando Alejandre 3",
              message: "Lo que SEA 3"
            }
          }
        )
      end

      it { expect(response).to be_not_found }
    end
  end
end