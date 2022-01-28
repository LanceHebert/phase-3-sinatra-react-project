class UsersController < ApplicationController 

    get '/users' do 
        User.all.to_json({include: :jobs})
    end

    # get '/users/:user' do
    #     user = User.find_by(params[:user.name]).id
    #     user.to_json({include: :jobs})
    # end

    post '/users' do 
        User.create(name: params[:name])
    end


    post '/users/:name' do        
            # find the user,once found,create Job.create(pass the params here)
            # User.find(x).Job.create(params here)
            formField= params[:formField]
            lang = params[:lang]
           
            user = User.find_by(name: params[:name])
            job= user.jobs.create(
                company_name: (formField[:company_name]),
                job_title: (formField[:job_title]),
                location: (formField[:location]),
                employment_type: (formField[:employment_type]),
                work_site: (formField[:work_site]),
                job_url: (formField[:job_url]),
                salary: (formField[:salary]),
            )
            lance = lang[:language].split(',').each do |single|
                job.languages.create(language: single) 
            end
           
            
            # .each(single=> job.languages.create(language: single))

        
            
        
    end

    delete '/users/:id' do 
        User.find_by(name: params[:name]).jobs
        
    end

    patch '/users/:id' do 
        User.find(params[:id]) 
        user.update(
            name: params[:name]
        ).to_json
    end

end