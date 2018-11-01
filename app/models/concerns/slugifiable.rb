module Slugifiable
    module ClassMethods
        def find_by_slug(phrase)
            self.all.find { |i| i.slug == phrase}
        end
    end

    module InstanceMethods
        def slug
            self.name.gsub(/[^A-Za-z0-9 ]/,'').gsub(/[ ]/, "-").downcase
        end
    end
end