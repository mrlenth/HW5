require 'spec_helper'

describe MoviesController do

  before :each do
    @fake_results = [double('movie1'), double('movie2')]
  end

  describe 'searching TMDb' do


    it 'should call the model method that performs TMDb search' do
      Movie.should_receive(:find_in_tmdb).with('Ted').and_return(@fake_results)
      post :search_tmdb, {:search_terms => 'Ted'}
    end

    it 'should select the Search Results template for rendering' do
      Movie.stub(:find_in_tmbd).and_return(@fake_results)
      post :search_tmdb, {:search_terms => 'Ted'}
      response.should render_template('search_tmdb')
    end

    it 'should make the TMDb search results available to that template' do
      Movie.stub(:find_in_tmdb).and_return(@fake_results)
      post :search_tmdb, {:search_terms => 'Ted'}
      assigns(:movies).should == @fake_results
    end
 
    it 'should have an empty array when no movies match the search' do
      post :search_tmdb, {:search_terms => 'This movies does not exist!!'} #search for a non-existant movie
      assigns(:movies).should == [] #empty array
    end

    it 'should not search if there is an invalid search term' do
      post :search_tmdb, {:search_terms => ''} #invalid search
      assigns(:movies).should == nil #no search, so nil search results
    end

  end #end 'searching TMDb'


end
