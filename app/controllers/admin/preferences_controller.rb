class Admin::PreferencesController < ApplicationController

  def index
    @preference = Preference.last
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.create(artist_sort_order: params[:artist_sort_order], song_sort_order: params[:song_sort_order], allow_create_songs: params[:allow_create_songs], allow_create_artists: params[:allow_create_artists])
    redirect_to preferences_path
  end
end
