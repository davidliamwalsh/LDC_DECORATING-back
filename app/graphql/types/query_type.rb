module Types
  class QueryType < Types::BaseObject
    
    # /news_articles

    field :news_article, NewsArticleType , null: true do
      description "Find a news article by slug"
      argument :slug, String, required: true
    end

    def news_article(slug:)
      NewsArticle.find(slug)
    end

    field :news_articles, [NewsArticleType], null: true do
      description "Returns an array of all news articles"
    end
    
    def news_articles
      NewsArticle.all
    end

    # /testimonials

    field :testimonial, TestimonialType , null: true do
      description "Find a news testimonial by slug"
      argument :slug, String, required: true
    end

    def testimonial(slug:)
      Testimonial.find(slug)
    end

    field :testimonials, [TestimonialType], null: true do
      description "Returns an array of all testimonials"
    end
    
    def testimonials
      Testimonial.all
    end
    
    # /users

    field :user, UserType , null: true do
      description "Find a user by slug"
      argument :slug, String, required: true
    end

    def user(slug:)
      User.find(slug)
    end

    field :users, [UserType], null: true do
      description "Returns an array of all users"
    end
    
    def users
      User.all
    end

  end
end
