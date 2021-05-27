require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事の保存' do
    context '記事が投稿できる場合' do
      it 'タイトルとテキストとカテゴリーがあれば投稿できる' do
        expect(@article).to be_valid
      end
    end
    context '記事が投稿できない場合' do
      it 'タイトルが空では投稿できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include ("Title can't be blank")
      end
      it 'textが空では投稿できない' do
        @article.text = ''
        @article.valid?
        expect(@article.errors.full_messages).to include ("Text can't be blank")
      end
      it 'categoryが1では登録できない' do
        @article.category_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include('Category must be other than 1')
      end
    end
  end
end