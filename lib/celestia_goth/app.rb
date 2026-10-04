require 'sinatra/base'
require_relative 'hex_to_hsb'
require_relative 'report_generator'

module CelestiaGoth
  class App < Sinatra::Base
    set :public_folder, File.expand_path('../../public', __dir__)
    set :views, File.expand_path('../../views', __dir__)
    set :port, 9300

    # Diccionario de episodios con su villano y color principal (Nightmare Moon para ep1)
    EPISODES = {
      1 => { title: "Friendship is Magic, part 1", villain: "Nightmare Moon", color: "#191970" },
      2 => { title: "Friendship is Magic, part 2", villain: "Nightmare Moon", color: "#191970" },
      # Add more as needed...
    }

    get '/' do
      @episodes = EPISODES
      erb :index
    end

    get '/game/:ep' do
      ep_id = params[:ep].to_i
      @episode = EPISODES[ep_id] || { title: "Unknown", villain: "Unknown", color: "#000000" }
      @hsb_color = CelestiaGoth::HexToHsb.convert(@episode[:color])
      erb :game
    end

    get '/report/:ep' do
      ep_id = params[:ep].to_i
      @episode = EPISODES[ep_id] || { title: "Unknown", villain: "Unknown", color: "#000000" }
      
      pdf_data = CelestiaGoth::ReportGenerator.generate(ep_id, @episode)
      content_type 'application/pdf'
      attachment "Reporte_Audio_MLP_Ep#{ep_id}.pdf"
      pdf_data
    end
  end
end
