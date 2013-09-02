class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published


  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title
  after_save :slugalize

  validates_presence_of :title, :content

  private

  def titleize_title
    self.title = title.titleize
  end

  def slugalize
    title = self.title
    self.slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
