class Post < ActiveRecord::Base
  has_attached_file :picture, styles: {medium: "300x300>"},

  :storage => :s3,
  :s3_credentials => {
    :bucket => 'MakersLego',
    :access_key_id => Rails.application.secrets.s3_access_key_id,
    :secret_access_key => Rails.application.secrets.s3_secret_access_key
  }

  has_and_belongs_to_many :tags

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def tags_list
  end

  #this fixes the unknown attribute error from RSpec
  def tags_list=(some_tags)
    return if some_tags.empty?
      some_tags.split(', ').uniq.each do |tag|
      self.tags << Tag.find_or_create_by(text: tag)
    end
  end

end
