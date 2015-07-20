class PokemonsController < ApplicationController
	def index
		@pokemons = Pokemon.all
	end

	def show
		@pokemon = Pokemon.find(params[:id])
	end

	def new
		@pokemon = Pokemon.new
	end

	def edit
		@pokemon = Pokemon.find(params[:id])
	end


	def create
		@pokemon = Pokemon.new(pokemon_params)

		if @pokemon.save
			redirect_to @pokemon
		else
			render 'new'
		end
	end

	def update
	  @pokemon = Pokemon.find(params[:id])
	 
	  if @pokemon.update(pokemon_params)
	    redirect_to @pokemon
	  else
	    render 'edit'
		end
	end

	def destroy
		@pokemon = Pokemon.find(params[:id])
		@pokemon.destroy

		redirect_to pokemons_path
	end

	private
		def pokemon_params
			params.require(:pokemon).permit(:name, :element_text, :power_level)
		end
end
