class Api::V1::SellingsController < ApplicationController

  def index 
    

    
    @sellings = Api::V1::Selling.all
    render json: @sellings
    
  end


  def create
    

    
      @selling = Api::V1::Selling.new(selling_params)
      @image = Cloudinary::Uploader.upload(params[:image_url])
  
      @selling.update(image_url: @image["url"])
      
     
      
      if @selling.save 

        render json: @selling 
      else 
        render json: {error: "Error proccessing form"}
      end  
  end

  def show 
        
    @selling = Api::V1::Selling.find(params[:id])
      

      
    render json: @selling 
    
  end

  def update
    if @api_v1_selling.update(selling_params)
      render json: @api_v1_selling
    else
      render json: @api_v1_selling.errors, status: :unprocessable_entity
    end
  end





  private


  def selling_params
    params.permit(:image_url, :location, :description, :title, :condition,:size, :category, :brand, :price,:user_id)
  end


end
