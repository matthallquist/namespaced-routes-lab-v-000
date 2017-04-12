class Preference < ActiveRecord::Base

  def self.current_preferences
    @preferences = Preference.last
  end

  def self.artist_sort
    pref = Preference.current_preferences
    if pref != nil
      if pref.artist_sort_order == "ASC"
        Artist.all.sort_by {|a| a.name}
      elsif pref.artist_sort_order == "DESC"
        (Artist.all.sort_by {|a| a.name}).reverse
      else
        Artist.all
      end
    else
      Artist.all
    end
  end

  def self.song_sort_with_artist(artist)
    pref = Preference.current_preferences
    if pref != nil
      if pref.song_sort_order == "ASC"
        artist.songs.sort_by {|a| a.title}
      elsif pref.song_sort_order == "DESC"
        (artist.songs.sort_by {|a| a.title}).reverse
      else
        artist.songs
      end
    else
      Song.all
    end
  end

  def self.song_sort_no_artist
    pref = Preference.current_preferences
    if pref != nil
      if pref.song_sort_order == "ASC"
        Song.all.sort_by {|a| a.title}
      elsif pref.song_sort_order == "DESC"
        (Song.all.sort_by {|a| a.title}).reverse
      else
        Song.all
      end
    else
      Song.all
    end
  end

end
