require_relative '../spec_helper'

describe "Article" do
  describe "inheritance" do
    it "inherits from ActiveRecord::Base" do
      expect(Article < ActiveRecord::Base).to be true
    end
  end

  describe "associations" do

    before(:all) do
      Article.delete_all
      Article.create(title: "Puppy",  content: "Lots of Love", user_id: 1)

      anna = User.find_by(name: "Anna")

      Article.delete_all
      Article.create( { :title     => "Dogs R Kool",
                    :content  => "Super cool",
                    :user_id => anna.id } )
    end

    describe "belongs to user" do
      describe "#user" do
        it "returns the article's user" do
          article = Article.first
          expected_owner = User.find(article.user_id)

          expect(article.user).to eq expected_owner
        end

        it "returns a User object" do
          article = Article.first
          expect(article.user).to be_instance_of User
        end
      end

      # describe "#user=" do
      #   it "sets user_id" do
      #     article = Article.new
      #     new_user = User.first

      #     expect{ article.owner = new_user }.to change{ article.user_id }.from(nil).to(new_user.id)
      #   end
      # end
    end
  end
end