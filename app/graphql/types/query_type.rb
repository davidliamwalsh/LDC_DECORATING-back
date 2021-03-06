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

    # /decorators

    field :decorator, DecoratorType , null: true do
      description "Find a decorator by slug"
      argument :slug, String, required: true
    end

    def decorator(slug:)
      Decorator.find(slug)
    end

    field :decorators, [UserType], null: true do
      description "Returns an array of all decorators"
    end
    
    def decorators
      Decorator.all
    end

    # /careers

    field :careers_item, CareersItemType , null: true do
      description "Find a careers item by slug"
      argument :slug, String, required: true
    end

    def careers_item(slug:)
      CareersItem.find(slug)
    end

    field :careers_items, [CareersItemType], null: true do
      description "Returns an array of all careers items"
    end
    
    def careers_items
      CareersItem.all
    end

  end
end
