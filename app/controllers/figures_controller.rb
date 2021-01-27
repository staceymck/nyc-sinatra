class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect to "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])

    if !params[:title][:name].empty?
      figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect to "/figures/#{figure.id}"
  end
end

# params = {
#   "figure" => {"name" => "Moses", "title_ids" => [1, 2, 5], "landmark_ids" => [1, 3, 5]},
#   "title" => {"name" => "Prez"},
#   "landmark" => {"name" => "flatiron", "year_completed" => "1991"}
# }
