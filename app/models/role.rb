class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        auditions.map {|a| a.actor}
    end

    def locations
        auditions.map {|a| a.location}
    end

    def lead
        auditions.find_by(hired: true)
    end

    def understudy
        auditions.where(hired: true).second
    end
end