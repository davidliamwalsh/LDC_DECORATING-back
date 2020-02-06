module Types
  class QueryType < Types::BaseObject
    
    # /news_articles

    field :news_article, NewsArticleType , null: true do
      description "Find a news article by slug"
      argument :id, ID, required: true
    end

    def news_article(id:)
      NewsArticle.find(id)
    end

    field :news_articles, [NewsArticleType], null: true do
      description "Returns an array of all news articles"
    end
    
    def news_articles
      NewsArticle.all
    end

    # /testimonials

    field :testimonial, TestimonialType , null: true do
      description "Find a news article by slug"
      argument :id, ID, required: true
    end

    def testimonial(id:)
      Testimonial.find(id)
    end

    field :testimonials, [TestimonialType], null: true do
      description "Returns an array of all news articles"
    end
    
    def testimonials
      Testimonial.all
    end
    
  end
end
