class Tag < ActiveRecord::Base

  has_many :notes, through: :taggings
  has_many :taggings

  before_validation :downcase_name
                    :strip_spaces
                    :remove_symbols
                    :remove_spaces

  def remove_symbols
    self.name = self.name.gsub(/[^0-9a-z ]/i, '')
  end

  def remove_spaces
    self.name = self.name.gsub(' ', '_')
  end

  def downcase_name
    self.name = self.name.downcase
  end

  def strip_spaces
    self.name = self.name.strip
  end

  def self.clean_name(name)
    tag = Tag.new(name: name)
    tag.strip_spaces
    tag.remove_symbols
    tag.downcase_name
    tag.remove_spaces
  end

end
