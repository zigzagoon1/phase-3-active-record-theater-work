class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        actors = []
        self.auditions.each do |audition|
            if audition.actor.hired
                actors << audition.actor
            end
        end
    end

    def locations 
        locations = []
        self.auditions.each do |audition|
            locations << audition.location
        end
    end

    def lead 
        self.auditions.each do |audition|
            if audition.actor.hired
                audition.actor
            else
                "no actor has been hired for this role"
            end
        end
    end

    def understudy
        if self.lead == "no actor has been hired for this role"
            "no actor has been hired for understudy for this role"
        else 
            self.auditions.each do |audition|
                if audition.actor.hired && audition.actor != self.lead
                    audition.actor
                else 
                    "no actor has been hired for understudy for this role"
                end
            end
        end
    end
end