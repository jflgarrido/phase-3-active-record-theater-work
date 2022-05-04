class Role < ActiveRecord::Base
    has_many :auditions
    def actors
        self.auditions.map do |t|
            t.actor
        end
    end
    def locations
        actor_location = []
        self.auditions.each do |t|
            actor_location << t.location
        end
        return actor_locations
    end
    def lead
        hired_filter = self.auditions.filter do |t|
            t.hired == true
        end
        if (hired_filter.size != 0 && hired_filter.size > 0)
            return hired_filter.first
        else
            return 'no actor has been hired for this role'
        end
    end
    def understudy
        hired_filter = self.auditions.filter do |t|
            t.hired == true
        end
        if (hired_filter.size != 0 && hired_filter.size > 1)
            return hired_filter.second
        else
            return 'no actor has been hired for this role'
        end
    end
end