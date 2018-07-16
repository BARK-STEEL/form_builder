class FormsController < ApplicationController

  def index
    @forms = Form.all
  end

  def show
    @form = Form.find(params[:id])
  end

  def new
    @form = Form.new
    @form.form_fields.build
  end

  def create
    binding.pry
    @form = Form.new(form_params)
    binding.pry
    if @form.save
      flash[:notice] = "Successfully created form."
      redirect_to @form
    else
      render :action => 'new'
    end
  end

  def edit
    @form = Form.find(params[:id])
  end

  def update
    @form = Form.find(params[:id])
    if @form.update_attributes(form_params)
      flash[:notice] = "Successfully updated form."
      redirect_to @form
    else
      render :action => 'edit'
    end
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    flash[:notice] = "Successfully destroyed form."
    redirect_to forms_url
  end

  def sort_fields
    @form = Form.find(params[:id])
    params[:form_fields].each_with_index do |id, index|
      @form.form_fields.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  def form_params
    params.require(:form).permit(:name, :email, :description, :published,
      :form_field_attributes => [:label, :tag, :required, :position, :_destroy])
  end

end
