class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        auditions.map {|a| a.actor}
    end

    def locations
        auditions.map {|a| a.location}
    end

    def lead
        audition.find_by(hired: true) || 'no actor has been hired for this role'
    end

    def understudy
        audtion.where(hired: true).second || 'no actor has been hired for this role'
    end
    


end