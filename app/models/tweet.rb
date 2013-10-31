class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps
  #include TweetsPerGender
  #include TweetsPerHour
  #include TweetsPerLocation

  field :name, :type => String
  field :username, :type => String
  field :user_id, :type => Integer
  field :tweeted_at, :type => Time
  field :lang, :type =>String
  field :country_code, :type => String
  #  field :geo_enabled, :type => Boolean
  #  field :coordinates, :type => String
  field :location, :type => String #Not found for now
  field :text, :type => String
  field :hashtags, :type => Array
  field :links, :type => Array
  field :retweet_count, :type => Integer
  field :in_reply_to_screen_name, :type => String
  field :favorited, :type=> Boolean
  field :followers, :type => Integer
  field :friends, :type => Integer
  field :gender, :type =>String

  attr_protected
  #attr_accessible :id, :term_id, :text, :lang, :user, :geo, :retweeted, :created_at, :updated_at

  belongs_to :term
  
  def self.map_tweets_per_gender
    <<-EOS
    function() {
      emit(this.gender, 1);
    }
    EOS
  end

  def self.reduce_tweets_per_gender
    <<-EOS
    function(key, values) {
      var count = 0;

      for(i in values) {
        count += values[i]
      }

      return count;
    }
    EOS
  end

  def self.map_tweets_per_time
    <<-EOS
    function() {
      var time = this.tweeted_at.getTime();
      emit(time, 1);
    }
    EOS
  end

  def self.reduce_tweets_per_time
    <<-EOS
    function(key, values) {
      var count = 0;

      for(i in values) {
        count += values[i]
      }

      return count;
    }
    EOS
  end

end
