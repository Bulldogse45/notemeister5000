class Note < ActiveRecord::Base

  has_many :tags, through: :taggings
  has_many :taggings
  validates_presence_of :title, :body

  def tag_names=(alltags)
    alltags.split(",").collect{|t| t.strip}.each do |tag|
      this_tag = Tag.find_or_create_by(name: Tag.clean_name(tag))
      self.tags << this_tag
    end
  end

  def tag_names
    self.tags.collect{|t| t.name}.join(", ")
  end


end
