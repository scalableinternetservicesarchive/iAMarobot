class AnnotationsController < ApplicationController
 
  def create
    @annotation = Annotation.find_or_create_by(annotation_params)
    if @annotation.save
      #if annotation successfully created
      redirect_to photos_path , notice: "You tagged a photo"
    else
      render action: "new"
    end
    #flash[:notice] = "You tagged this photo!"
    #redirect_to photo_path
  end
  
  def index
   @annotations = Annotation.all
  end
  
  def new
    @annotation = Annotation.new
  end
  
  def show
  end
  
  private

  #Permitted parameters when creating a photo. This is used for security reasons.
  def annotation_params
    params.require(:annotation).permit(:label)
  end
  
end
