require_relative './concerns/slugifiable.rb'
class Artist < ActiveRecord::Base
    has_many :songs

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end

