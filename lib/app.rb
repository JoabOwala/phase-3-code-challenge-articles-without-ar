

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

  def add_article(magazine, title)
    article = Article.new(self, magazine, title)
    @articles << article
    magazine.add_contributor(self)
    article
  end

  def topic_areas
    magazines.map { |magazine| magazine.category }.uniq
  end
end

class Magazine
  attr_accessor :name, :category

  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @contributors = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find { |magazine| magazine.name == name }
  end

  def self.article_titles
    Article.all.map { |article| article.title }
  end

  def self.contributing_authors
    Article.all.group_by { |article| article.author }.select { |_, articles| articles.length > 2 }.keys
  end

  def add_contributor(author)
    @contributors << author
  end

  def contributors
    @contributors
  end
end

class Article
  attr_reader :author, :magazine, :title

  
end

