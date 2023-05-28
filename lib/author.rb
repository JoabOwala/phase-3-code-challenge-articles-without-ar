

class Author
  attr_reader :name

  def initialize(name)
   @name = name
   @articles = []
  end

  def articles
    @articles
  end

  def magazines
    @articles.map { |article| article.magazine }.uniq
  end
  
end

