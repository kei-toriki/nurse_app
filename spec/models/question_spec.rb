require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = FactoryBot.build(:question)
    sleep(0.1)
  end

  describe '質問投稿機能' do
    context '質問投稿がうまくいくとき' do
      it 'titleとexplanation、genre_idが存在すれば登録できる' do
        expect(@question).to be_valid
      end
    end


    context '新規登録できないとき' do
      it 'titleが空では登録できない' do
        @question.title = ''
        @question.valid?
        expect(@question.errors.full_messages).to include("Title translation missing: ja.activerecord.errors.models.question.attributes.title.blank")
      end
      it 'explanationが空では登録できない' do
        @question.explanation = ''
        @question.valid?
        expect(@question.errors.full_messages).to include("Explanation translation missing: ja.activerecord.errors.models.question.attributes.explanation.blank")
      end
      it 'genre_idが1では登録できない' do
        @question.genre_id = 1
        @question.valid?
        expect(@question.errors.full_messages).to include("Genre translation missing: ja.activerecord.errors.models.question.attributes.genre_id.other_than")
      end
    end
  end
end
        
