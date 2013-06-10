class HomeController < ApplicationController
  def index

  	if params.key?(:win)
  		@id=params[:id]
 		game=Game.find(@id)
  		game.steps = params[:c].to_i
  		game.winner= params[:win]
  		game.save
  		if params[:win]=="Server"
  			pitch = Pitch.new player: "Browser", all: 1, take: 1, game_id: game.id
			pitch.save
		end
  		if (game.save)
  			redirect_to ('/games/' + params[:id])
  		end
  	else
  	end 
	
	@games = Game.limit(10).order("created_at DESC")
	@pitches=Pitch.all
  end

  def welcome
  end
  def indexone 
  end  
  def redirector

 		if params[:id].to_i>0
 			@gid=params[:id]
 			game=Game.find(@gid)
			pitch = Pitch.new player: "Browser", all: (params[:a].to_i+params[:b].to_i), take: params[:b].to_i, game_id: game.id
			pitch.save	
		else
			game = Game.new 
			game.save
			if params[:b].to_i!=0
				pitch = Pitch.new player: "Browser", all: (params[:a].to_i+params[:b].to_i), take: params[:b].to_i, game_id: game.id
				pitch.save
			end
		end
		
		@k=params[:a].to_i
		@c=params[:c].to_i
		@c=@c+1

		if (@k==3) 
			@b=2
		elsif ((@k==2)||(@k==1))
		 	@b=1
		else 
			@b=rand(3) + 1
		end

		pitch = Pitch.new player: "Server", all: @k, take: @b, game_id: game.id
		pitch.save
		redirect_to ('/home/welcome/'+ '?a=' + (@k-@b).to_s + "&b=" + @b.to_s + "&c=" + @c.to_s + "&id=" + game.id.to_s)
 	end 	
end
