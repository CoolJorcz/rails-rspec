class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published


  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title,

  validates_presence_of :title, :content

  private

  def titleize_title
    self.title = title.titleize
  end

  def slugalize(string)
    string.gsub!(/[^\x00-\x7F]+/, '')
    string.gsub!(/[^a-z0-9\-_\+]+/, '-')
    string.gsub!(/-{2,}/, '-')
    string.gsub!(/^-|-$/, '')
    string.downcase!
    string
  end

end
