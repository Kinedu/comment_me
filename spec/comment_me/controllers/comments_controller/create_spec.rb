require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    let :article do
      Article.create
    end

    context 'status 200 ok' do
      before do

        post(
          :create,
          format: :json,
          params: {
            comment: {
              entity_type: "Article",
              entity_id: article,
              emitter: "Armando Alejandre",
              message: "Lo que SEA"
            }
          }
        )
      end

      it { expect(response).to be_successful }

      it { expect(response.content_type).to eq("application/json") }
    end

    context 'status unprocessable entity' do
      before do

        post(
          :create,
          format: :json,
          params: {
            comment: {
              entity_type: "Article",
              entity_id: 100,
              emitter: nil,
              message: "Lo que SEA"
            }
          }
        )
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }

      it { expect(response.content_type).to eq("application/json") }
    end
  end
end