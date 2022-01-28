class User < ActiveRecord::Base 
    has_many :user_jobs
    has_many :joblangs 
    has_many :jobs, through: :user_jobs
    has_many :languages, through: :joblangs

    def highest_salary 
        self.jobs.order(:salary).max
    end
 

end