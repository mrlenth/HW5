require 'spec_helper'

describe Movie do

  describe 'creating movie from TMDb' do
    it 'should create a movie in the database with TMDb information' do

      movie = Movie.create_from_tmdb(72105) #Ted's tmdb_id is 72105

      movie[:title].should == 'Ted' #so the title should match 'Ted'
      movie[:rating].should == 'G' #rating is forced to be 'G'
      movie[:release_date].should == '2012-06-28 00:00:00' #release date should match
      
    end
  end
 

end

