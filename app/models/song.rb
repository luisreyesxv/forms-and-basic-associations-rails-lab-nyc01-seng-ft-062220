class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name
    self.artist ? self.artist.name : nil
  end


  def artist_name=(artist_string)
   self.artist = Artist.find_or_create_by(name: artist_string)
  end
   
   def note_contents=(contents)
    contents.each do |content|
      if content.strip != ""
        self.notes.new(content: content)
      end
    end
  end


  def note_contents
    self.notes.map{|note| note.content}
  end

end
